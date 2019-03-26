## ---- eval=F-------------------------------------------------------------
#  fitMPT <- traitMPT(
#      eqnfile = "2htm.txt",
#      data = "data_ind.csv",
#      restrictions = list("Dn=Do", "g=.5"),
#      covData = "data_covariates.csv",
#      corProbit = TRUE,
#      predStructure = list("Do ; IQ"), # IQ as predictor for Do=Dn
#      ...)

## ---- eval=F-------------------------------------------------------------
#  fitMPT <- traitMPT(eqnfile = "2htm.txt",
#      data = "data_ind.csv",
#      covData = "data_covariates.csv",
#      predStructure = list("Do ; factor1",
#                           "Dn ; factor2"), # discrete factors
#      predType = c("c", "c", "f", "r")
#      ...)

## ---- eval=F-------------------------------------------------------------
#  getGroupMeans(fitMPT)

## ---- eval=FALSE---------------------------------------------------------
#  transformedParameters = list("deltaG = G_1-G_2",     # difference of parameters
#                               "G1_larger = G_1>G_2")  # Bayesian p-value / testing order constraints

## ---- eval=FALSE---------------------------------------------------------
#  # beta-MPT
#  genBeta <- genBetaMPT(
#                N = 100,                            # number of participants
#                numItems = c(Target=250, Lure=250), # number of responses per tree
#                eqnfile = "2htm.eqn",               # path to MPT file
#                mean = c(Do=.7, Dn=.7, g=.5),       # true group-level parameters
#                sd =   c(Do=.1, Dn=.1, g=.05))      # SD of individual parameters
#  
#  # latent-trait MPT
#  genTrait <- genTraitMPT(
#                N = 100,                             # number of participants
#                numItems = c(Target=250, Lure=250),  # number of responses per tree
#                eqnfile = "2htm.eqn",                # path to MPT file
#                mean = c(Do=.7, Dn=.7, g=.5),        # true group-level parameters
#                sigma =   c(Do=.25, Dn=.25, g=.05),  # SD of latent (!) individual parameters
#                rho = diag(3))                       # correlation matrix. here: no correlation

