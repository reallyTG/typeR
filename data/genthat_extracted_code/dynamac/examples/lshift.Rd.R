library(dynamac)


### Name: lshift
### Title: Take lag transformation of a series.
### Aliases: lshift
### Keywords: utilities

### ** Examples

x.var <- runif(50)
l.1.x.var <- lshift(x.var, 1)
l.2.x.var <- lshift(x.var, 2)
head(x.var)
head(l.1.x.var)
head(l.2.x.var)



