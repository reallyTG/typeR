## ------------------------------------------------------------------------
library(SimRVPedigree)

## ------------------------------------------------------------------------
# load example hazards 
data("AgeSpecific_Hazards")

# print first three rows of AgeSpecific_Hazards dataset 
head(AgeSpecific_Hazards, n = 3)

## ------------------------------------------------------------------------
# specify partition of ages
age_part <- seq(0, 100, by = 1)

# create hazard object
LC_hazard <- hazard(partition = age_part,
                    hazardDF = AgeSpecific_Hazards)
LC_hazard

## ---- fig.width = 8, fig.height = 4--------------------------------------
par(mfrow = c(1, 2), mar = c(5.1, 5.1, 4.1, 2.1))

# plot age-specific hazard rate of disease by age
plot(x = seq(1, 100, by = 1), y = AgeSpecific_Hazards[,1],
     xlab = "Age (in years)", ylab = "Hazard Rate of Disease", 
     main = "Hazard Rate of Disease by Age", 
     ylim = c(0, 0.002), col = "red3", lwd = 2, type = "s")

# plot age-specific hazard rate of death by age
plot(x = seq(1, 100, by = 1), y = AgeSpecific_Hazards[,3],
     xlab = "Age (in years)", ylab = "Hazard Rate of Death",
     main = "Hazard Rate of Death by Age", 
     col = "goldenrod2", ylim = c(0, 1), lwd = 2, type = "s")
lines(x = seq(1, 100, by = 1), y = AgeSpecific_Hazards[,2],
     col = "dodgerblue", lwd = 2, type = "s")

# create legend to detail population type
legend("topleft", title = "Population", legend = c("General", "Affected"),
       col = c("dodgerblue", "goldenrod2"), lwd = 3)

## ------------------------------------------------------------------------
# simulate an ascertained pedigree 
set.seed(23985)
ex_RVped <- sim_RVped(hazard_rates = LC_hazard,
                      num_affected = 2,
                      ascertain_span = c(1995, 2010),
                      GRR = 10, carrier_prob = 0.002,
                      RVfounder = TRUE,
                      stop_year = 2017,
                      recall_probs = c(1),
                      founder_byears = c(1900, 1920),
                      FamID = 1)

# view a summary of ex_RVped 
summary(ex_RVped)

## ------------------------------------------------------------------------
# store the ascertained pedigree as ascPed
ascPed <- ex_RVped$ascertained_ped

# use summary function to view a summary of the ascertained pedigree
summary(ascPed)

## ------------------------------------------------------------------------
# determine the class of ascPed
class(ascPed)

# view first two rows of the ascertained pedigree
head(ascPed, n = 2)

## ---- fig.height = 6.5, fig.width = 6.5----------------------------------
# Plot the ascertained pedigree
plot(ascPed, location = "topleft")

## ---- fig.height = 6.5, fig.width = 6.5----------------------------------
# Plot the pedigree, with age labels, in 2017.
plot(ascPed, ref_year = 2017,
     location = "topleft",
     cex = 0.75, symbolsize = 1.15,
     mar = c(1, 2, 3, 2))

## ---- fig.height = 5.5, fig.width = 6.5----------------------------------
# Plot the pedigrees, with age labels,
# at the time of ascertainment.
plot(ascPed, ref_year = "ascYr",
     location = "topleft",
     cex = 0.75, symbolsize = 1.15,
     mar = c(1, 2, 3, 2))

## ---- fig.height = 6, fig.width = 8--------------------------------------
# load the EgPeds dataset
data(EgPeds)
class(EgPeds)

# create a ped object 
Bped1 <- new.ped(subset(EgPeds, FamID == 1))

# Re-assign the generation numbers and store as Aped1
Aped1 <- reassign_gen(Bped1)

# Plot the pedigree before and after generation reassignment.
# To plot with generation labels, we set gen_lab = TRUE. 
par(mfrow = c(1, 2))
plot(Bped1, 
     gen_lab = TRUE, 
     plot_legend = FALSE, 
     mar = c(1, 2, 3, 2))
mtext("Before Generation Reassignment", side = 3, line = 2)

plot(Aped1, 
     gen_lab = TRUE, 
     plot_legend = FALSE, 
     mar = c(1, 2, 3, 2))
mtext("After Generation Reassignment", side = 3, line = 2)

## ---- fig.height = 5, fig.width = 8--------------------------------------
# create a ped object from family 5 in EgPeds
Bped5 <- new.ped(subset(EgPeds, FamID == 5))

# Re-assign the generation numbers and store as Aped5
Aped5 <- reassign_gen(Bped5)

# Plot the pedigree before and after generation reassignment.
par(mfrow = c(1, 2))
plot(Bped5, 
     gen_lab = TRUE, 
     plot_legend = FALSE, 
     mar = c(1, 2, 3, 2))
mtext("Before Generation Reassignment", side = 3, line = 2)

plot(Aped5, 
     gen_lab = TRUE, 
     plot_legend = FALSE, 
     mar = c(1, 2, 3, 2))
mtext("After Generation Reassignment", side = 3, line = 2)

## ---- eval = FALSE-------------------------------------------------------
#  #Note that parallel processing is achieved using the doParallel package,
#  #however, to ensure that simulations are reproducible we incorporate
#  #the doRNG package.
#  
#  #assuming they have been installed, the required packages are loaded using the
#  #commands:
#  library(doParallel)
#  library(doRNG)
#  
#  # Before we create our cluster, let's determine how many processors are
#  #currently in use using the getDoParWorkers function.  Since we have not created
#  #a cluster yet, this function should return 1.
#  getDoParWorkers()
#  
#  #The number of cores available for parallel processing will depend on the
#  #computer.  To determine how many cores are available on your computer,
#  #execute the following command:
#  detectCores()
#  
#  #To run simulations in parallel we must create a cluster and then register the
#  #cluster. The following code illustrates how to create and register a cluster
#  #that will run simulations in parallel on 2 cores.
#  cl <- makeCluster(2)       # create cluster
#  registerDoParallel(cl)     # register cluster
#  
#  #Now that we have set up our cluster, getDoParWorkers() should return 2 instead of 1
#  getDoParWorkers()
#  
#  #To avoid problems, after you are finished using the cluster, you will want to
#  #stop it. This can be achieved by executing the following:
#  on.exit(stopCluster(cl))
#  #on.exit(stopCluster(cl)) automatically stops the cluster when you end the R
#  #session.  Alternatively, you could execute the command stopCluster(cl) after
#  #the simulation is complete.
#  
#  
#  #To ensure reproducibility, we make use of the %dorng% operator provided by the
#  #doRNG packag in the foreach loop, by specifing a random-number seed after .option.RNG.
#  npeds <- 100    #set the number of pedigrees to generate
#  RV_peds = foreach(i = seq(npeds),
#                    .combine = rbind,
#                    .packages = c("kinship2", "SimRVPedigree"),
#                    .options.RNG = 1984
#                    ) %dorng% {
#                      sim_RVped(hazard_rates = LC_hazard,
#                                num_affected = 2,
#                                ascertain_span = c(1995, 2010),
#                                GRR = 10, carrier_prob = 0.002,
#                                RVfounder = TRUE,
#                                stop_year = 2017,
#                                recall_probs = c(1),
#                                founder_byears = c(1900, 1920),
#                                FamID = i)[[2]]
#                      }

