library(marg)


### Name: rsm.diag.plots
### Title: Diagnostic Plots for Regression-Scale Models
### Aliases: rsm.diag.plots plot.rsm
### Keywords: hplot models regression

### ** Examples

## Sea Level Data
data(venice)
attach(venice)
Year <- 1:51/51
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.rsm <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                  family = extreme)
## Not run: 
##D rsm.diag.plots(venice.rsm, which = 3)
## End(Not run)
## or
## Not run: 
##D plot(venice.rsm)
## End(Not run)
## menu-driven
##
rsm.diag.plots(venice.rsm, which = 5, las = 1)
## normal QQ-plot of r* residuals 
## Not run: 
##D rsm.diag.plots(venice.rsm, which = 7, iden = T, labels = paste(1931:1981))
## End(Not run)
## year 1932 highly influential
detach()



