library(renpow)


### Name: harmonics
### Title: AC Harmonic Distortion
### Aliases: ACharmonics harmonic
### Keywords: hplot dplot math

### ** Examples


# single phase harmonics
x <- list(c(10,0)); harm.odd <- list(c(0.2,0.1,0.05)); lab.units <- "I [A]"
y <- harmonic(x,harm.odd,lab.units)

# three-phase harmonics
x <- list(c(10,0),c(10,-120),c(10,120))
harm.odd <- list(c(0.2,0.1,0.05),c(0.2,0.1,0.05),c(0.2,0.1,0.05))
lab.units <- "I [A]"
y <- harmonic(x,harm.odd,lab.units)




