library(lasso2)


### Name: summary.l1ce
### Title: Summary Method for "l1ce" Objects (Regression with L1
###   Constraint)
### Aliases: summary.l1ce print.summary.l1ce
### Keywords: regression

### ** Examples

data(Prostate)
summary(l1ce(lpsa ~ .,Prostate))

# Produces the following output:
## Not run: 
##D Call:
##D  l1ce(formula = lpsa ~ ., data = Prostate)
##D Residuals:
##D     Min      1Q Median    3Q  Max
##D  -1.636 -0.4119  0.076 0.452 1.83
##D 
##D 
##D Coefficients:
##D              Value Std. Error Z score Pr(>|Z|)
##D (Intercept) 0.7285 1.3898     0.5242  0.6002
##D      lcavol 0.4937 0.0919     5.3711  0.0000
##D     lweight 0.2682 0.1774     1.5115  0.1307
##D         age 0.0000 0.0111     0.0000  1.0000
##D        lbph 0.0093 0.0587     0.1581  0.8744
##D         svi 0.4551 0.2525     1.8023  0.0715
##D         lcp 0.0000 0.0947     0.0000  1.0000
##D     gleason 0.0000 0.1685     0.0000  1.0000
##D       pgg45 0.0002 0.0046     0.0391  0.9688
##D 
##D 
##D Residual standard error: 0.7595 on 88.36 degrees of freedom
##D The relative L1 bound was      : 0.5
##D The absolute L1 bound was      : 0.9219925
##D The Lagrangian for the bound is:  13.05806
##D 
##D 
##D Correlation of Coefficients:
##D         (Intercept)  lcavol lweight     age    lbph     svi     lcp gleason
##D  lcavol  0.1988
##D lweight -0.4815     -0.2071
##D     age -0.3938     -0.0603 -0.0974
##D    lbph  0.3629     -0.0201 -0.5165 -0.1303
##D     svi -0.0624     -0.2273 -0.1442  0.0635  0.0648
##D     lcp  0.0457     -0.4153  0.0598  0.0665  0.0632 -0.3779
##D gleason -0.7666     -0.2009  0.1163 -0.0774 -0.0617  0.1084 -0.0243
##D   pgg45  0.4988      0.0956 -0.0380 -0.0630 -0.1111 -0.1921 -0.2935 -0.6526
## End(Not run)



