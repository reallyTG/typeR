library(MultiBD)


### Name: SIR_prob
### Title: Transition probabilities of an SIR process
### Aliases: SIR_prob

### ** Examples

data(Eyam)

loglik_sir <- function(param, data) {
  alpha <- exp(param[1]) # Rates must be non-negative
  beta  <- exp(param[2])
  
  if(length(unique(rowSums(data[, c("S", "I", "R")]))) > 1) {
    stop ("Please make sure the data conform with a closed population")
  }
  
  sum(sapply(1:(nrow(data) - 1), # Sum across all time steps k
             function(k) {
               log(
                 SIR_prob(  # Compute the forward transition probability matrix
                   t  = data$time[k + 1] - data$time[k], # Time increment
                   alpha = alpha, beta = beta, 
                   S0 = data$S[k], I0 = data$I[k],       # From: R(t_k), I(t_k)
                   nSI = data$S[k] - data$S[k + 1], nIR = data$R[k + 1] - data$R[k],
                   computeMode = 4, nblocks = 80         # Compute using 4 threads
                 )[data$S[k] - data$S[k + 1] + 1, 
                   data$R[k + 1] - data$R[k] + 1]        # To: R(t_(k+1)), I(t_(k+1))
               )
             }))
}

loglik_sir(log(c(3.204, 0.019)), Eyam) # Evaluate at mode



