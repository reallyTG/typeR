library(dga)


### Name: check.strata
### Title: Checks Each Stratum for Suitability for Capture-Recapture
### Aliases: check.strata
### Keywords: list overlaps

### ** Examples


library(chron)

N <- 1000
overlaps <- data.frame(l1=rbinom(N, 1, .5), l2=rbinom(N, 1, .5), l3=rbinom(N, 1, .5))
dates <- paste(rep(2015, N), "-", sample(1:12, N, replace = TRUE), "-", 
	sample(1:28, N, replace = TRUE))
dates <- chron(dates, format=c(dates="y-m-d"))
locations <- sample(c("A", "B", "C", "D"), N, replace = TRUE)

# Aggregate only by week: 
strata <- make.strata(overlaps, dates, date.def = "weekly")
check <- check.strata(strata)





