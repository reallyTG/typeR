library(lmomco)


### Name: tttlmomco
### Title: Total Time on Test Transform of Distributions
### Aliases: tttlmomco
### Keywords: quantile function total time on test transform
###   lifetime/reliability analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0
tttlmomco(0.5, A)  # The median lifetime = 859 days

f <- c(0.25,0.75) # All three computations report: 306.2951 and 1217.1360 days.
Tu1 <- cmlmomco(f=0, A) - (1-f)* rmlmomco(f, A)
Tu2 <-    par2qua(f, A) -    f * rrmlmomco(f, A)
Tu3 <- (1-f)*par2qua(f, A) + cmlmomco(f=0, A)*lrzlmomco(f, A)

if(abs(cmlmomco(0,A) - tttlmomco(1,A)) < 1E-4) {
   print("These two quantities should be nearly identical.\n")
}



