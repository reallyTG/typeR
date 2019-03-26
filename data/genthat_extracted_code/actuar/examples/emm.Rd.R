library(actuar)


### Name: emm
### Title: Empirical Moments
### Aliases: emm emm.default emm.grouped.data
### Keywords: univar

### ** Examples

## Individual data
data(dental)
emm(dental, order = 1:3)

## Grouped data
data(gdental)
emm(gdental)
x <- grouped.data(cj = gdental[, 1],
                  nj1 = sample(1:100, nrow(gdental)),
                  nj2 = sample(1:100, nrow(gdental)))
emm(x) # same as mean(x)



