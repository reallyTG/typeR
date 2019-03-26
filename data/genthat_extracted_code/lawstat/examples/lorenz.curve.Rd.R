library(lawstat)


### Name: lorenz.curve
### Title: Lorenz Curve
### Aliases: lorenz.curve
### Keywords: dplot

### ** Examples


## Population Data of ratio of number of senators (second column) and 
## representatives (third column) to population size (first column) in 1963
## First column is treated as data argument.

data(data1963)

## Single weight Lorenz Curve using number of senators as weight argument.
lorenz.curve(data1963)

## Multiple weight Lorenz Curve using number of senators as weight argument.
lorenz.curve(data1963, mul=TRUE)

## Multiple weight Lorenz Curve using number of representatives 
## as weight argument.
lorenz.curve(data1963[,"pop1963"], data1963[,"rep1963"], mul=TRUE)




