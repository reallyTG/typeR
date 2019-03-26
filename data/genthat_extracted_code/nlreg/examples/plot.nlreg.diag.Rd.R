library(nlreg)


### Name: plot.nlreg.diag
### Title: Diagnostic Plots for Nonlinear Heteroscedastic Models
### Aliases: plot.nlreg.diag nlreg.diag.plots
### Keywords: regression nonlinear methods hplot

### ** Examples

library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2, 
                     start = c(b0 = 4, b1 = 0.1, g = 1), data = calcium, 
                     hoa = TRUE )
##
calcium.diag <- nlreg.diag( calcium.nl, trace = TRUE )
##
## menu-driven
## Not run: 
##D plot( calcium.diag )
##D ##
##D ##  Make a plot selection (or 0 to exit)
##D ##
##D ## 1:plot: Summary
##D ## 2:plot: Studentized residuals against fitted values
##D ## 3:plot: r* residuals against fitted values
##D ## 4:plot: Normal QQ-plot of studentized residuals
##D ## 5:plot: Normal QQ-plot of r* residuals
##D ## 6:plot: Cook statistic against h/(1-h)
##D ## 7:plot: Global influence against h/(1-h)
##D ## 8:plot: Cook statistic against observation number
##D ## 9:plot: Influence measures against observation number
##D ##
##D ## Selection:
## End(Not run)
##
## plot 5: Normal QQ-plot of r* residuals
plot( calcium.diag, which = 5, las = 1 )
##
nlreg.diag.plots( calcium.nl, which = 5, las = 1 )



