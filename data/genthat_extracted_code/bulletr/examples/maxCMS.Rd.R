library(bulletr)


### Name: maxCMS
### Title: Number of maximum consecutively matching striae
### Aliases: maxCMS

### ** Examples

x <- rbinom(100, size = 1, prob = 1/3) 
CMS(x == 1) # expected value for longest match is 3
maxCMS(x==1)



