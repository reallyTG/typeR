library(climdex.pcic)


### Name: climdexInput.csv
### Title: Method for creating climdexInput object from CSV files
### Aliases: climdexInput.csv
### Keywords: climate ts

### ** Examples

## This would create a climdexInput object from a set of filenames (already
## stored as variables), with a different date format.
## Not run: 
##D ci.csv <- climdexInput.csv(tmax.filename, tmin.filename,
##D prec.filename, date.types=list(list(fields=c("date"), format="%Y-%m-%d")))
## End(Not run)




