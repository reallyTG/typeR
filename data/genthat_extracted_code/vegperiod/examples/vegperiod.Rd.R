library(vegperiod)


### Name: vegperiod
### Title: Determine vegetation period
### Aliases: vegperiod

### ** Examples

data(goe)
vegperiod(dates=goe$date, Tavg=goe$t,
          start.method="Menzel", end.method="vonWilpert",
          species="Picea abies (frueh)", est.prev=5)

# take chill days from first year, which is then dropped
vegperiod(dates=goe$date, Tavg=goe$t, start="Menzel", end="vonWilpert",
          species="Picea abies (frueh)", est.prev=0)

# add column with sum of day degrees in vegetation periods
vegperiod(dates=goe$date, Tavg=goe$t, Tsum.out=TRUE,
          start="StdMeteo", end="StdMeteo")




