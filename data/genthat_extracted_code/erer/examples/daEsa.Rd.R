library(erer)


### Name: daEsa
### Title: Daily returns of 14 public firms from 1990 to 2004
### Aliases: daEsa
### Keywords: datasets

### ** Examples

data(daEsa) 
dim(daEsa); colnames(daEsa)
head(daEsa); tail(daEsa)
str(daEsa)

# if dates are stored as a date object in R, then it can be converted into
# numbers as the following example shows.

raw <- as.Date(c('1990-01-02', '1991-11-12')); raw; str(raw)
raw2 <- as.numeric(strftime(raw, format = "%Y%m%d")); raw2; str(raw2)




