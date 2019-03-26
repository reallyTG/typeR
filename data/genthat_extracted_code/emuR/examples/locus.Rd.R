library(emuR)


### Name: locus
### Title: Calculate locus equations for two-dimensional data
### Aliases: locus
### Keywords: math

### ** Examples



 # calculate an F2-locus equation for initial [d] 
# preceding lax vowels produced by female speaker "68".
# the onset is taken at the vowel onset; the
# vowel target is taken at the vowel's temporal midpoint.

# identify initial "d" of speaker "68"
temp <- vowlax.left == "d" & vowlax.spkr == "68"
# get the F2 value at the vowel's temporal midpoint
targ <- dcut(vowlax.fdat[temp,2], .5, prop=TRUE)
# F2 value at the vowel's acoustic onset.
on <- dcut(vowlax.fdat[temp,2], 0, prop=TRUE)

# locus equation plot
result <- locus(targ, on, vowlax.l[temp])
# statistical diagnostics of the regression line (locus equation)
summary(result)
# intercept and slope
result$coeff
# best estimate of the locus frequency, i.e. the
# point of bisection of on = TRUEarg with the regression line
result$locus





