library(dint)


### Name: c.date_xx
### Title: Concatenate date_xx Objects
### Aliases: c.date_xx

### ** Examples


c(date_yq(2000, 1:2), date_yq(2000, 3:3))

# raises an error
try(c(date_yq(2000, 1:2), date_ym(2000, 1:12)))




