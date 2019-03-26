library(adaptivetau)


### Name: ssa.adaptivetau
### Title: Approximate stochastic simulation algorithm
### Aliases: ssa.adaptivetau adaptivetau
### Keywords: datagen ts

### ** Examples


## Simple Lotka-Volterra example

# We have three potential transitions:
transitions = list(c(prey = +1), # prey grow
                   c(prey = -2, pred = +1), # predation
                   c(pred = -1)) # predator dies

# Function to calculate transition rates, given variables and parameters
lvrates <- function(x, params, t) {
  return(c(params$preygrowth*x["prey"],     # rate of prey growing
           x["prey"]*x["pred"]*params$eat,  # rate of predation
           x["pred"]*params$preddeath))     # rate of predators dying
}

# Set the Lotka-Volterra parameters
params = list(preygrowth=10, eat=0.01, preddeath=10);

# Set the random seed (only necessary if you want to reproduce results)
set.seed(4)

# Perform the stochastic simulation!
r=ssa.adaptivetau(c(prey = 1000, pred = 500),
                  transitions, lvrates, params, tf=12)

# Plot the results
matplot(r[,"time"], r[,c("prey","pred")], type='l', xlab='Time',
        ylab='Counts (log scale)', log='y')
legend("bottomleft", legend=c("prey", "predator"), lty=1:2, col=1:2)


# However, if you are interested in very fine-scale variance, perhaps the
# default parameters smooth too much.  Try reducing the tl.param epsilon
# to see a better approximation:
s=ssa.adaptivetau(c(prey = 1000, pred = 500),
                  transitions, lvrates, params, tf=12,
                  tl.params = list(epsilon=0.01)) # reduce "epsilon"
par(mfrow=c(2,1));
matplot(r[r[,"time"]<2,"time"], r[r[,"time"]<2,c("prey","pred")],
        type='l', xlab='Time', ylab='Counts', main="Original (epsilon=default)")
matplot(s[s[,"time"]<2,"time"], s[s[,"time"]<2,c("prey","pred")],
        type='l', xlab='Time', ylab='Counts', main="Fine-scale (epsilon=0.01)")



