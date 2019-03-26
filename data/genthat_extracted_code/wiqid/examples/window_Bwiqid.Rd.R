library(wiqid)


### Name: window.Bwiqid
### Title: Time windows for 'Bwiqid' objects
### Aliases: window.Bwiqid
### Keywords: methods

### ** Examples

# Create a fake Bwiqid object:
fake <- data.frame(mu = rnorm(3000), sigma=rlnorm(3000))
class(fake) <- c("Bwiqid", "data.frame")
attr(fake, "n.chains") <- 3
fake

new <- window(fake, start=501, thin=10)
dim(new)
new



