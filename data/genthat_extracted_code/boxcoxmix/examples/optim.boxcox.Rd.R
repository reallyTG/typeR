library(boxcoxmix)


### Name: optim.boxcox
### Title: Response Transformations for Random Effect and Variance
###   Component Models
### Aliases: optim.boxcox
### Keywords: boxcox optim

### ** Examples

# The strength Data
data(strength, package = "mdscore")
maxlam <- optim.boxcox(y ~ cut*lot, data = strength, K = 3,  
           start = "gq" ,  find.in.range = c(-2, 2), s = 5)
# Maximum profile log-likelihood: 33.6795 at lambda= -0.4  

## No test: 
data(Oxboys, package = "nlme")
Oxboys$boy <- gl(26,9)
maxlamvc <- optim.boxcox(height ~  age, groups = Oxboys$boy,
                         data = Oxboys,   K = 2,  start = "gq",
                         find.in.range=c(-1.2,1), s=6, plot.opt = 0) 
maxlamvc$Maximum
#[1] -0.8333333
plot(maxlamvc,8)
## End(No test)








