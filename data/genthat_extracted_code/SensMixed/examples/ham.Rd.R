library(SensMixed)


### Name: ham
### Title: Conjoint study of dry cured ham
### Aliases: ham
### Keywords: datasets

### ** Examples

## check with the  ham
response <- c("Liking")
fixed <- list(Product=c("Product", "Information"), Consumer="Gender")
random <- c("Consumer")
facs <- c("Consumer", "Product", "Information", "Gender")

res.ham <- conjoint(structure=1, ham, response, fixed, random, facs)



