library(breakfast)


### Name: tguh.reconstr
### Title: The inverse Tail-Greedy Unbalanced Haar transformation
### Aliases: tguh.reconstr

### ** Examples

rnoise <- rnorm(10)
rnoise.tguh <- tguh.decomp(rnoise)
print(rnoise.tguh)
rnoise.denoise <- tguh.denoise(rnoise.tguh, 3)
rnoise.clean <- tguh.reconstr(rnoise.denoise)
print(rnoise.clean)



