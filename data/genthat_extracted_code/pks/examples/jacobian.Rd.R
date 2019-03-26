library(pks)


### Name: jacobian
### Title: Jacobian Matrix for Basic Local Independence Model
### Aliases: jacobian
### Keywords: models

### ** Examples

data(endm)
blim1 <- blim(endm$K2, endm$N.R)

## Test of identifiability
J <- jacobian(blim1)
dim(J)
qr(J)$rank



