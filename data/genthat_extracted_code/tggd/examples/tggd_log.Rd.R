library(tggd)


### Name: tggd_log
### Title: The Truncated Generalised Gamma Distribution
### Aliases: tggd_log dtggd_log ptggd_log qtggd_log rtggd_log
### Keywords: ~tggd_log ~distribution

### ** Examples

r <- rtggd_log(100,a=-2)
hist(r)

##Ideally the output below should equal 0, in practice it will be very close:
qtggd_log(ptggd_log(r))-r

#These should be the same:
integrate(dtggd_log,lower=10,upper=11,a=-1.5,b=0.7,xmin=10)
ptggd_log(11,a=-1.5,b=0.7,xmin=10)

#This should be very close to 1 (for a true PDF):
ptggd_log(18,a=-1.5,b=0.7,xmin=10)

#To show the link to the linear and ln variants (and the slight inaccuracies) these
#outputs should be a sequence from 0 to 1 (by=0.1):
ptggd_ln(log(qtggd(seq(0,1,by=0.1))))
ptggd_ln(qtggd_log(seq(0,1,by=0.1))*log(10))



