library(secrlinear)


### Name: subset.linearmask
### Title: Select Part of linearmask Object
### Aliases: subset.linearmask
### Keywords: manip

### ** Examples



## rbind two linear masks,
x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
xy2 <- data.frame(x = x*100, y = cos(x)*300)
test <- read.linearmask(data = xy, spacing = 10)
test2 <- read.linearmask(data = xy2, spacing = 10)
test3 <- rbind(test, test2)
table(covariates(test3)$LineID)

## then retrieve one... 
test4 <- subset(test3, LineID = '1.1')

## ... or the other
test5 <- subset(test3, LineID = '2.1')



