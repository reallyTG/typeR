library(AHMbook)


### Name: simOcc
### Title: Simulate data for static occupancy models under wide range of
###   conditions
### Aliases: simOcc

### ** Examples

# Generate data with the default arguments and look at the structure:
tmp <- simOcc()
str(tmp)

# Simplest possible occupancy model, with constant occupancy and detection
str(simOcc(mean.occ=0.6, beta1=0, beta2=0, beta3=0, mean.det=0.3, time.effects=c(0, 0), 
  alpha1=0, alpha2=0, alpha3=0, sd.lp=0, b=0))
# psi = 1 (i.e., species occurs at every site)
str(simOcc(mean.occ=1))

# p = 1 (i.e., species is always detected when it occurs)
str(simOcc(mean.det=1))

# Other potentially interesting settings include these:
str(simOcc(J = 2))                 # Only 2 surveys
str(simOcc(M = 1, J = 100))        # No spatial replicates, but 100 measurements
str(simOcc(beta3 = 1))             # Including interaction elev-wind on p
str(simOcc(mean.occ = 0.96))       # A really common species
str(simOcc(mean.occ = 0.05))       # A really rare species
str(simOcc(mean.det = 0.96))       # A really easy species
str(simOcc(mean.det = 0.05))       # A really hard species
str(simOcc(mean.det = 0))          # The dreaded invisible species
str(simOcc(alpha1=-2, beta1=2))    # Opposing effects of elev on psi and p
str(simOcc(J = 10, time.effects = c(-5, 5))) # Huge time effects on p
str(simOcc(sd.lp = 10))            # Huge (random) site effects on p
str(simOcc(J = 10, b = 0))         # No behavioural response in p
str(simOcc(J = 10, b = 2))         # Trap happiness
str(simOcc(J = 10, b = -2))        # Trap shyness



