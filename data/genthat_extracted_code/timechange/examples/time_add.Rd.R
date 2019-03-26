library(timechange)


### Name: time_add
### Title: Arithmetics with periods
### Aliases: time_add time_subtract

### ** Examples


# Addition

## Month gap
x <- as.POSIXct("2000-01-31 01:02:03", tz = "America/Chicago")
time_add(x, months = 1, roll_month = "first")
time_add(x, months = 1, roll_month = "last")
time_add(x, months = 1, roll_month = "boundary")
time_add(x, months = 1, roll_month = "skip")
time_add(x, months = 1, roll_month = "NA")
time_add(x, months = 1, days = 3,  roll_month = "first")
time_add(x, months = 1, days = 3,  roll_month = "last")
time_add(x, months = 1, days = 3,  roll_month = "boundary")
time_add(x, months = 1, days = 3,  roll_month = "skip")
time_add(x, months = 1, days = 3,  roll_month = "NA")

## DST gap
x <- as.POSIXlt("2010-03-14 01:02:03", tz = "America/Chicago")
time_add(x, hours = 1, minutes = 50, roll_dst = "first")
time_add(x, hours = 1, minutes = 50, roll_dst = "last")
time_add(x, hours = 1, minutes = 50, roll_dst = "boundary")
time_add(x, hours = 1, minutes = 50, roll_dst = "skip")
time_add(x, hours = 1, minutes = 50, roll_dst = "NA")

# SUBTRACTION

## Month gap
x <- as.POSIXct("2000-03-31 01:02:03", tz = "America/Chicago")
time_subtract(x, months = 1, roll_month = "first")
time_subtract(x, months = 1, roll_month = "last")
time_subtract(x, months = 1, roll_month = "boundary")
time_subtract(x, months = 1, roll_month = "skip")
time_subtract(x, months = 1, roll_month = "NA")
time_subtract(x, months = 1, days = 3,  roll_month = "first")
time_subtract(x, months = 1, days = 3,  roll_month = "last")
time_subtract(x, months = 1, days = 3,  roll_month = "boundary")
time_subtract(x, months = 1, days = 3,  roll_month = "skip")
time_subtract(x, months = 1, days = 3,  roll_month = "NA")

## DST gap
y <- as.POSIXlt("2010-03-15 01:02:03", tz = "America/Chicago")
time_subtract(y, hours = 22, minutes = 50, roll_dst = "first")
time_subtract(y, hours = 22, minutes = 50, roll_dst = "last")
time_subtract(y, hours = 22, minutes = 50, roll_dst = "boundary")
time_subtract(y, hours = 22, minutes = 50, roll_dst = "skip")
time_subtract(y, hours = 22, minutes = 50, roll_dst = "NA")



