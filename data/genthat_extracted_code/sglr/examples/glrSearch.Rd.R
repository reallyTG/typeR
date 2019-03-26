library(sglr)


### Name: glrSearch
### Title: This function searches through a space of design boundaries
###   (scalar values a and b) to find values that achieve close to
###   specified type I and type II errors for the sequential generalized
###   likelihood ratio test of p0 versus p1 (specified respectively as
###   vector of length 2) in pre-licensure vaccine trials
### Aliases: glrSearch
### Keywords: design

### ** Examples

library(sglr)
result <- glrSearch(p=c(.5, .75), alpha=0.05, beta=0.10)

result <- glrSearch(p=c(.5, .75), alpha=0.05, beta=0.10, verbose=TRUE)

result <- glrSearch(p=c(.5, .75), alpha=0.05, beta=0.10, gridIt=TRUE)
print(result$alphaTable)
print(result$betaTable)

## takes a while
result <- glrSearch(p=c(.5, 2/3), alpha=0.05, beta=0.10)
print(names(result))

##result <- glrSearch(p=c(.5, 2/3), alpha=0.05, beta=0.10, gridIt=TRUE)
##print(result$alphaTable)
##print(result$betaTable)



