library(multiband)


### Name: update_amplitude
### Title: Update Amplitude parameter
### Aliases: update_amplitude

### ** Examples

test_data <- synthetic_multiband()
B <- test_data$B
tms <- test_data$tms
beta <- test_data$beta
rho <- test_data$rho
omega <- test_data$omega
gamma <- 1
at <- rnorm(B)
at <- as.matrix(at/sqrt(sum(at**2)),ncol=1)

## Check answer
a_next <- update_amplitude(tms,beta,rho,omega,at,gamma)

e <- double(B)
xi <- double(B)
for (b in 1:B) {
  nb <- length(tms[[b]][,1])
  s <- sin(omega*tms[[b]][,1] + rho[b])
  w <- 1/(tms[[b]][,3]**2)
  e[b] <- t(s)%*%(w*s) + gamma
  xi[b] <- t(s)%*%(w*(tms[[b]][,2]-beta[b]))
}
a_direct <- solve(diag(e)-gamma*at%*%t(at),xi)
norm(as.matrix(a_direct-a_next),'f')



