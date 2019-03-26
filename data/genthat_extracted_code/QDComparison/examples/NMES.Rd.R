library(QDComparison)


### Name: NMES
### Title: National Medicare Expenditure Survey (NMES) Data on Cost of
###   Hospitalizations
### Aliases: NMES
### Keywords: datasets

### ** Examples

data(NMES)
## maybe str(NMES)
y <- NMES[,2]
x <- NMES[,1]
# Remove the 0s (as Venturini (2015) notes was necessary)
ind <- which(y==0)
x <- x[-ind]
y <- y[-ind]
hist(y[x==0])



