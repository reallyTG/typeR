library(eeptools)


### Name: isid
### Title: A function to check if a set of variables form a unique ID in a
###   dataframe.
### Aliases: isid

### ** Examples

data(stuatt)
isid(stuatt, vars = c("sid"))
isid(stuatt, vars = c("sid", "school_year"))
isid(stuatt, vars = c("sid", "school_year"), verbose = TRUE)




