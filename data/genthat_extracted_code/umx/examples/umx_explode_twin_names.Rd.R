library(umx)


### Name: umx_explode_twin_names
### Title: Break twin variable names (BMI_T1, BMI_T2) into base variable
###   names (BMI, "_T", 1:2)
### Aliases: umx_explode_twin_names

### ** Examples

require(umx)
data("twinData")
umx_explode_twin_names(twinData, sep = "")
umx_explode_twin_names(twinData, sep = NULL)

# Ignore this: just a single-character/single variable test case
x = round(10 * rnorm(1000, mean = -.2))
y = round(5 * rnorm(1000))
x[x < 0] = 0; y[y < 0] = 0
umx_explode_twin_names(data.frame(x_T1 = x, x_T2 = y), sep = "_T")
umx_explode_twin_names(data.frame(x_T11 = x, x_T22 = y), sep = "_T")



