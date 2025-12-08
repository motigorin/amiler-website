#!/bin/bash

# Amiler Medical Aesthetic - Deployment Script
# This script prepares the website for production deployment

echo "🚀 Starting deployment preparation for Amiler Medical Aesthetic..."

# Create directories if they don't exist
mkdir -p assets/images
mkdir -p assets/fonts

# Generate placeholder icons for PWA (in a real deployment, replace with actual icons)
echo "📱 Setting up PWA icons..."

# Create .htaccess for Apache servers (optional)
cat > .htaccess << 'EOF'
# Amiler Medical Aesthetic - Apache Configuration

# Force HTTPS
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Cache static assets
<IfModule mod_expires.c>
    ExpiresActive on
    ExpiresByType text/css "access plus 1 year"
    ExpiresByType application/javascript "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
    ExpiresByType image/webp "access plus 1 year"
    ExpiresByType font/woff "access plus 1 year"
    ExpiresByType font/woff2 "access plus 1 year"
</IfModule>

# Gzip compression
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
    AddOutputFilterByType DEFLATE image/svg+xml
</IfModule>

# Security headers
<IfModule mod_headers.c>
    Header always set X-Frame-Options DENY
    Header always set X-Content-Type-Options nosniff
    Header always set X-XSS-Protection "1; mode=block"
    Header always set Referrer-Policy "strict-origin-when-cross-origin"
    Header always set Feature-Policy "camera 'none'; microphone 'none'; geolocation 'self'"
</IfModule>

# Custom 404 page
ErrorDocument 404 /404.html
EOF

# Create a simple 404 page
cat > 404.html << 'EOF'
<!DOCTYPE html>
<html lang="he" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>עמוד לא נמצא - Amiler Medical Aesthetic</title>
    <style>
        body {
            font-family: 'Noto Sans Hebrew', sans-serif;
            background: linear-gradient(135deg, #f5f1eb 0%, #ffffff 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #2c2c2c;
        }
        .container {
            max-width: 500px;
            padding: 2rem;
        }
        h1 {
            font-size: 6rem;
            margin: 0;
            color: #c9a96e;
            font-weight: 700;
        }
        h2 {
            font-size: 2rem;
            margin: 1rem 0;
            font-weight: 600;
        }
        p {
            font-size: 1.125rem;
            margin: 1.5rem 0;
            color: #666;
            line-height: 1.6;
        }
        .btn {
            display: inline-block;
            background: linear-gradient(135deg, #c9a96e, #b5956a);
            color: white;
            padding: 0.75rem 1.5rem;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            transition: transform 0.3s ease;
        }
        .btn:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>404</h1>
        <h2>העמוד לא נמצא</h2>
        <p>מצטערים, העמוד שחיפשתם לא קיים או הועבר למיקום אחר.</p>
        <a href="/" class="btn">חזור לעמוד הבית</a>
    </div>
</body>
</html>
EOF

# Create deployment checklist
cat > DEPLOYMENT_CHECKLIST.md << 'EOF'
# 🚀 Deployment Checklist for Amiler Medical Aesthetic

## Pre-Deployment
- [ ] Update all contact information
- [ ] Replace placeholder images with real ones
- [ ] Test all forms and WhatsApp integration
- [ ] Verify phone numbers and links
- [ ] Check Hebrew text content
- [ ] Optimize all images (WebP format recommended)
- [ ] Test on multiple devices and browsers

## DNS & Hosting
- [ ] Configure DNS records
- [ ] Set up SSL certificate
- [ ] Enable HTTPS redirect
- [ ] Configure CDN (if using)
- [ ] Set up domain forwarding if needed

## Performance
- [ ] Run Google PageSpeed Insights
- [ ] Test with GTmetrix
- [ ] Verify Lighthouse scores (aim for 90+)
- [ ] Check Web Vitals
- [ ] Test loading speed on mobile

## SEO Setup
- [ ] Submit sitemap to Google Search Console
- [ ] Submit sitemap to Bing Webmaster Tools
- [ ] Set up Google Analytics
- [ ] Configure Google My Business
- [ ] Add structured data markup

## Security
- [ ] Enable security headers
- [ ] Set up Content Security Policy
- [ ] Configure firewall rules
- [ ] Enable bot protection
- [ ] Set up monitoring

## PWA Configuration
- [ ] Test Service Worker functionality
- [ ] Verify manifest.json
- [ ] Test offline functionality
- [ ] Verify app installation
- [ ] Test push notifications

## Testing
- [ ] Cross-browser testing
- [ ] Mobile responsiveness
- [ ] Accessibility testing (screen readers)
- [ ] Form submissions
- [ ] Contact methods (phone, WhatsApp, email)

## Post-Deployment
- [ ] Monitor error logs
- [ ] Check analytics setup
- [ ] Verify search engine indexing
- [ ] Test backup procedures
- [ ] Document maintenance procedures

## Contact Information Verification
- [ ] Phone: 0548917070
- [ ] Email: 20natalili20@gmail.com
- [ ] Address: בית האומות, דרך חברון 101, ירושלים
- [ ] Hours: א׳-ה׳ 10:00-18:00
- [ ] WhatsApp: +972548917070
EOF

# Create performance optimization guide
cat > PERFORMANCE_GUIDE.md << 'EOF'
# ⚡ Performance Optimization Guide

## Image Optimization
```bash
# Convert images to WebP
cwebp input.jpg -q 80 -o output.webp

# Optimize PNG
pngquant --quality=70-85 input.png --output output.png

# Optimize JPEG
jpegoptim --max=85 --strip-all input.jpg
```

## CSS Optimization
- Minify CSS files
- Remove unused CSS
- Use critical CSS inlining
- Combine CSS files

## JavaScript Optimization
- Minify JavaScript
- Remove unused code
- Use async/defer for non-critical scripts
- Implement code splitting

## Caching Strategy
```apache
# Browser caching (1 year for static assets)
<IfModule mod_expires.c>
    ExpiresActive on
    ExpiresByType text/css "access plus 1 year"
    ExpiresByType application/javascript "access plus 1 year"
    ExpiresByType image/* "access plus 1 year"
</IfModule>
```

## CDN Configuration
- Use CloudFlare or similar CDN
- Enable Brotli compression
- Configure auto-minification
- Set up image optimization

## Monitoring
- Google PageSpeed Insights
- GTmetrix
- WebPageTest
- Pingdom
- Lighthouse CI
EOF

echo "✅ Deployment preparation complete!"
echo "📁 Files created:"
echo "   - .htaccess (Apache configuration)"
echo "   - 404.html (Custom error page)"
echo "   - DEPLOYMENT_CHECKLIST.md"
echo "   - PERFORMANCE_GUIDE.md"
echo ""
echo "🚀 Next steps:"
echo "1. Replace placeholder images with actual photos"
echo "2. Update contact information if needed"
echo "3. Upload to your web server"
echo "4. Configure SSL certificate"
echo "5. Submit sitemap to search engines"
echo ""
echo "📞 Contact: 0548917070 | 📧 20natalili20@gmail.com"
