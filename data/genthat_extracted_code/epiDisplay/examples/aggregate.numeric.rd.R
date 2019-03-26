library(epiDisplay)


### Name: aggregate numeric
### Title: Summary statistics of a numeric variable by group
### Aliases: aggregate.numeric
### Keywords: database

### ** Examples

data(Compaq)
.data <- Compaq
attach(.data)

## If 'x' is a data frame, the default S3 aggregate method from the stats package is called.
aggregate(data.frame(id,year), by=list(HOSPITAL=hospital, STAGE=stage),
	FUN="mean")
# The two additional columns are means of 'id' and 'year'

## If 'x' is a numeric vector, 'aggregate.numeric' from Epicalc package is called.
aggregate(year, by = list(HOSPITAL = hospital, STAGE = stage), 
	FUN = mean)
# The above command is the same as the one below. 
# However, note the difference in the name of the last column of the returned 
# data frame.
aggregate.data.frame(year, by = list(HOSPITAL = hospital, 
	STAGE = stage), FUN = mean)

# aggregate in Epicalc can handle multiple functions
aggregate(year, by = list(HOSPITAL = hospital, STAGE = stage), 
	FUN = c("mean", "sd", "length"))

## Handling of missing values
.data$year[8] <- NA
detach(.data)
attach(.data)
aggregate(year, by = list(STAGE = stage), FUN = c("length", "count"))
# Note the difference between 'length' and 'count' in Stage 1
# Means of subsets in 'aggregrate.data.frame' 
# have 'na.rm' set to FALSE.
aggregate.data.frame(year, by = list(STAGE = stage), FUN = "mean")

## The default value of 'na.rm' is TRUE in aggregate.numeric of Epicalc.
aggregate(year, by = list(STAGE = stage), FUN = c("mean","median"))

## It can be set to FALSE though.
aggregate(year, by = list(STAGE = stage), FUN = c("mean","median"), 
	"na.rm"=FALSE)

# Omitting the FUN argument produces various statistics.
options(digits=3)
aggregate(year, by = list(HOSPITAL = hospital, STAGE = stage))

# Warning of na.rm 
aggregate(year, by = list(HOSPITAL = hospital, STAGE = stage), length.warning=FALSE)

# Newly defined functions can be used
p05 <- function(x) quantile(x, prob=.05, na.rm=TRUE)
p95 <- function(x) quantile(x, prob=.95, na.rm=TRUE)
aggregate(year, by = list(HOSPITAL = hospital, STAGE = stage), FUN=c("p05", "p95"))
detach(.data)
rm(list=ls())



