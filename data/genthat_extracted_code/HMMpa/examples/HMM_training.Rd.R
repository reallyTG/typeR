library(HMMpa)


### Name: HMM_training
### Title: Training of Hidden Markov Models
### Aliases: HMM_training
### Keywords: iteration

### ** Examples


################################################################
### Fictitious observations ####################################
################################################################

x <- c(1,16,19,34,22,6,3,5,6,3,4,1,4,3,5,7,9,8,11,11,
  14,16,13,11,11,10,12,19,23,25,24,23,20,21,22,22,18,7,
  5,3,4,3,2,3,4,5,4,2,1,3,4,5,4,5,3,5,6,4,3,6,4,8,9,12,
  9,14,17,15,25,23,25,35,29,36,34,36,29,41,42,39,40,43,
  37,36,20,20,21,22,23,26,27,28,25,28,24,21,25,21,20,21,
  11,18,19,20,21,13,19,18,20,7,18,8,15,17,16,13,10,4,9,
  7,8,10,9,11,9,11,10,12,12,5,13,4,6,6,13,8,9,10,13,13,
  11,10,5,3,3,4,9,6,8,3,5,3,2,2,1,3,5,11,2,3,5,6,9,8,5,
  2,5,3,4,6,4,8,15,12,16,20,18,23,18,19,24,23,24,21,26,
  36,38,37,39,45,42,41,37,38,38,35,37,35,31,32,30,20,39,
  40,33,32,35,34,36,34,32,33,27,28,25,22,17,18,16,10,9,
  5,12,7,8,8,9,19,21,24,20,23,19,17,18,17,22,11,12,3,9,
  10,4,5,13,3,5,6,3,5,4,2,5,1,2,4,4,3,2,1) 


## Train a poisson hidden Markov model using the Baum-Welch 
## algorithm for different number of states m=2,...,6
## No test: 
trained_HMMs <- 
    HMM_training(x = x, 
      distribution_class = "pois", 
      min_m = 2, 
      max_m = 6, 
      training_method = "EM")


## Various output values for the HMM
names(trained_HMMs)

## Print details of the most plausible HMM for the given 
## time-series of observations
print(trained_HMMs$trained_HMM_with_selected_m)

## Print details of all trained HMMs (by this function) 
## for the given time-series of observations
print(trained_HMMs$list_of_all_trained_HMMs)

## Print the BIC-values of all trained HMMs for the given 
## time-series of observations  
print(trained_HMMs$list_of_all_BICs_for_each_HMM_with_m_states)

## Print the logL-values of all trained HMMs for the 
## given time-series of observations  
print(trained_HMMs$list_of_all_logLs_for_each_HMM_with_m_states)
## End(No test)



