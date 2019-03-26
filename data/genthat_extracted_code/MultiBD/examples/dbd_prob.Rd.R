library(MultiBD)


### Name: dbd_prob
### Title: Transition probabilities of a death/birth-death process
### Aliases: dbd_prob

### ** Examples

## Not run: 
##D data(Eyam)
##D 
##D loglik_sir <- function(param, data) {
##D   alpha <- exp(param[1]) # Rates must be non-negative
##D   beta  <- exp(param[2])
##D 
##D   # Set-up SIR model
##D   drates1 <- function(a, b) { 0 }
##D   brates2 <- function(a, b) { 0 }
##D   drates2 <- function(a, b) { alpha * b     }
##D   trans12 <- function(a, b) { beta  * a * b }
##D 
##D   sum(sapply(1:(nrow(data) - 1), # Sum across all time steps k
##D              function(k) {
##D                log(
##D                  dbd_prob(  # Compute the transition probability matrix
##D                    t  = data$time[k + 1] - data$time[k], # Time increment
##D                    a0 = data$S[k], b0 = data$I[k],       # From: S(t_k), I(t_k)
##D                    drates1, brates2, drates2, trans12,
##D                    a = data$S[k + 1], B = data$S[k] + data$I[k] - data$S[k + 1],
##D                    computeMode = 4, nblocks = 80         # Compute using 4 threads
##D                  )[1, data$I[k + 1] + 1]                 # To: S(t_(k+1)), I(t_(k+1))
##D                )
##D              }))
##D   }
##D 
##D   loglik_sir(log(c(3.204, 0.019)), Eyam) # Evaluate at mode
## End(Not run)

# Birth-death-shift model for transposable elements

lam = 0.0188; mu = 0.0147; v = 0.00268; # birth, death, shift rates

drates1 <- function(a, b) { mu * a }
brates2 <- function(a, b) { lam * (a + b) }
drates2 <- function(a, b) { mu * b }
trans12 <- function(a, b) { v * a }

# Get transition probabilities
p <- dbd_prob(t = 1, a0 = 10, b0 = 0,
              drates1, brates2, drates2, trans12,
              a = 0, B = 50)




