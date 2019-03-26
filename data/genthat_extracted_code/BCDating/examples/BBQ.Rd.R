library(BCDating)


### Name: BBQ
### Title: Harding-Pagan (Quarterly Bry-Boschan) Business Cycle Dating
###   Procedure
### Aliases: BBQ
### Keywords: Business Cycle Dating Quarterly Bry-Boschan Hardin-Pagan

### ** Examples

data("Iran.non.Oil.GDP.Cycle")
dat <- BBQ(Iran.non.Oil.GDP.Cycle, name="Dating Business Cycles of Iran")
show(dat)
summary(dat)
plot(dat)
data(MBRI.Iran.Dating)
plot(dat,MBRI.Iran.Dating)



