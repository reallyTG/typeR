library(linpk)


### Name: pkprofile.pkprofile
### Title: Continue an existing concentration-time profile.
### Aliases: pkprofile.pkprofile

### ** Examples

t.obs <- seq(0, 24, 0.1)
amt <- 1
ka <- 1
cl <- 0.25
vc <- 5

# One-compartment model with first-order absorption
# First dose at time 0
y <- pkprofile(t.obs, cl=cl, vc=vc, ka=ka, dose=list(t.dose=0, amt=amt))

# Second dose at 24h with a lower clearance
y <- pkprofile(y, t.obs+24, cl=0.5*cl, vc=vc, ka=ka, dose=list(t.dose=24, amt=amt))

# Third dose at 48h with a higher clearance
y <- pkprofile(y, t.obs+48, cl=2*cl, vc=vc, ka=ka, dose=list(t.dose=48, amt=amt))
plot(y)




