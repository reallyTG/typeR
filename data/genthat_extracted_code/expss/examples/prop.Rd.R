library(expss)


### Name: prop
### Title: Compute proportions from numeric vector/matrix/data.frame
### Aliases: prop prop_col prop_row

### ** Examples

a = c(25, 25, NA)
prop(a)

# data.frame with non-numeric columns
fac = factor(c("a", "b", "c"))
char = c("a", "b", "c")
dat = as.POSIXct("2016-09-27") 
a = sheet(fac, a = c(25, 25, NA), b = c(100, NA, 50), char, dat)

prop(a)
prop_row(a)
prop_col(a)

# the same as result as with 'prop.table'
tbl = table(state.division, state.region)

prop(tbl)
prop_row(tbl)
prop_col(tbl)



