library(BCDating)


### Name: BCDating-package
### Title: Business Cycle Dating and Plotting Tools
### Aliases: BCDating-package BCDating
### Keywords: package

### ** Examples

library(BCDating)
data("Iran.non.Oil.GDP.Cycle")
dat <- BBQ(Iran.non.Oil.GDP.Cycle, name="Dating Business Cycles of Iran")
show(dat)
summary(dat)
plot(dat)
plot(dat,Iran.non.Oil.GDP.Cycle)

data("MBRI.Iran.Dating")
plot(MBRI.Iran.Dating)



