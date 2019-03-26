library(BayLum)


### Name: AgeS_Computation
### Title: Bayesian analysis for the OSL age estimation of various samples
### Aliases: AgeS_Computation

### ** Examples

## load data
data(DATA1,envir = environment())
data(DATA2,envir = environment())
Data <- combine_DataFiles(DATA2,DATA1)

## Age computation of samples GDB5 and GDB3,
priorage=c(1,10,20,60) # these samples are not young
## without common error and without stratigraphic constraints
Age <- AgeS_Computation(
  DATA = Data,
  Nb_sample = 2,
  SampleNames = c("GDB5","GDB3"),
  PriorAge = priorage,
  Iter = 50,
  n.chains = 2,
  quiet = TRUE
  )

## Age computation of samples GDB5 and GDB3,
## without common error, assuming GDB5 age younder than GDB3 age
## Not run: 
##D Nb_sample <- 2
##D SC <- matrix(
##D   data = c(1,1,0,1,0,0),
##D   ncol = 2,
##D   nrow = (Nb_sample+1),byrow = T)
##D 
##D Age <- AgeS_Computation(
##D  DATA = Data,
##D  Nb_sample = Nb_sample,
##D  SampleNames = c("GDB5","GDB3"),
##D  PriorAge = priorage,
##D  StratiConstraints = SC,
##D  Iter = 10000,
##D  quiet = FALSE)
## End(Not run)




