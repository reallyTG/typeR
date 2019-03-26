library(phenoCDM)


### Name: phenoSim
### Title: Simulate Green-up Phenology Data
### Aliases: phenoSim
### Keywords: Data Phenology Simulate

### ** Examples


#Simulate Phenology Data
ssSim <- phenoSim(nSites = 2, #number of sites
                  nTSet = 30, #number of time steps
                  beta = c(1, 2), #beta coefficients
                  sig = .01, #process error
                  tau = .1, #observation error
                  plotFlag = TRUE, #whether plot the data or not
                  miss = 0.05, #fraction of missing data
                  ymax = c(6, 3) #maximum of saturation trajectory
)




