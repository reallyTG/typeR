library(Brq)


### Name: summary.Brq
### Title: Summarize the output of the 'Brq' function
### Aliases: summary.Brq

### ** Examples

# Example 

fit = Brq(stack.loss~stack.x,tau=0.5, method= "Bqr", runs=5000, burn=1000)
summary(fit)



