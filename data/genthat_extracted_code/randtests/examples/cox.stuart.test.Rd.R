library(randtests)


### Name: cox.stuart.test
### Title: Cox Stuart Trend Test
### Aliases: cox.stuart.test
### Keywords: randomness test

### ** Examples

##
## Example 1
## Conover (1999)
## The total annual precipitation recorded each year, for 19 years.
##
precipitation <- c(45.25, 45.83, 41.77, 36.26, 45.37, 52.25, 35.37, 57.16, 35.37, 58.32, 
41.05, 33.72, 45.73, 37.90, 41.72, 36.07, 49.83, 36.24, 39.90)
cox.stuart.test(precipitation)

##
## Example 2
## Sweet potato production, harvested in the United States, between 1868 and 1937.
##
data(sweetpotato)
cox.stuart.test(sweetpotato$production)



