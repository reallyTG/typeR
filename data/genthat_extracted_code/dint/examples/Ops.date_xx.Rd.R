library(dint)


### Name: Ops.date_xx
### Title: Comparison Operators for date_xx
### Aliases: Ops.date_xx

### ** Examples

date_yq(2015, 1) < date_yq(2015, 2)

# comparison with integers is ok
date_yq(2015, 1) < 20152

# but two different date_xx cannot be compared
try(date_yq(2015, 1) < date_ym(2015, 2))




