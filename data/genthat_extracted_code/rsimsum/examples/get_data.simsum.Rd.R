library(rsimsum)


### Name: get_data.simsum
### Title: get_data.simsum
### Aliases: get_data.simsum

### ** Examples

data(MIsim)
x <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se",
            methodvar = "method", mcse = TRUE)
get_data(x)

# Exporting only bias and coverage:
get_data(x, ssta = c("bias", "cover"))

# Including a description of the summary statistics being exported:
get_data(x, ssta = c("bias", "cover"), description = TRUE)



