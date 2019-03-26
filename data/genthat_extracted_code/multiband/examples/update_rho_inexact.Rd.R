library(multiband)


### Name: update_rho_inexact
### Title: Update Phase parameter
### Aliases: update_rho_inexact

### ** Examples

test_data <- synthetic_multiband()
tms <- test_data$tms
B <- test_data$B
beta <- test_data$beta
a <- test_data$a
rho <- test_data$rho
omega <- test_data$omega
gamma <- 1

## Check answer
rho_next <- update_rho_inexact(tms,beta,a,rho,omega,gamma,max_iter=1)

L <- update_Lipschitz(tms,beta,a)
f <- L + gamma
zeta <- update_zeta(tms,beta,a,rho,L,omega)
rho_direct <- solve(diag(f)-(gamma/B),zeta)
norm(as.matrix(rho_direct-rho_next),'f')

## Verify monotonicity of MM algorithm
max_iter <- 1e2
obj <- double(max_iter)
loss <- double(max_iter)
rho_last <- rho
at <- rep(1/sqrt(B),B)
for (iter in 1:max_iter) {
  rho_next <- update_rho_inexact(tms,beta,a,rho_last,omega,gamma,max_iter=1)
  obj[iter] <- mm_phase_obj(rho_next,tms,beta,a,at,rho_last,omega,gamma,gamma)
  loss[iter] <- pnll(tms,beta,a,at,rho_next,omega,gamma,gamma)
  rho_last <- rho_next
}
obj <- c(mm_phase_obj(rho,tms,beta,a,at,rho,omega,gamma,gamma),obj)
plot(1:(max_iter+1),obj,xlab='iteration',ylab='mm objective',pch=16)
loss <- c(pnll(tms,beta,a,at,rho,omega,gamma,gamma),loss)
plot(1:(max_iter+1),loss,xlab='iteration',ylab='loss',pch=16)



