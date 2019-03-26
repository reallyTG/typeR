library(addhaz)


### Name: LRTest
### Title: Perform likelihood ratio test
### Aliases: LRTest
### Keywords: ~models ~regression

### ** Examples

  data(disabData)

  ## Comparing two binomial models

  fit1 <- BinAddHaz(dis.bin ~ diab + arth + stro , data = disabData, weights = wgt,
                    attrib = FALSE)

  diseases <- as.matrix(disabData[,c("diab", "arth", "stro")])
  fit2 <- BinAddHaz(dis.bin ~ factor(age) -1 + diseases:factor(age), data = disabData,
                    weights = wgt, attrib = FALSE)

  LRTest(fit2, fit1)

  ## Comparing two multinomial models
## Not run: 
##D   fit3 <- MultAddHaz(dis.mult ~ diab + arth + stro , data = disabData, weights = wgt,
##D                      attrib = FALSE)
##D   fit4 <- MultAddHaz(dis.mult ~ factor(age) -1 + diseases: factor(age), data = disabData,
##D                      weights = wgt, attrib = FALSE)
##D   LRTest(fit4, fit3)
## End(Not run)



