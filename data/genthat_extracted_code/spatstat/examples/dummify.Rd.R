library(spatstat)


### Name: dummify
### Title: Convert Data to Numeric Values by Constructing Dummy Variables
### Aliases: dummify
### Keywords: math

### ** Examples

   chara <- sample(letters[1:3], 8, replace=TRUE)
   logi <- (runif(8) < 0.3)
   comp <- round(4*runif(8) + 3*runif(8) * 1i, 1)
   nume <- 8:1 + 0.1
   df <- data.frame(nume, chara, logi, comp)
   df
   dummify(df)



