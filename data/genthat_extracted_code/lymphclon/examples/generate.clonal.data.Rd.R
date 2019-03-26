library(lymphclon)


### Name: generate.clonal.data
### Title: generate.clonal.data (part of lymphclon package)
### Aliases: generate.clonal.data
### Keywords: ~kwd1 ~kwd2

### ** Examples

my.data <- generate.clonal.data(n=2e3) 
# n ~ 2e7 is more appropriate for a realistic B cell repertoire
my.lymphclon.results <- infer.clonality(my.data$read.count.matrix)
# a consistently improved estimate of clonality (the squared 
# 2-norm of the underlying multinomial distribution)



