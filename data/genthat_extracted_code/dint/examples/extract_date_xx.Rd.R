library(dint)


### Name: [.date_xx
### Title: Extract or Replace Elements of a date_xx
### Aliases: [.date_xx [<-.date_yq [<-.date_ym [<-.date_yw [[.date_xx
###   [[<-.date_yq [[<-.date_ym [[<-.date_yw

### ** Examples

x <- date_yq(2016, 1:4)

x[[2]]
x[1] <- date_yq(2016, 3)
x[2] <- 20164  # 2016, 4th quarter
x[1:2]

# Trying to assign illegal values for the respective date_xx type raises an error
try(x[2] <- 20165)

x <- date_ym(2016, 1:3)
x[1] <- 201610  # October 2016

x <- date_yw(2016, 50:52)
x[1] <- 201649  # 2016, week 52





