library(multiband)


### Name: bcd_inexact
### Title: Inexact Block coordinate descent
### Aliases: bcd_inexact

### ** Examples

test_data <- synthetic_multiband()
B <- test_data$B
tms <- test_data$tms
beta <- test_data$beta
a <- test_data$a
rho <- test_data$rho
omega <- test_data$omega
at <- rnorm(B)
at <- as.matrix(at/sqrt(sum(at**2)),ncol=1)
at <- rep(1/sqrt(B),B)

## Verify monotonicity of block coordinate descent
gamma1 <- 100
gamma2 <- 10
max_iter <- 1e2
loss <- double(max_iter)
beta_next <- beta
a_next <- a
rho_next <- rho
for (iter in 1:max_iter) {
  sol_bcd <- bcd_inexact(tms,beta_next,a_next,at,rho_next,omega,gamma1=gamma1,gamma2=gamma2,
    max_iter=1)
  beta_next <- sol_bcd$beta0
  a_next <- sol_bcd$A
  rho_next <- sol_bcd$rho
  loss[iter] <- pnll(tms,beta_next,a_next,at,rho_next,omega,gamma1,gamma2)
}
loss <- c(pnll(tms,beta,a,at,rho,omega,gamma1,gamma2),loss)
plot(1:(max_iter+1),loss,xlab='iteration',ylab='objective',pch=16)

## Check to see if the fixed points of the BCD algorithm stops at
## a stationary point of the original problem
gradient_check(tms,beta_next,a_next,at,rho_next,omega,gamma1,gamma2)

## Example Pipeline
## 1. Use Lomb Scargle to fit initial estimate using all bands treated as one band.
t <- c(); m <- c(); sigma <- c()
for (b in 1:B) {
  t <- c(t,tms[[b]][,1])
  m <- c(m,tms[[b]][,2])
  sigma <- c(sigma,tms[[b]][,3])
}
sol_ls <- lomb_scargle(t,m,sigma,omega)

beta0_ls <- rep(sol_ls$beta0,B)
A_ls <- rep(sol_ls$A,B)
rho_ls <- rep(sol_ls$rho,B)
sol_bcd <- bcd_inexact(tms,beta0_ls,A_ls,at,rho_ls,omega,gamma1=gamma1,gamma2=gamma2,max_iter=5)

sol_bcd_rand <- bcd_inexact(tms,rep(-1,B),rep(0.1,B),at,rep(1,B),omega,gamma1=gamma1,gamma2=gamma2,
  max_iter=5)

## Try several omega
nOmega <- 10
omega_seq <- seq(0.1,0.3,length=nOmega)
sol_ls <- vector(mode="list",length=nOmega)
sol_bcd <- vector(mode="list",length=nOmega)
RSS_seq <- double(nOmega)
RSS_ls_seq <- double(nOmega)
for (i in 1:nOmega) {
  sol_ls[[i]] <- lomb_scargle(t,m,sigma,omega_seq[i])
  RSS_ls_seq[i] <- sol_ls[[i]]$RSS
  beta0_ls <- rep(sol_ls[[i]]$beta0,B)
  A_ls <- rep(sol_ls[[i]]$A,B)
  rho_ls <- rep(sol_ls[[i]]$rho,B)
  sol_bcd[[i]] <- bcd_inexact(tms,beta0_ls,A_ls,at,rho_ls,omega_seq[i],gamma1=gamma1,gamma2=gamma2,
    max_iter=10,tol=1e-10)
  RSS_seq[i] <- pnll(tms,sol_bcd[[i]]$beta0,sol_bcd[[i]]$A,at,sol_bcd[[i]]$rho,omega_seq[i],0,0)
  print(paste0("Completed ", i))
}
plot(omega_seq,RSS_seq,xlab=expression(omega),ylab='RSS',pch=16)
ix_min <- which(RSS_seq==min(RSS_seq))
sol_bcd_final <- sol_bcd[[ix_min]]



