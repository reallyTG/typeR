library(dbmss)


### Name: Kdhat
### Title: Estimation of the Kd function
### Aliases: Kdhat

### ** Examples

data(paracou16)
plot(paracou16)

# Calculate Kd
(Paracou <- Kdhat(paracou16, , "Q. Rosea", "V. Americana"))
# Plot
plot(Paracou)



