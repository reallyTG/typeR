library(lymphclon)


### Name: infer.clonality
### Title: infer.clonality (part of lymphclon package)
### Aliases: infer.clonality
### Keywords: ~kwd1 ~kwd2

### ** Examples

my.data <- generate.clonal.data(n=2e3) 
# n ~ 2e7 is more appropriate for a realistic B cell repertoire
my.lymphclon.results <- infer.clonality(my.data$read.count.matrix)
# a consistently improved estimate of clonality (the squared 
# 2-norm of the underlying multinomial distribution)
my.lymphclon.results$lymphclon.clonality 



