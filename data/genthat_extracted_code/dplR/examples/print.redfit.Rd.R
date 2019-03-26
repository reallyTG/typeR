library(dplR)


### Name: print.redfit
### Title: Printing Redfit Results
### Aliases: print.redfit
### Keywords: print

### ** Examples
library(utils)
data(ca533)
tm <- time(ca533)
x <- ca533[[1]]
idx <- which(!is.na(x))
redf <- redfit(x[idx], tm[idx], "time",
               nsim = 100, iwin = 0, ofac = 1, n50 = 1)
print(redf)
fname <- tempfile(fileext=".csv")
print(fname) # tempfile used for output
print(redf, csv.out = TRUE, file = fname)
redftable <- read.csv(fname)
unlink(fname) # remove the file



