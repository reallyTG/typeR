library(ipumsr)


### Name: zap_ipums_attributes
### Title: Remove all IPUMS attributes from a variable (or all variables in
###   a data.frame)
### Aliases: zap_ipums_attributes

### ** Examples

cps <- read_ipums_micro(ipums_example("cps_00006.xml"))
annual_unemployment <- data.frame(YEAR = c(1962, 1963), unemp = c(5.5, 5.7))

# Avoids warning 'Column `YEAR` has different attributes on LHS and RHS of join'
cps$YEAR <- zap_ipums_attributes(cps$YEAR)
cps <- dplyr::left_join(cps, annual_unemployment, by = "YEAR")




