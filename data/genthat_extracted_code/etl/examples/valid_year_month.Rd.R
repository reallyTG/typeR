library(etl)


### Name: valid_year_month
### Title: Ensure that years and months are within a certain time span
### Aliases: valid_year_month

### ** Examples


valid_year_month(years = 1999:2001, months = c(1:3, 7))

# Mets in the World Series since the UNIX epoch
mets_ws <- c(1969, 1973, 1986, 2000, 2015)
valid_year_month(years = mets_ws, months = 10)

# Mets in the World Series during the Clinton administration
if (require(ggplot2)) {
  clinton <- filter(presidential, name == "Clinton")
  valid_year_month(years = mets_ws, months = 10,
    begin = clinton$start, end = clinton$end)
}




