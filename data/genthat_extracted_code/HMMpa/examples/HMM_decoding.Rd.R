library(HMMpa)


### Name: HMM_decoding
### Title: Algorithm for Decoding Hidden Markov Models (local or global)
### Aliases: HMM_decoding

### ** Examples



################################################################
### i) HMM-training  ###########################################
################################################################

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

### Train hidden Markov model for different number of 
### states m=2,...,6 and select the optimal model
## No test: 
m_trained_HMM <- 
    HMM_training(x = x, 
       min_m = 2, 
       max_m = 6, 
       distribution_class="pois")$trained_HMM_with_selected_m
         
                 
################################################################
################################################################
### ii) Global decoding ########################################
################################################################
################################################################

### Decode the trained HMM using the Viterbi algorithm to get 
### the estimated sequence of hidden physical activity levels
global_decoding <- 
    HMM_decoding(x = x, 
        m = m_trained_HMM$m, 
        delta = m_trained_HMM$delta, 
        gamma = m_trained_HMM$gamma, 
        distribution_class = m_trained_HMM$distribution_class, 
        distribution_theta = m_trained_HMM$distribution_theta,
        decoding_method = "global")
          
### Globally most likely sequence of hidden states, 
### i.e. in this case sequence of activity levels
global_decoding$decoding

par(mfrow = c(1,1))
plot(global_decoding$decoding)


### Plot the observed impulse counts and the most likely 
### sequence (green) according to the Viterbi algorithm that 
### generated these observations
plot(x)
lines(global_decoding$decoding_distr_means, col = "green")

################################################################
################################################################ 
### iii) Local decoding ########################################
################################################################ 
################################################################

### Decode the trained HMM using the local decoding algorithm 
### to get the estimated sequence of hidden physical activity 
### levels
local_decoding <- 
   HMM_decoding(x = x, 
   m = m_trained_HMM$m, 
   delta = m_trained_HMM$delta, 
   gamma = m_trained_HMM$gamma, 
   distribution_class = m_trained_HMM$distribution_class, 
   distribution_theta = m_trained_HMM$distribution_theta,
   decoding_method = "local")
        

### Locally most likely sequence of hidden states, 
### i.e. in this case sequence of activity levels
local_decoding$decoding

par(mfrow=c(1,1))
plot(local_decoding$decoding)


### Plot the observed impulse counts and the most likely 
### sequence (green) according to the local decoding algorithm 
### that generated these observations
plot(x)
lines(local_decoding$decoding_distr_means, col = "red")

################################################################
################################################################
### iv) Comparison of global and local decoding ################
################################################################
################################################################

### Comparison of global decoding (green), local decoding (red) 
### and the connection to the closest mean (blue)
print(global_decoding$decoding)  
print(local_decoding$decoding)

### Plot comparison 
par(mfrow = c(2,2))
plot(global_decoding$decoding[seq(230,260)], col = "green", 
  ylab = "global decoding", main = "(zooming)")
  plot(x[seq(230,260)], ylab = "global decoding", 
  main = "(zooming x[seq(230,260)])")
lines(global_decoding$decoding_distr_means[seq(230,260)], 
  col = "green")
plot(local_decoding$decoding[seq(230,260)], col = "red", 
  ylab = "local decoding", main = "(zooming)")
plot(x[seq(230,260)], ylab = "local decoding", 
  main = "(zooming x[seq(230,260)])")
lines(local_decoding$decoding_distr_means[seq(230,260)], 
  col = "red")
par(mfrow = c(1,1))
## End(No test)



