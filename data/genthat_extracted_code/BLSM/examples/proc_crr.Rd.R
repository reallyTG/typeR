library(BLSM)


### Name: proc_crr
### Title: Procrustean corresponding positions
### Aliases: proc_crr

### ** Examples

# Create configuration and center it at the origin
pos_ref = matrix(runif(20), ncol=2)
pos_ref = t(t(pos_ref)-colMeans(pos_ref))

# Create a new configuration by adding a perturbation to the previous one
pos = pos_ref + matrix(rnorm(20, mean=1, sd=0.1), ncol=2)

# Compute the Procrustean Transform and inspect the results
proc_pos = proc_crr(pos, pos_ref)
plot(pos_ref, col="blue", pch=20, xlim=c(-1,3), ylim=c(-1,3))
points(pos, col="red", pch=20)
points(proc_pos, col="purple", pch=20)



