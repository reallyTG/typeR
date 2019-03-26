library(dbmss)


### Name: Lhat
### Title: Estimation of the L function
### Aliases: Lhat

### ** Examples

data(paracou16)
plot(paracou16)

# Calculate L
r <- 0:30
(Paracou <- Lhat(paracou16, r))

# Plot
plot(Paracou)



