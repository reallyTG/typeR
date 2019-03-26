library(FAwR)


### Name: SSallometric
### Title: Self-starting version of the allometric function y = a x^b.
### Aliases: SSallometric
### Keywords: models

### ** Examples

SSallometric(10, 2, 3)

data(sweetgum)
nls(vol.m3 ~ SSallometric(dbh.cm, alpha, beta),  data = sweetgum)



