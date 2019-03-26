library(CountsEPPM)


### Name: CountsEPPM-package
### Title: Fitting of EPPM models to count and binary data.
### Aliases: CountsEPPM-package
### Keywords: package

### ** Examples

data(herons.group)
initial <- c(1.9871533,1.9900881,3.6841305,0.4925816)
names(initial) <- c("Adult mean","Immature mean", "Variance","log(b)")
output.fn  <- CountsEPPM(number.attempts~0+group | 1, herons.group,initial=initial)
print(output.fn)



