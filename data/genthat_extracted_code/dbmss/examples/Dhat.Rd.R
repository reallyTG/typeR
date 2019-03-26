library(dbmss)


### Name: Dhat
### Title: Estimation of the D function
### Aliases: Dhat

### ** Examples

data(paracou16)
plot(paracou16)

# Calculate D
r <- 0:30
(Paracou <- Dhat(paracou16, r, "V. Americana", "Q. Rosea", Intertype = TRUE))

# Plot (after normalization by pi.r^2)
plot(Paracou, ./(pi*r^2) ~ r)



