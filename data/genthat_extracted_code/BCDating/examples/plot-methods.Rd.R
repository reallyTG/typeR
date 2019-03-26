library(BCDating)


### Name: plot-methods
### Title: Plotting BCDating Objects, and Plotting Time-Series on BCDating
###   Plot Background
### Aliases: plot,BCDating,missing-method plot,BCDating,ts-method
###   plot,ts,BCDating-method plot,BCDating,list-method
###   plot,list,BCDating-method plot,BCDating,BCDating-method
###   plot,list,missing-method

### ** Examples

library(BCDating)
data("MBRI.Iran.Dating")
plot(MBRI.Iran.Dating)
plot(MBRI.Iran.Dating,dates=TRUE)

data("Iran.non.Oil.GDP.Cycle")
plot(MBRI.Iran.Dating,Iran.non.Oil.GDP.Cycle)
plot(Iran.non.Oil.GDP.Cycle,MBRI.Iran.Dating)

data("Iran.non.Oil.GDP.Quarterly.Growth")
plot(MBRI.Iran.Dating,Iran.non.Oil.GDP.Quarterly.Growth,averages=TRUE)
plot(MBRI.Iran.Dating,cbind(Iran.non.Oil.GDP.Cycle*100,Iran.non.Oil.GDP.Quarterly.Growth))

dat <- BBQ(Iran.non.Oil.GDP.Cycle, name="Dating Business Cycles of Iran")
plot(dat,MBRI.Iran.Dating)
plot(list(dat,MBRI.Iran.Dating))



