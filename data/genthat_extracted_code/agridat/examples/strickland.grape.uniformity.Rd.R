library(agridat)


### Name: strickland.grape.uniformity
### Title: Uniformity trial of grape
### Aliases: strickland.grape.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(strickland.grape.uniformity)
##D dat <- strickland.grape.uniformity
##D 
##D   require(desplot)
##D   desplot(yield ~ col*row, dat,
##D           main="strickland.grape.uniformity",
##D           flip=TRUE, aspect=(31*8)/(5*10) )
##D   
##D   # CV 43.4##D 
##D   sd(dat$yield, na.rm=TRUE)/mean(dat$yield, na.rm=TRUE)
##D   
##D   # anova like Strickland, appendix 1
##D   anova(aov(yield ~ factor(row) + factor(col), data=dat))
##D 
##D   # numbers ending in .5 much more common than .0
##D   # table(substring(format(na.omit(dat$yield)),4,4))
##D   #  0   5 
##D   # 25 100 
##D 
## End(Not run)



