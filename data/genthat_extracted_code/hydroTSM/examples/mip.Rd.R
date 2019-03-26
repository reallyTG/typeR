library(hydroTSM)


### Name: mip
### Title: Months in Period
### Aliases: mip
### Keywords: manip

### ** Examples

# Sequence of monthly dates between "1961-01-01" and "1961-12-31" ##
mip("1961-01-01", "1961-12-31")

## Computing the number of months between "1961-01-01" and "1965-06-30", 
## with the date format  "%d-%m-%Y" ##
mip("01-01-1961", "30-06-1965", date.fmt= "%d-%m-%Y", out.type = "nmbr")




