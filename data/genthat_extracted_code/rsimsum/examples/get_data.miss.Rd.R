library(rsimsum)


### Name: get_data.miss
### Title: get_data.miss
### Aliases: get_data.miss

### ** Examples

data("frailty", package = "rsimsum")
m <- miss(data = frailty, estvarname = "b", se = "se", par = "par",
            methodvar = "model", by = "fv_dist")
get_data(m)



