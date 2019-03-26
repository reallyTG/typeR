library(PHYLOGR)


### Name: matrix.D
### Title: Produce the Matrix D of Garland and Ives (2000) for GLS
### Aliases: matrix.D
### Keywords: array

### ** Examples

#perform GLS using lm function after transforming the variables
data(Lacertid.varcov)
mD <- matrix.D(Lacertid.varcov)
data(Lacertid.Original)
# obtain transformed variables
Z <- mD %*% Lacertid.Original$clutch.size
U <- mD %*% cbind(rep(1,18),Lacertid.Original$svl) # intercept included
lm1 <- lm(Z ~ U - 1) # eliminate intercept, since already included in U matrix
summary(lm1)



