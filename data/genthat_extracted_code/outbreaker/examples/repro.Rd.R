library(outbreaker)


### Name: get.Rt
### Title: Derive reproduction numbers from outbreak's outputs
### Aliases: get.Rt get.R get.incid get.R get.incid

### ** Examples


## load data
data(fakeOutbreak)
attach(fakeOutbreak)

## individual R
barplot(table(get.R(res)), main="Individual effective reproduction numbers")

## R(t)
get.Rt(res)

## incidence
get.incid(res)

detach(fakeOutbreak)





