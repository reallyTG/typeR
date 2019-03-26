library(lymphclon)


### Name: lymphclon-package
### Title: Estimates the clonality score from replicate of abundances data
### Aliases: lymphclon-package lymphclon
### Keywords: diversity, clonality score, clonality

### ** Examples

my.data <- generate.clonal.data(n=5e3) 
# n ~ 2e7 is more appropriate for a realistic B cell repertoire
my.lymphclon.results <- infer.clonality(my.data$read.count.matrix)
# a consistently improved estimate of clonality (the squared 
# 2-norm of the underlying multinomial distribution)



