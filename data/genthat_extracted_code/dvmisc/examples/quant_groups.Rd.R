library(dvmisc)


### Name: quant_groups
### Title: Split Continuous Variable into Quantile Groups
### Aliases: quant_groups

### ** Examples

# Convert values from N(0, 1) into quintiles (i.e. 5 groups)
x <- rnorm(1000)
groups <- quant_groups(x, 5)
table(groups)




