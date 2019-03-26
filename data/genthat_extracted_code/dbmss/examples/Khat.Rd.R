library(dbmss)


### Name: Khat
### Title: Estimation of the K function
### Aliases: Khat

### ** Examples

data(paracou16)
plot(paracou16)

# Calculate K
r <- 0:30
(Paracou <- Khat(paracou16, r))

# Plot (after normalization by pi.r^2)
plot(Paracou, ./(pi*r^2) ~ r)



