library(multiband)


### Name: lomb_scargle
### Title: Lomb Scargle method
### Aliases: lomb_scargle

### ** Examples

n <- 1e3
set.seed(12345)
sigma <- runif(n)
t <- cumsum(runif(n))
A <- 2.3
rho <- 0.1
omega <- 0.2
beta0 <- 0.3
m <- beta0 + A*sin(omega*t + rho) + sigma*rnorm(n)
plot(t,m,xlab='time',ylab='magnitude',main='Simulated Light Curve',pch=16)

## Try several omega
nOmega <- 500
omega_seq <- seq(0.1,0.3,length=nOmega)
sol_ls <- vector(mode="list",length=nOmega)
RSS_seq <- double(nOmega)
for (i in 1:nOmega) {
  sol_ls[[i]] <- lomb_scargle(t,m,sigma,omega_seq[i])
  RSS_seq[i] <- sol_ls[[i]]$RSS
}

plot(omega_seq,RSS_seq,xlab=expression(omega),ylab='RSS',pch=16)
ix_min <- which(RSS_seq==min(RSS_seq))
sol_final <- sol_ls[[ix_min]]



