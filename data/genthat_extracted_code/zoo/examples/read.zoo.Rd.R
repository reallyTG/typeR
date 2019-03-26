library(zoo)


### Name: read.zoo
### Title: Reading and Writing zoo Series
### Aliases: read.zoo read.table.zoo read.csv.zoo read.csv2.zoo
###   read.delim.zoo read.delim2.zoo write.zoo
### Keywords: ts

### ** Examples

## this manual page provides a few typical examples, many more cases
## are covered in vignette("zoo-read", package = "zoo")

## read text lines with a single date column
Lines <- "2013-12-24  2
2013-12-25 3
2013-12-26 8"
read.zoo(text = Lines, FUN = as.Date)       # explicit coercion
read.zoo(text = Lines, format = "%Y-%m-%d") # same
read.zoo(text = Lines)                      # same, via heuristic

## read text lines with date/time in separate columns
Lines <- "2013-11-24 12:41:21 2
2013-12-25 12:41:22.25 3
2013-12-26 12:41:22.75 8"
read.zoo(text = Lines, index = 1:2,
  FUN = paste, FUN2 = as.POSIXct)            # explicit coercion
read.zoo(text = Lines, index = 1:2, tz = "") # same
read.zoo(text = Lines, index = 1:2)          # same, via heuristic

## read text lines with month/year in separate columns
Lines <- "Jan 1998 4.36
Feb 1998 4.34"
read.zoo(text = Lines, index = 1:2, FUN = paste, FUN2 = as.yearmon)

## read directly from a data.frame (artificial and built-in BOD)
dat <- data.frame(date = paste("2000-01-", 10:15, sep = ""),
  a = sin(1:6), b = cos(1:6))
read.zoo(dat)
data("BOD", package = "datasets")
read.zoo(BOD)

## Not run: 
##D ## descriptions of typical examples
##D 
##D ## turn *numeric* first column into yearmon index
##D ## where number is year + fraction of year represented by month
##D z <- read.zoo("foo.csv", sep = ",", FUN = as.yearmon)
##D 
##D ## first column is of form yyyy.mm
##D ## (Here we use format in place of as.character so that final zero 
##D ## is not dropped in dates like 2001.10 which as.character would do.)
##D f <- function(x) as.yearmon(format(x, nsmall = 2), "%Y.%m")
##D z <- read.zoo("foo.csv", header = TRUE, FUN = f)
##D 
##D ## turn *character* first column into "Date" index
##D ## Assume lines look like: 12/22/2007 1 2
##D z <- read.zoo("foo.tab", format = "%m/%d/%Y")
##D 
##D # Suppose lines look like: 09112007 1 2 and there is no header
##D z <- read.zoo("foo.txt", format = "%d%m%Y")
##D 
##D ## csv file with first column of form YYYY-mm-dd HH:MM:SS
##D ## Read in times as "chron" class. Requires chron 2.3-22 or later.
##D z <- read.zoo("foo.csv", header = TRUE, sep = ",", FUN = as.chron)
##D 
##D ## same but with custom format.  Note as.chron uses POSIXt-style ##D 
##D ## Read in times as "chron" class. Requires chron 2.3-24 or later.
##D z <- read.zoo("foo.csv", header = TRUE, sep = ",", FUN = as.chron, 
##D 	format = "##D 
##D 
##D ## same file format but read it in times as "POSIXct" class.
##D z <- read.zoo("foo.csv", header = TRUE, sep = ",", tz = "")
##D 
##D ## csv file with first column mm-dd-yyyy. Read times as "Date" class.
##D z <- read.zoo("foo.csv", header = TRUE, sep = ",", format = "%m-%d-%Y")
##D 
##D ## whitespace separated file with first column of form YYYY-mm-ddTHH:MM:SS
##D ## and no headers.  T appears literally.  Requires chron 2.3-22 or later.
##D z <- read.zoo("foo.csv", FUN = as.chron)
##D 
##D # read in all csv files in the current directory and merge them
##D read.zoo(Sys.glob("*.csv"), header = TRUE, sep = ",")
##D 
##D # We use "NULL" in colClasses for those columns we don't need but in 
##D # col.names we still have to include dummy names for them.  Of what 
##D # is left the index is the first three columns (1:3) which we convert 
##D # to chron class times in FUN and then truncate to 5 seconds in FUN2.  
##D # Finally we use aggregate = mean to average over the 5 second intervals.
##D library("chron")
##D 
##D Lines <- "CVX 20070201 9 30 51 73.25 81400 0
##D CVX 20070201 9 30 51 73.25 100 0
##D CVX 20070201 9 30 51 73.25 100 0
##D CVX 20070201 9 30 51 73.25 300 0
##D CVX 20070201 9 30 51 73.25 81400 0
##D CVX 20070201 9 40 51 73.25 100 0
##D CVX 20070201 9 40 52 73.25 100 0
##D CVX 20070201 9 40 53 73.25 300 0"
##D 
##D z <- read.zoo(text = Lines, 
##D   colClasses = c("NULL", "NULL", "numeric", "numeric", "numeric",
##D     "numeric", "numeric", "NULL"),
##D   col.names = c("Symbol", "Date", "Hour", "Minute", "Second", "Price", "Volume", "junk"),
##D   index = 1:3,  # do not count columns that are "NULL" in colClasses
##D   FUN = function(h, m, s) times(paste(h, m, s, sep = ":")),
##D   FUN2 = function(tt) trunc(tt, "00:00:05"),
##D   aggregate = mean)
## End(Not run)




