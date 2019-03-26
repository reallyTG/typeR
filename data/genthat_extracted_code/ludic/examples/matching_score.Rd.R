library(ludic)


### Name: matching_score
### Title: Computes a matching score from agreement vectors and weights
### Aliases: matching_score
### Keywords: internal

### ** Examples

estep_vect <- function(ag_score, p, m, u){
  a <-exp(log(p) + ag_score%*%log(m) + (1-ag_score)%*%log(1-m))
  b <- exp(log(1-p) + ag_score%*%log(u) + (1-ag_score)%*%log(1-u))
  return(cbind(a/(a+b), b/(a+b)))
}





