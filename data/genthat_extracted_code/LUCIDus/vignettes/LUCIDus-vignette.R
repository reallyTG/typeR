## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(LUCIDus)

## ------------------------------------------------------------------------
set.seed(10)
IntClusFit <- est_lucid(G=G1,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE)

## ------------------------------------------------------------------------
summary_lucid(IntClusFit)

## ----fig.height=4, fig.width=7.25----------------------------------------
plot_lucid(IntClusFit)

## ------------------------------------------------------------------------
GridSearch <- tune_lucid(G=G1, Z=Z1, Y=Y1, K=2, Family="binary", USEY = TRUE, NoCores = 2,
                         LRho_g = 0.008, URho_g = 0.012, NoRho_g = 3,
                         LRho_z_invcov = 0.04, URho_z_invcov = 0.06, NoRho_z_invcov = 3,
                         LRho_z_covmu = 90, URho_z_covmu = 100, NoRho_z_covmu = 3)

## ------------------------------------------------------------------------
GridSearch$Results

## ------------------------------------------------------------------------
GridSearch$Optimal

## ------------------------------------------------------------------------
set.seed(0.01*0.05*95)
IntClusFit <- est_lucid(G=G1,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE,
                        tunepar = def_tune(Select_G=TRUE,Select_Z=TRUE,
                                           Rho_G=0.01,Rho_Z_InvCov=0.05,Rho_Z_CovMu=95))

## ------------------------------------------------------------------------
summary_lucid(IntClusFit)$No0G; summary_lucid(IntClusFit)$No0Z
colnames(G1)[summary_lucid(IntClusFit)$select_G]; colnames(Z1)[summary_lucid(IntClusFit)$select_Z]

## ------------------------------------------------------------------------
if(!all(summary_lucid(IntClusFit)$select_G==FALSE)){
    G_select <- G1[,summary_lucid(IntClusFit)$select_G]
}
if(!all(summary_lucid(IntClusFit)$select_Z==FALSE)){
    Z_select <- Z1[,summary_lucid(IntClusFit)$select_Z]
}

## ------------------------------------------------------------------------
set.seed(10)
IntClusFitFinal <- est_lucid(G=G_select,Z=Z_select,Y=Y1,K=2,family="binary",Pred=TRUE)

## ----fig.height=4, fig.width=7.25----------------------------------------
plot_lucid(IntClusFitFinal)

## ------------------------------------------------------------------------
# Re-run the model with covariates in the G->X path
set.seed(10)
IntClusCoFit <- est_lucid(G=G1,CoG=CoG,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE)

## ----fig.height=4, fig.width=7.25----------------------------------------
# Check important model outputs
summary_lucid(IntClusCoFit)

# Visualize the results
plot_lucid(IntClusCoFit)

## ----fig.height=4, fig.width=7.25----------------------------------------
# Re-run feature selection with covariates in both paths
set.seed(10)
IntClusCoFit <- est_lucid(G=G1,CoG=CoG,Z=Z1,Y=Y1,CoY=CoY,K=2,family="binary",Pred=TRUE,
                          initial=def_initial(), itr_tol=def_tol(),
                          tunepar = def_tune(Select_G=TRUE,Select_Z=TRUE,
                          Rho_G=0.02,Rho_Z_InvCov=0.1,Rho_Z_CovMu=93))

# Re-fit with selected features with covariates
set.seed(10)
IntClusCoFitFinal <- est_lucid(G=G_select,CoG=CoG,Z=Z_select,Y=Y1,CoY=CoY,K=2,
                               family="binary",Pred=TRUE)

# Visualize the results
plot_lucid(IntClusCoFitFinal)

## ----eval = FALSE--------------------------------------------------------
#  set.seed(10)
#  sem_lucid(G=G2,Z=Z2,Y=Y2,useY=TRUE,K=2,Pred=TRUE,family="normal",Get_SE=TRUE,
#              itr_tol = def_tol(tol_b = 1e-02, tol_m = 1e-02, tol_s = 1e-02, tol_g = 1e-02))

