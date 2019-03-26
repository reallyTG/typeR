library(hoa)


### Name: nlreg.diag
### Title: Nonlinear Heteroscedastic Model Diagnostics
### Aliases: nlreg.diag
### Keywords: regression nonlinear

### ** Examples

library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2, 
                     data=calcium, start = c(b0 = 4, b1 = 0.1, g = 1), 
                     hoa = TRUE )
##
calcium.diag <- nlreg.diag( calcium.nl )
plot( calcium.diag, which = 9 )
##
calcium.diag <- nlreg.diag( calcium.nl, hoa = FALSE, infl = FALSE)
plot(calcium.diag, which = 9)
## Not available



