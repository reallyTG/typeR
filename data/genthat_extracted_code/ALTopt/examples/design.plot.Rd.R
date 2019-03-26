library(ALTopt)


### Name: design.plot
### Title: Design plot.
### Aliases: design.plot

### ** Examples

## Not run: 
##D # Design plot of D optimal design with right censoring.
##D Design1 <- altopt.rc("D", 100, 100, 2, 1, formula = ~ x1 + x2 + x1:x2,
##D coef = c(0, -4.086, -1.476, 0.01))
##D 
##D design.plot(Design1$opt.design.rounded, x1, x2)
## End(Not run)



