library(ReIns)


### Name: MeanExcess
### Title: Mean excess function
### Aliases: MeanExcess

### ** Examples

data(norwegianfire)

# Mean excess plots for Norwegian Fire Insurance data for claims in 1976.

# Mean excess values as a function of k
MeanExcess(norwegianfire$size[norwegianfire$year==76], k=TRUE)

# Mean excess values as a function of the data
MeanExcess(norwegianfire$size[norwegianfire$year==76], k=FALSE)




