library(dbmss)


### Name: ghat
### Title: Estimation of the g function
### Aliases: ghat

### ** Examples

data(paracou16)
plot(paracou16)

# Calculate g
r <- 0:30
(Paracou <- ghat(paracou16, r, "Q. Rosea", "V. Americana"))

# Plot
plot(Paracou)



