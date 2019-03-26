library(ODEsensitivity)


### Name: plot.ODEsobol
### Title: Plot of the Results of Sobol' Sensitivity Analysis for Objects
###   of Class 'ODEsobol'
### Aliases: plot.ODEsobol

### ** Examples

##### Lotka-Volterra equations #####
LVmod <- function(Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    Ingestion    <- rIng  * Prey * Predator
    GrowthPrey   <- rGrow * Prey * (1 - Prey/K)
    MortPredator <- rMort * Predator
    
    dPrey        <- GrowthPrey - Ingestion
    dPredator    <- Ingestion * assEff - MortPredator
    
    return(list(c(dPrey, dPredator)))
  })
}
LVpars  <- c("rIng", "rGrow", "rMort", "assEff", "K")
LVbinf <- c(0.05, 0.05, 0.05, 0.05, 1)
LVbsup <- c(1.00, 3.00, 0.95, 0.95, 20)
LVinit  <- c(Prey = 1, Predator = 2)
LVtimes <- c(0.01, seq(1, 50, by = 1))
set.seed(59281)
# Warning: The following code might take very long!
## No test: 
LVres_sobol <- ODEsobol(mod = LVmod,
                        pars = LVpars,
                        state_init = LVinit,
                        times = LVtimes,
                        n = 500,
                        rfuncs = "runif",
                        rargs = paste0("min = ", LVbinf,
                                       ", max = ", LVbsup),
                        sobol_method = "Martinez",
                        ode_method = "lsoda",
                        parallel_eval = TRUE,
                        parallel_eval_ncores = 2)
my_cols <- c("firebrick", "orange2", "dodgerblue", 
             "forestgreen", "black")
plot(LVres_sobol, colors_pars = my_cols)
plot(LVres_sobol, pars_plot = c("rGrow", "rMort"), state_plot = "Predator", 
     colors_pars = my_cols[2:3])
## End(No test)

##### A network of 4 mechanical oscillators connected in a circle #####
M_mat <- rep(2, 4)
K_mat <- diag(rep(2 * (2*pi*0.17)^2, 4))
K_mat[1, 2] <- K_mat[2, 3] <- 
  K_mat[3, 4] <- K_mat[1, 4] <- 2 * (2*pi*0.17)^2 / 10
D_mat <- diag(rep(0.05, 4))
library("ODEnetwork")
lfonet <- ODEnetwork(masses = M_mat, dampers = D_mat, springs = K_mat)
LFOpars <- c("k.1", "k.2", "k.3", "k.4",
             "d.1", "d.2", "d.3", "d.4")
LFObinf <- c(rep(0.2, 4), rep(0.01, 4))
LFObsup <- c(rep(20, 4), rep(0.1, 4))
lfonet <- setState(lfonet, state1 = rep(2, 4), state2 = rep(0, 4))
LFOtimes <- seq(25, 150, by = 2.5)
set.seed(1739)
# Warning: The following code might take very long!
## No test: 
suppressWarnings(
  LFOres_sobol <- ODEsobol(mod = lfonet,
                           pars = LFOpars,
                           times = LFOtimes,
                           n = 500,
                           rfuncs = "runif",
                           rargs = paste0("min = ", LFObinf,
                                          ", max = ", LFObsup),
                           sobol_method = "Martinez",
                           parallel_eval = TRUE,
                           parallel_eval_ncores = 2)
)
plot(LFOres_sobol, pars_plot = paste0("k.", 1:4), state_plot = "x.2",
     colors_pars = my_cols)
## End(No test)




