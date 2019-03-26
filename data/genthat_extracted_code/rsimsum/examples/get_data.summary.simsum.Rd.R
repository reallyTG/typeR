library(rsimsum)


### Name: get_data.summary.simsum
### Title: get_data.summary.simsum
### Aliases: get_data.summary.simsum

### ** Examples

data(MIsim)
x <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se",
            methodvar = "method", mcse = TRUE)
xs <- summary(x)
get_data(xs)

# Exporting only bias and coverage:
get_data(xs, sstat = c("bias", "cover"))

# Append a column with a description of each summary statistic exported:
get_data(xs, sstat = c("bias", "cover"), description = TRUE)



