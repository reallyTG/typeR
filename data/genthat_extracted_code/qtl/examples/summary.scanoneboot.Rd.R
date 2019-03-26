library(qtl)


### Name: summary.scanoneboot
### Title: Bootstrap confidence interval for QTL location
### Aliases: summary.scanoneboot
### Keywords: utilities

### ** Examples

## Not run: 
##D data(fake.f2)
##D fake.f2 <- calc.genoprob(fake.f2, step=1, err=0.001)
##D bootoutput <- scanoneboot(fake.f2, chr=13, method="hk")
##D 
##D summary(bootoutput)
## End(Not run)



