library(irr)


### Name: maxwell
### Title: Maxwell's RE coefficient for binary data
### Aliases: maxwell
### Keywords: univar

### ** Examples

data(anxiety)
# Median-split to generate binary data
r1 <- ifelse(anxiety$rater1<median(anxiety$rater1),0,1)
r2 <- ifelse(anxiety$rater2<median(anxiety$rater2),0,1)
maxwell(cbind(r1,r2))



