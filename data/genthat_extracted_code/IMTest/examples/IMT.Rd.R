library(IMTest)


### Name: IMT
### Title: Runs information matrix test for an information matrix test GPCM
###   model.
### Aliases: IMT

### ** Examples

data(dataset)
collapse = split(rep(c(1:4), 10), rep(1:10, each = 4))
my_data = collapse_data(dataset, collapse, "rasch")
model = gpcm_IMT(my_data$data, constraint = "rasch")
## No test: 
test_fit = IMT(model, "rasch", R = 5000, my_data$ind)
#This line of code takes longer than 10 seconds to run
pvalue = pchisq(test_fit$Tstat, test_fit$df, lower.tail = FALSE)
## End(No test)
# See vignette("IMT-vignette") for more examples



