library(sjstats)


### Name: var_pop
### Title: Calculate population variance and standard deviation
### Aliases: var_pop sd_pop

### ** Examples

data(efc)

# sampling variance
var(efc$c12hour, na.rm = TRUE)
# population variance
var_pop(efc$c12hour)

# sampling sd
sd(efc$c12hour, na.rm = TRUE)
# population sd
sd_pop(efc$c12hour)




