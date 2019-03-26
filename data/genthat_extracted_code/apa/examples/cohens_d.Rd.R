library(apa)


### Name: cohens_d
### Title: Cohen's d
### Aliases: cohens_d cohens_d.default cohens_d.data.frame cohens_d.formula
###   cohens_d.htest

### ** Examples

# Calculate from raw data
cohens_d(c(10, 15, 11, 14, 17), c(22, 18, 23, 25, 20))

# Methods when working with data frames
cohens_d(sleep, dv = extra, iv = group, paired = TRUE)
# or
cohens_d(sleep, dv = "extra", iv = "group", paired = TRUE)
# formula interface
cohens_d(extra ~ group, sleep, paired = TRUE)

# Or pass a call to t_test or t.test
cohens_d(t_test(extra ~ group, sleep, paired = TRUE))



