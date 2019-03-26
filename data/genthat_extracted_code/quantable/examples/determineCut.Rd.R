library(quantable)


### Name: determineCut
### Title: determine best Accuracy cuttoff
### Aliases: determineCut

### ** Examples

library(pROC)
cases <- rnorm(100,-1,1.1)
controls <- rnorm(500,1,1.1)
cut <- determineCut(cases,controls)
makeROCplot(cases,controls,abline=cut)




