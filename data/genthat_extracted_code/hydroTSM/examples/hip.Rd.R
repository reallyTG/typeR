library(hydroTSM)


### Name: hip
### Title: Hours in Period
### Aliases: hip
### Keywords: manip

### ** Examples

## Sequence of hours between "1961-01-01 00:00" and "1961-01-10 00:00", giving the
## starting and ending date/time objects with hours and skipping the minutes (default)
hip("1961-01-01 00", "1961-12-31 00")

## Sequence of hours between "1961-01-01 00:00" and "1961-01-10 00:00", giving the
## starting and ending date/time objects only with hours and minutes(skipping the minutes)
hip("1961-01-01 00:00", "1961-12-31 00:00", date.fmt="%Y-%m-%d %H:%M")

## Number of hours between the 10:00 AM of "1961-Jan-02" and the 11:00 AM of "1961-Jan-01", 
## using "%d/%m/%Y" as date/time format.
hip("01/01/1961 10", "02/01/1961 11", date.fmt= "%d/%m/%Y %H", out.type = "nmbr")




