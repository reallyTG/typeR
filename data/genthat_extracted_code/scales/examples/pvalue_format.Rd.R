library(scales)


### Name: pvalue_format
### Title: p-values formatter
### Aliases: pvalue_format pvalue

### ** Examples

p <- c(.50, 0.12, .045, .011, .009, .00002, NA)
pvalue(p)
pvalue(p, accuracy = .01)
pvalue(p, add_p = TRUE)
custom_function <- pvalue_format(accuracy = .1, decimal.mark = ",")
custom_function(p)



