library(popEpi)


### Name: is_leap_year
### Title: Detect leap years
### Aliases: is_leap_year

### ** Examples

## can be used to assign new columns easily, e.g. a dummy indicator column
df <- data.frame(yrs=c(1900,1904,2005,1995))
df$lyd <- as.integer(is_leap_year(df$yrs))

## mostly it is useful as a condition or to indicate which rows have leap years
which(is_leap_year(df$yrs)) # 2
df[is_leap_year(df$yrs),] # 2nd row




