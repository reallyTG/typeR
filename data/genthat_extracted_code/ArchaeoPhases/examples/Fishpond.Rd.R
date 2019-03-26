library(ArchaeoPhases)


### Name: Fishpond
### Title: Polynesian fishpond site on the island of Oahu, Hawaii.
### Aliases: Fishpond
### Keywords: datasets MCMC output BCal

### ** Examples

  ##load data
  data(Fishpond)
  # deleting the last row containing "NAs" only
  Fishpond = Fishpond[-55965,]
  # Note that these MCMC samples are in format cal BP (that is in year before 1950). 
  # In order to use the functions from ArhcaheoPhases, the MCMC samples have to be 
  # converted in date format BC/AD, for example, using the following code
  Fishpond2 = Fishpond
    L = length(Fishpond)
    conv <- function(value, T0){
      T0 - value
    }
    for (i in 1:L){
      if( is.numeric(Fishpond[,i]) == TRUE){
        Fishpond2[,i] = sapply(Fishpond[,i], conv, 1950)
      }
    }



