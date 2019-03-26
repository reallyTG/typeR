library(reweight)


### Name: reweight
### Title: Adjust survey respondent weights
### Aliases: reweight print.reweight summary.reweight plot.reweight
### Keywords: survey

### ** Examples

data(pumswgt)
r1 <- reweight(pumswgt$ori,pumswgt$mar,pumswgt$wgt)
plot(r1)
summary(r1)
r2 <- reweight(pumswgt$ori,pumswgt$mar,pumswgt$raw)
plot(r2)
summary(r2)
w <- print(r2)



