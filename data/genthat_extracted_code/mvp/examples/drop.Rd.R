library(mvp)


### Name: drop
### Title: Drop empty variables
### Aliases: drop

### ** Examples


m1 <- as.mvp("1+bish +bash^2 + bosh^3")
m2 <- as.mvp("bish +bash^2 + bosh^3")

m1-m2         # an mvp object
drop(m1-m2)   # numeric



