library(dga)


### Name: make.strata
### Title: Transforms Records to List Intersection Counts by Stratum
### Aliases: make.strata
### Keywords: stratification

### ** Examples


require(chron)
	N <- 10000
	overlaps <- data.frame(l1=rbinom(N, 1, .5), l2=rbinom(N, 1, .5), l3=rbinom(N, 1, .5))
	dates <- paste(rep(2015, N), "-", sample(1:12, N, replace = TRUE), "-",
     sample(1:28, N, replace = TRUE))
	dates <- chron(dates, format=c(dates="y-m-d"))
	locations <- sample(c("A", "B", "C", "D"), N, replace = TRUE)

  # Aggregate only by week: 
  make.strata(overlaps, dates, date.def = "weekly")
  
  # Aggregate by year and location, where locations are not grouped: 
  make.strata(overlaps, dates, date.def = "yearly", locations)

  # Aggregate by 2 day increments and location, where there are unique location levels
  #       A, B, C, and D and locations A and B are in group 1 
  #       and locations C and D are in group 2.
  loc.defs <- list("g1" = c("A", "B"), "g2" = c("C", "D"))
  make.strata(overlaps, dates, date.def = 2, locations, loc.defs = loc.defs)
  # Aggregate by demographic (sex) only, where sex takes values M, F, A, NA, and U
  #       and we would like to group these as M, F, and other.
  sex <- sample(c("M", "F", "A", NA, "U"), prob=c(.4, .4, .1, .05, .05),
         N, replace = TRUE)
  demog.defs <- list("M" = "M", "F" = "F", "Other" = c("A", NA, "U"))
  make.strata(overlaps, demographics = sex, demog.defs = demog.defs)




