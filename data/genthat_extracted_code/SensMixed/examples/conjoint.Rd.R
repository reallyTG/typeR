library(SensMixed)


### Name: conjoint
### Title: Conjoint analysis within a mixed effects model framework.
### Aliases: conjoint

### ** Examples

## check with the  ham
response <- c("Liking")
fixed <- list(Product=c("Product", "Information"), Consumer="Gender")
random <- c("Consumer")
facs <- c("Consumer", "Product", "Information", "Gender")

res.ham <- conjoint(structure=3, ham, response, fixed, random, facs)
res.ham
res.ham$Liking



