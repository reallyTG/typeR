library(DAAG)


### Name: mignonette
### Title: Darwin's Wild Mignonette Data
### Aliases: mignonette
### Keywords: datasets

### ** Examples

print("Is Pairing Helpful? - Example 4.3.1")

attach(mignonette)
plot(cross ~ self, pch=rep(c(4,1), c(3,12))); abline(0,1) 
abline(mean(cross-self), 1, lty=2)
detach(mignonette)



