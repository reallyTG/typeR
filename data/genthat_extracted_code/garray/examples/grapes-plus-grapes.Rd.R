library(garray)


### Name: %+%
### Title: Function composition operator
### Aliases: %+%

### ** Examples

lse <- log%+%sum%+%exp
lse(1:10)
#logsumexp(1:10)	# actual logsumexp() is more sophistic
log(sum(exp(1:10)))
sum <- sd
lse(1:10)	# lse() is fixed at definition
log(sum(exp(1:10)))
(log%+%sum%+%exp)(1:10)	# now is (log%+%sd%+%exp)



