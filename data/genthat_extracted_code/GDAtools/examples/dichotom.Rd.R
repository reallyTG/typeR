library(GDAtools)


### Name: dichotom
### Title: Dichotomizes the variables in a data frame
### Aliases: dichotom
### Keywords: multivariate misc

### ** Examples

## Dichotomizes 'Music' example data frame
data(Music)
dic <- dichotom(Music[,1:5])
str(dic)

## with output variables in factor format
dic <- dichotom(Music[,1:5], out='factor')
str(dic)



