library(Hotelling)


### Name: clr
### Title: Centered log ratio transformation
### Aliases: clr
### Keywords: transformation

### ** Examples


data(bottle.df)

## transform preserving grouping
clr(bottle.df, "Number")

## transform the data but remove the
## grouping in column 1
clr(bottle.df[,-1])




