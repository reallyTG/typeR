library(Hotelling)


### Name: alr
### Title: Additive log ratio transformation
### Aliases: alr
### Keywords: transformation

### ** Examples


data(bottle.df)

## transform with respect to manganese
alr(Mn~., bottle.df, "Number")

## transform the data with respect to barium, but removing the
## grouping in column 1
alr(Ba~., bottle.df[,-1])



