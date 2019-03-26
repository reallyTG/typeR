library(MultiBD)


### Name: bbd_prob
### Title: Transition probabilities of a birth/birth-death process
### Aliases: bbd_prob

### ** Examples

## Not run: 
##D data(Eyam)
##D 
##D # (R, I) in the SIR model forms a birth/birth-death process
##D 
##D loglik_sir <- function(param, data) {
##D   alpha <- exp(param[1]) # Rates must be non-negative
##D   beta  <- exp(param[2])
##D   N <- data$S[1] + data$I[1] + data$R[1]
##D   
##D   # Set-up SIR model with (R, I)
##D   
##D   brates1 <- function(a, b) { 0 }
##D   brates2 <- function(a, b) { beta  * max(N - a - b, 0)  * b }
##D   drates2 <- function(a, b) { 0 }
##D   trans21 <- function(a, b) { alpha * b }
##D   
##D   sum(sapply(1:(nrow(data) - 1), # Sum across all time steps k
##D              function(k) {
##D                log(
##D                  bbd_prob( # Compute the transition probability matrix
##D                    t  = data$time[k + 1] - data$time[k], # Time increment
##D                    a0 = data$R[k], b0 = data$I[k],       # From: R(t_k), I(t_k)
##D                    brates1, brates2, drates2, trans21,
##D                    A = data$R[k + 1], B = data$R[k + 1] + data$I[k] - data$R[k],
##D                    computeMode = 4, nblocks = 80         # Compute using 4 threads
##D                  )[data$R[k + 1] - data$R[k] + 1, 
##D                    data$I[k + 1] + 1]                    # To: R(t_(k+1)), I(t_(k+1))
##D                )
##D              }))
##D }
##D 
##D loglik_sir(log(c(3.204, 0.019)), Eyam) # Evaluate at mode
## End(Not run)



