library(dafs)


### Name: kent.df
### Title: Chest deflection tolerance
### Aliases: kent.df
### Keywords: datasets

### ** Examples

data(kent.df)

##recode the response fracture to minor injury (<6 rib fractures) and
##severe injury (>=6 rib fractures)
##kent.df = within(kent.df, {
##                    injury = factor(ifelse(fractures<6,'minor','severe'),
##                                    levels = c('severe','minor'))})

## fit a binomial GLM

## kent.fit = glm(injury~cmax*



