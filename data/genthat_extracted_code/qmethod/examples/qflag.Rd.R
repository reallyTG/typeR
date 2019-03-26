library(qmethod)


### Name: qflag
### Title: Q methodology: automatic flagging of Q-sorts
### Aliases: qflag

### ** Examples

data(lipset)
library(psych)
loa <- as.data.frame(unclass(principal(lipset[[1]], nfactors = 3, 
                                       rotate = "varimax")$loadings))
flagged <- qflag(loa = loa, nstat = nrow(lipset[[1]]))
summary(flagged)



