library(adespatial)


### Name: WRperiodogram
### Title: Whittaker-Robinson periodogram
### Aliases: WRperiodogram plot.WRperio
### Keywords: multivariate

### ** Examples

 
###
### 1. Numerical example of Subsection 12.4.1 of Legendre and Legendre (2012)

test.vec <- c(2,2,4,7,10,5,2,5,8,4,1,2,5,9,6,3)

# Periodogram with permutation tests of significance
res <- WRperiodogram(test.vec)
plot(res)

### 2. Simulated data

periodic.component <- function(x,T,c) cos((2*pi/T)*(x+c))

n <- 500   # corresponding to 125 days, 4 observations per day
# Generate a lunar cycle, 29.5 days (T=118)
moon <- periodic.component(1:n, 118, 59)
# Generate a circadian cycle (T=4)
daily <- periodic.component(1:n, 4, 0)
# Generate a tidal cycle (T=2)
tide <- periodic.component(1:n, 2, 0)

# Periodogram of the lunar component only 
res.moon <- WRperiodogram(moon, nperm=0)
res.moon <- WRperiodogram(moon, T2=130, nperm=99)
par(mfrow=c(1,2))
plot(moon)
plot(res.moon, prog=1)

# Add the three components, plus a random normal error term
var <- 5*moon + daily + tide + rnorm(n, 0, 0.5)
# Draw a graph of a portion of the data series
par(mfrow=c(1,2))
plot(var[1:150], pch=".", cex=1)
lines(var[1:150])

# Periodogram of 'var'
res.var <- WRperiodogram(var, T2=130, nperm=99)
plot(res.var, prog=1, line.col="blue")
# Find position of the maximum value of this periodogram
which(res.var[,2] == max(res.var[,2]))

# Replace 10% of the 500 data by NA
select <- sort(sample(1:500)[1:50])
var.na <- var
var.na[select] <- NA
res.var.na <- WRperiodogram(var.na, T2=130, nperm=99)
plot(res.var.na, prog=1)

### 3. Data used in the examples of the documentation file of function afc() of {stats}
# Data file "ldeaths"; time series, 6 years x 12 months of deaths in UK hospitals
ld.res.perio <- WRperiodogram(ldeaths, nperm=499)
par(mfrow=c(1,2))
plot(ld.res.perio, prog=1) # Graph with no correction for multiple testing
plot(ld.res.perio, prog=3) # Graph with progressive correction
acf(ldeaths)   # acf() results, for comparison




