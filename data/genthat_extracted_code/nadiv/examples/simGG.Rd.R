library(nadiv)


### Name: simGG
### Title: Genetic group pedigree and data simulation
### Aliases: simGG

### ** Examples


  ## Not run: 
##D   # The dataset 'ggTutorial' was simulated as:
##D   set.seed(102)      		# seed used to simulate ggTutorial
##D   ggTutorial <- simGG(K = 400, pairs = 200, noff = 4, g = 15,
##D 	nimm = 40,
##D 	muf = 0, mui = 3)
##D   
## End(Not run)

# Use genetic group methods to approximate the breeding values for ggTutorial
  ## First, construct a pedigree with genetic groups
  ggPed <- ggTutorial[, c("id", "dam", "sire", "is", "gen")]
  naPar <- which(is.na(ggPed[, 2]))
  ggPed$GG <- rep("NA", nrow(ggPed))
    # 'focal' population genetic group = "foc0" and 'immigrant' = "g1"
    # obtained by pasting "foc" & "g" with immigrant status "0" or "1", respectively
    ggPed$GG[naPar] <- as.character(ggPed$is[naPar])
    ggPed$GG[ggPed$GG == "0"] <- paste0("foc", ggPed$GG[ggPed$GG == "0"])
    ggPed$GG[ggPed$GG == "1"] <- paste0("g", ggPed$GG[ggPed$GG == "1"])
  ggPed[naPar, 2:3] <- ggPed[naPar, "GG"]

  ## Now create the Q matrix
  Q <- ggcontrib(ggPed[, 1:3], ggroups = c("foc0", "g1"))

  ## obtain the true values of the genetic group means
  foc0_mean <- mean(ggTutorial$u[which(ggTutorial$gen == 1 & ggTutorial$is == 0)])
  g1_mean <- mean(ggTutorial$u[which(ggTutorial$is == 1)])
  g_exp <- matrix(c(foc0_mean, g1_mean), ncol = 1)

  ## breeding values (a) are:
  ### tot. add. gen. effects (u) minus genetic group effects for each individual (Qg):
  a <- ggTutorial$u - Q %*% g_exp





