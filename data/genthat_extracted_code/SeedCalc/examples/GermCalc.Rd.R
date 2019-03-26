library(SeedCalc)


### Name: GermCalc
### Title: GermCalc Function
### Aliases: GermCalc
### Keywords: indexes

### ** Examples

time <- c(1,2,3,4,5,6,7,8,9,10)
rep1 <- c(0,2,4,15,25,38,45,50,50,50)
rep2 <- c(0,4,6,18,22,39,40,48,50,50)
germdata <- data.frame(time,rep1,rep2)
GermCalc(germdata, 50)



