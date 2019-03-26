library(orQA)


### Name: est.lme
### Title: Estimate order restricted variance components for a two way
###   mixed model with interaction.
### Aliases: est.lme
### Keywords: regression

### ** Examples

g <- rep(1:4,each=10)
r <- rep(rep(1:2,each=5),4)

## No differences (global null)
nulldata <- matrix(rnorm(400),nc=40)

## estimation
res <- est.lme(nulldata,g,r)
round(apply(res,2,summary),2)



