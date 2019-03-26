library(NPflow)


### Name: mmsNiWlogpdf
### Title: Probability density function of multiple structured Normal
###   inverse Wishart
### Aliases: mmsNiWlogpdf

### ** Examples

hyperG0 <- list()
hyperG0$b_xi <- c(-1.6983129, -0.4819131)
hyperG0$b_psi <- c(-0.0641866, -0.7606068)
hyperG0$kappa <- 0.001
hyperG0$D_xi <- 16.951313
hyperG0$D_psi <- 1.255192
hyperG0$nu <- 27.67656
hyperG0$lambda <- matrix(c(2.3397761, -0.3975259,-0.3975259, 1.9601773), ncol=2)

xi_list <- list()
psi_list <- list()
S_list <- list()
for(k in 1:1000){
 NNiW <- rNNiW(hyperG0, diagVar=FALSE)
 xi_list[[k]] <- NNiW[["xi"]]
 psi_list[[k]] <- NNiW[["psi"]]
 S_list[[k]] <- NNiW[["S"]]
}
mmsNiWlogpdf(U_xi=xi_list, U_psi=psi_list, U_Sigma=S_list,
            U_xi0=list(hyperG0$b_xi), U_psi0=list(hyperG0$b_psi) ,
            U_B0=list(diag(c(hyperG0$D_xi, hyperG0$D_psi))) ,
            U_Sigma0=list(hyperG0$lambda), U_df0=list(hyperG0$nu))


hyperG0 <- list()
hyperG0$b_xi <- c(-1.6983129)
hyperG0$b_psi <- c(-0.0641866)
hyperG0$kappa <- 0.001
hyperG0$D_xi <- 16.951313
hyperG0$D_psi <- 1.255192
hyperG0$nu <- 27.67656
hyperG0$lambda <- matrix(c(2.3397761), ncol=1)
#'xi_list <- list()
psi_list <- list()
S_list <- list()
for(k in 1:1000){
 NNiW <- rNNiW(hyperG0, diagVar=FALSE)
 xi_list[[k]] <- NNiW[["xi"]]
 psi_list[[k]] <- NNiW[["psi"]]
 S_list[[k]] <- NNiW[["S"]]
}

mmsNiWlogpdf(U_xi=xi_list, U_psi=psi_list, U_Sigma=S_list,
            U_xi0=list(hyperG0$b_xi), U_psi0=list(hyperG0$b_psi) ,
            U_B0=list(diag(c(hyperG0$D_xi, hyperG0$D_psi))) ,
            U_Sigma0=list(hyperG0$lambda), U_df0=list(hyperG0$nu))




