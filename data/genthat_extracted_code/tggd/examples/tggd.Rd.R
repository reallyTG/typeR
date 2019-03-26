library(tggd)


### Name: tggd
### Title: The Truncated Generalised Gamma Distribution
### Aliases: tggd dtggd ptggd qtggd rtggd
### Keywords: ~tggd ~distribution

### ** Examples

r <- rtggd(100,a=-2)
hist(log10(r))

##Ideally the output below should equal 1, in practice it will be very close:
qtggd(ptggd(r))/r

#These should be the same:
integrate(dtggd,lower=1e10,upper=1e11,a=-1.5,b=0.7,xmin=1e10)
ptggd(1e11,a=-1.5,b=0.7,xmin=1e10)

#This should be very close to 1 (for a true PDF):
ptggd(1e18,a=-1.5,b=0.7,xmin=1e10)

#To show the link to the log10 (called log) and ln variants (and the slight inaccuracies)
#these outputs should be a sequence from 0 to 1 (by=0.1):
ptggd(10^qtggd_log(seq(0,1,by=0.1)))
ptggd(exp(qtggd_ln(seq(0,1,by=0.1))))




