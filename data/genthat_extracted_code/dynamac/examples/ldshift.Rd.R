library(dynamac)


### Name: ldshift
### Title: Take the lagged first difference of a series.
### Aliases: ldshift
### Keywords: utilities

### ** Examples

x.var <- runif(50)
ld.1.x.var <- ldshift(x.var, 1)
ld.2.x.var <- ldshift(x.var, 2)
head(x.var)
head(ld.1.x.var)
head(ld.2.x.var)



