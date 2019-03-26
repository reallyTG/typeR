library(robCompositions)


### Name: aDist
### Title: Aitchison distance
### Aliases: aDist iprod iprod
### Keywords: arith math

### ** Examples


data(expenditures)
x <- xOrig <- expenditures
## Aitchison distance between two 2 observations:
aDist(x[1, ], x[2, ])

## Aitchison distance of x:
aDist(x)

## Example of distances between matrices:
## set some missing values:
x[1,3] <- x[3,5] <- x[2,4] <- x[5,3] <- x[8,3] <- NA

## impute them:
xImp <- impCoda(x, method="ltsReg")$xImp

## calculate the relative Aitchsion distance between xOrig and xImp:
aDist(xOrig, xImp)

data("expenditures") 
aDist(expenditures)  
x <- expenditures[, 1]
y <- expenditures[, 2]
aDist(x, y)
aDist(expenditures, expenditures)



