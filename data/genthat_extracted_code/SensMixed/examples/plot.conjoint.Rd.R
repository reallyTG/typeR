library(SensMixed)


### Name: plot.conjoint
### Title: plots the post-hoc for the conjoint object
### Aliases: plot.conjoint
### Keywords: ~kwd1 ~kwd2

### ** Examples


#convert some variables to factors in Tham
response <- c("Liking")
fixed <- list(Product=c("Product", "Information"), Consumer="Gender")
random <- c("Consumer")
facs <- c("Consumer", "Product", "Information", "Gender")

res.ham <- conjoint(structure=3, ham, response, fixed, random, facs)



