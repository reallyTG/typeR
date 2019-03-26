library(tggd)


### Name: tggd_ln
### Title: The Truncated Generalised Gamma Distribution
### Aliases: tggd_ln dtggd_ln ptggd_ln qtggd_ln rtggd_ln
### Keywords: ~tggd_ln ~distribution

### ** Examples

r <- rtggd_ln(100,a=-2)
hist(r)

##Ideally the output below should equal 0, in practice it will be very close:
qtggd_ln(ptggd_ln(r))-r

#These should be the same:
integrate(dtggd_ln,lower=log(1e10),upper=log(1e11),a=-1.5,b=0.7,xmin=log(1e10))
ptggd_ln(log(1e11),a=-1.5,b=0.7,xmin=log(1e10))

#This should be very close to 1 (for a true PDF):
ptggd_ln(log(1e18),a=-1.5,b=0.7,xmin=log(1e10))

#To show the link to the linear and log10 (called log) variants (and the slight
#inaccuracies) these outputs should be a sequence from 0 to 1 (by=0.1):
ptggd_log(log10(qtggd(seq(0,1,by=0.1))))
ptggd_log(qtggd_ln(seq(0,1,by=0.1))/log(10))



