library(agridat)


### Name: baker.wheat.uniformity
### Title: Uniformity trial of wheat
### Aliases: baker.wheat.uniformity
### Keywords: datasets

### ** Examples


data(baker.wheat.uniformity)
dat <- baker.wheat.uniformity

require(desplot)
desplot(yield ~ col*row, dat,
        flip=TRUE, aspect=1,
        main="baker.wheat.uniformity")




