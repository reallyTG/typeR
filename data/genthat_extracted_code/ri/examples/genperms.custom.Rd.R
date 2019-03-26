library(ri)


### Name: genperms.custom
### Title: Generates an approximate permutation matrix for an user-supplied
###   randomization function
### Aliases: genperms.custom
### Keywords: restricted randomization permutations randomization

### ** Examples

## Rejected randomization scheme: reject if and only if there is significant imbalance

X <- c(1:200)

randfun <- function() {
  teststat <- -1
	while (teststat < 0.05) {
		Zri <- sample(c(rep(0,180),rep(1,20))) # imbalanced design
		fstat <- summary(lm(Zri~X))$fstatistic
		teststat <- pf(fstat[1],fstat[2],fstat[3],lower.tail=FALSE)  # extract F-test p-value
			}
	return(Zri)
}
perms <- genperms.custom(numiter=10000, randfun=randfun) # generate permutations
probs <- genprob(perms) # generate approximate probabilities from permutation matrix
cor(probs,(X-mean(X))^2) # observations with extreme X are less likely to be treated



