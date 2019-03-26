library(growth)


### Name: rmaov
### Title: Split-plot ANOVA Model
### Aliases: rmaov
### Keywords: models

### ** Examples


# vision data for 7 individuals, with response a 7x8 matrix
# two levels of nesting: 4 levels of power for each eye
y <- matrix(rnorm(56),ncol=8)
tvc <- data.frame(eye=c(rep(1,4),rep(2,4)),power=c(1:4,1:4))
summary(rmaov(y, tvc))




