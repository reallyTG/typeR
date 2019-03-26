library(R330)


### Name: sport.df
### Title: Australian Institute of Sport
### Aliases: sport.df
### Keywords: datasets

### ** Examples

data(sport.df)
library(lattice)
xyplot(X.Bfat~BMI|sport*sex,xlab="BMI",ylab="X.Bfat",data=sport.df)



