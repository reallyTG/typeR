library(rSCA)


### Name: rSCA.missing
### Title: Checking Missing Values for Modeling Data Sets
### Aliases: rSCA.missing rSCA.missing

### ** Examples

## Load rSCA package
library(rSCA)

## Case 1: without column name and row name, using NA as missing flag
data <- c("5 7 9 10\r",
          "12 3 4 5\r",
          "1 NA NA 3\r",
          "2 NA 13 23\r",
          "0 12 1 8\r",
          "NA 9 0 1\r")
datafile <- tempfile()
writeLines(data, datafile)
bPass = rSCA.missing(file = datafile)

## Remove temporary data files
unlink(datafile)


## Case 2: with column name and row name, using -99 as missing flag
data <- c("Year V1 V2 V3 V4\r",
          "2010 5 7 9 10\r",
          "2012 12 3 4 5\r",
          "2013 1 -99 -99 3\r",
          "2014 2 -99 13 23\r",
          "2015 0 12 1 8\r",
          "2016 -99 9 0 1\r")
datafile <- tempfile()
writeLines(data, datafile)
bPass = rSCA.missing(file = datafile, col.names = TRUE, 
            row.names = TRUE, missing.flag = "-99")

## Remove temporary data files
unlink(datafile)

## Case 3: with column name and row name, using NA as missing flag,
##         stored in comma-separated value (CSV) format.
data <- c("Year,V1,V2,V3,V4\r",
          "2010,5,7,9,10\r",
          "2012,12,3,4,5\r",
          "2013,1,NA,NA,3\r",
          "2014,2,NA,13,23\r",
          "2015,0,12,1,8\r",
          "2016,NA,9,0,1\r")
datafile <- tempfile()
writeLines(data, datafile)
bPass = rSCA.missing(file = datafile, col.names = TRUE, 
            row.names = TRUE, missing.flag = "NA", type = ".csv")

## Remove temporary data files
unlink(datafile)



