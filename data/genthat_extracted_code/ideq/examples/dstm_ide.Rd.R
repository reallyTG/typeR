library(ideq)


### Name: dstm_ide
### Title: Integrodifference equation (IDE) model
### Aliases: dstm_ide

### ** Examples

# Load example data
data("ide_standard", "ide_spatially_varying", "ide_locations")

# Basic IDE model with one kernel
mod <- dstm_ide(ide_standard, ide_locations)
predict(mod)
summary(mod)

# IDE model with spatially varying kernel
dstm_ide(ide_spatially_varying, ide_locations, knot_locs=4)

# Fix sigma2
dstm_ide(ide_standard, ide_locations, 
         sample_sigma2=FALSE, params=list(sigma2=1))

# Set proposal scaling factors, number of kernel updates per iteration,
# and prior distribution on kernel parameters
dstm_ide(ide_standard, ide_locations, 
         params=list(proposal_factor_mu=2, proposal_factor_Sigma=3,
                     kernel_updates_per_iter=2,
                     scale_Sigma_kernel=diag(2), df_Sigma_kernel=100,
                     mean_mu_kernel=c(0.2, 0.4), var_mu_kernel=diag(2)))
                     
# Set priors on state vector, process error, and observation error
J <- 1
P <- (2*J + 1)^2
dstm_ide(ide_standard, ide_locations,
         params=list(m_0=rep(1, P), C_0=diag(0.01, P),
                     alpha_sigma2=20, beta_sigma2=20,
                     scale_W=diag(P), df_W=100))



