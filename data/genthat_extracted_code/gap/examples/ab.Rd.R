library(gap)


### Name: ab
### Title: Test/Power calculation for mediating effect
### Aliases: ab
### Keywords: htest

### ** Examples

## Not run: 
##D 
##D ab()
##D n <- power <- vector()
##D for (j in 1:10)
##D {
##D    z <- ab(fold=j*0.01)
##D    n[j] <- z[1]
##D    power[j] <- z[2]
##D }
##D plot(n,power,xlab="Sample size",ylab="Power")
##D title("SNP-BMI-T2D association in EPIC-Norfolk study")
## End(Not run)



