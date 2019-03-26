library(ecb)


### Name: convert_dates
### Title: Format date variable retrieved from the SDW into a proper date
###   variable
### Aliases: convert_dates

### ** Examples

hicp <- get_data("ICP.M.U2.N.000000.4.ANR")
hicp$obstime <- convert_dates(hicp$obstime)
str(hicp)



