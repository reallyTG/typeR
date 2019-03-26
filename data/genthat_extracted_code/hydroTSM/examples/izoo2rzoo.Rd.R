library(hydroTSM)


### Name: izoo2rzoo
### Title: Irregular Zoo -> Regular Zoo
### Aliases: izoo2rzoo izoo2rzoo.default izoo2rzoo.zoo
### Keywords: manip

### ** Examples

##
## Example 1: Adding NA for February 29th to an existing zoo object

# dummy values and dates (February 29th is not present !)
x <- 1:9
dates <- c("1964-02-25", "1964-02-26", "1964-02-27", "1964-02-28", "1964-03-01", 
           "1964-03-02", "1964-03-03", "1964-03-04", "1964-03-05")

# From 'character' to 'Date' class
dates <- as.Date(dates)

## From 'numeric' to 'zoo' class
x <- zoo(x, dates) # Feb 29th is still missing

## Adding a missing value (NA in this case) for Feb 29th
y <- izoo2rzoo(x)

## checking the new length
length(y) # 1 element more than the original 'x' (Feb 29th)


##
## Example 2: Extending the original 'x' object from February 1st to the end of 
#  March, assigning 'NA' to the days in which 'x' do not have a value.
y <- izoo2rzoo(x, from="1964-02-01", to="1964-03-31")


##
## Example 3: Working with a zoo matrix
Y <- cbind(x,x)

# Adding a missing value (NA in this case) for Feb 29th in all the columns of Y
rY <- izoo2rzoo(Y, from="1964-02-25", to="1964-03-05")


##
## Example 4: Working with hourly data, from 01:00 to 10:00 on 12th December 2000
dates  <- ISOdatetime(2000, 12, 12, 1:10, 0, 0)
values <- 1:10
x      <- zoo(values, dates)

# removing values from 02:00 to 05:00 (not present at all in 'x', not even NA !)
x <- x[-c(2:5)]

#  Adding missing values (NA in this case) from 02:00 to 05:00
y <-  izoo2rzoo(x, date.fmt="%Y-%m-%d %H:%M:%S", tstep="hours")




