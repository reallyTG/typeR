library(popEpi)


### Name: setaggre
### Title: Set 'aggre' attributes to an object by modifying in place
### Aliases: setaggre

### ** Examples

df <- data.frame(sex = rep(c("male", "female"), each = 5), 
                 obs = rpois(10, rep(7,5, each=5)), 
                 pyrs = rpois(10, lambda = 10000))
## without any breaks
setaggre(df, values = c("obs", "pyrs"), by = "sex")
df <- data.frame(df)
df$FUT <- 0:4
## with breaks list
setaggre(df, values = c("obs", "pyrs"), by = "sex", breaks = list(FUT = 0:5))



