library(pastecs)


### Name: regul
### Title: Regulation of one or several time series using various methods
### Aliases: regul extract.regul hist.regul identify.regul lines.regul
###   plot.regul print.regul print.specs.regul print.summary.regul
###   specs.regul summary.regul
### Keywords: ts manip chron smooth

### ** Examples

data(releve)
# The series in this data frame are very irregularly sampled in time:
releve$Day
length(releve$Day)
intervals <- releve$Day[2:61]-releve$Day[1:60]
intervals
range(intervals)
mean(intervals)
# The series must be regulated to be converted in a 'rts' or 'ts object
rel.reg <- regul(releve$Day, releve[3:8], xmin=9, n=63, deltat=21,
        tol=1.05, methods=c("s","c","l","a","s","a"), window=21)
rel.reg
plot(rel.reg, 5)
specs(rel.reg)
# Now we can extract one or several regular time series
melo.ts <- extract(rel.reg, series="Melosul")
is.tseries(melo.ts)

# One can convert time-scale from "days" to "years" during regulation
# This is most useful for analyzing seasonal cycles in a second step
melo.regy <- regul(releve$Day, releve$Melosul, xmin=6, n=87,
        units="daystoyears", frequency=24, tol=2.2, methods="linear",
        datemin="21/03/1989", dateformat="d/m/Y")
melo.regy
plot(melo.regy, main="Regulation of Melosul")
# In this case, we have only one series in 'melo.regy'
# We can use also 'tseries()' instead of 'extract()'
melo.tsy <- tseries(melo.regy)
is.tseries(melo.tsy)



