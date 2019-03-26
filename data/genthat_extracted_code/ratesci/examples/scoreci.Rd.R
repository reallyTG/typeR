library(ratesci)


### Name: scoreci
### Title: Score confidence intervals for comparisons of independent
###   binomial or Poisson rates.
### Aliases: scoreci

### ** Examples

  #Binomial RD, SCAS method:
  scoreci(x1 = c(12,19,5), n1 = c(16,29,56), x2 = c(1,22,0), n2 = c(16,30,29))

  #Binomial RD, MN method:
  scoreci(x1 = c(12,19,5), n1 = c(16,29,56), x2 = c(1,22,0), n2 = c(16,30,29), skew = FALSE)

  #Poisson RR, SCAS method:
  scoreci(x1 = 5, n1 = 56, x2 = 0, n2 = 29, distrib = "poi", contrast = "RR")

  #Poisson RR, MN method:
  scoreci(x1 = 5, n1 = 56, x2 = 0, n2 = 29, distrib = "poi", contrast = "RR", skew = FALSE)

  #Binomial rate, SCAS method:
  scoreci(x1 = c(5,0), n1 = c(56,29), contrast = "p")

  #Binomial rate, Wilson score method:
  scoreci(x1 = c(5,0), n1 = c(56,29), contrast = "p", skew = FALSE)

  #Poisson rate, SCAS method:
  scoreci(x1 = c(5,0), n1 = c(56,29), distrib = "poi", contrast = "p")

  #Stratified example, using data from Hartung & Knapp:
  scoreci(x1 = c(15,12,29,42,14,44,14,29,10,17,38,19,21),
          x2 = c(9,1,18,31,6,17,7,23,3,6,12,22,19),
          n1 = c(16,16,34,56,22,54,17,58,14,26,44,29,38),
          n2 = c(16,16,34,56,22,55,15,58,15,27,45,30,38),
          stratified = TRUE)

  #TDAS example, using data from Hartung & Knapp:
  scoreci(x1 = c(15,12,29,42,14,44,14,29,10,17,38,19,21),
          x2 = c(9,1,18,31,6,17,7,23,3,6,12,22,19),
          n1 = c(16,16,34,56,22,54,17,58,14,26,44,29,38),
          n2 = c(16,16,34,56,22,55,15,58,15,27,45,30,38),
          stratified = TRUE, tdas = TRUE)




