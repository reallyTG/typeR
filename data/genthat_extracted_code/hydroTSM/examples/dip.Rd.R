library(hydroTSM)


### Name: dip
### Title: Days in Period
### Aliases: dip
### Keywords: manip

### ** Examples

## Sequence of daily dates between "1961-01-01" and "1961-12-31" ##
dip("1961-01-01", "1961-12-31")

## Number of days between "1961-01-01" and "1965-06-30", 
## but using "%d-%m-%Y" as date format.
dip("01-01-1961", "30-06-1965", date.fmt= "%d-%m-%Y", out.type = "nmbr")




