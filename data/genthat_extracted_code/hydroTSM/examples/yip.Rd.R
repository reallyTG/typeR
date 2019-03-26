library(hydroTSM)


### Name: yip
### Title: Years in Period
### Aliases: yip
### Keywords: manip

### ** Examples

# Sequence of monthly dates between "1961-01-01" and "1961-12-31"
yip("1961-01-01", "1961-12-31")

## Computing the number of years between 1961 and 1975, 
## by using "%d-%m-%Y" as date format   ##
yip("01-01-1961", "01-01-1975", date.fmt= "%d-%m-%Y", out.type = "nmbr")




