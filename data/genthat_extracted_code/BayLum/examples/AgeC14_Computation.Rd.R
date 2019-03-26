library(BayLum)


### Name: AgeC14_Computation
### Title: Bayesian analysis for C-14 age estimations of various samples
### Aliases: AgeC14_Computation

### ** Examples

## Load data
data(DATA_C14,envir = environment())
C14Cal <- DATA_C14$C14[,1]
SigmaC14Cal <- DATA_C14$C14[,2]
Names <- DATA_C14$Names
nb_sample <- length(Names)

## Age computation of samples without stratigraphic relations
Age <- AgeC14_Computation(
 Data_C14Cal = C14Cal,
 Data_SigmaC14Cal = SigmaC14Cal,
 SampleNames = Names,
 Nb_sample = nb_sample,
 PriorAge = rep(c(20,60),nb_sample),
 Iter = 500,
 quiet = TRUE)




