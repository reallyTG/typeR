library(phenoCDM)


### Name: getGibbsSummary
### Title: Summarize Output of the CDM Model
### Aliases: getGibbsSummary
### Keywords: Gibbs Output Sammary Sampling

### ** Examples


#Summarize CDM Model Ouput

ssSim <- phenoSim(nSites = 2, #number of sites
                  nTSet = 30, #number of Time steps
                  beta = c(1, 2), #beta coefficients
                  sig = .01, #process error
                  tau = .1, #observation error
                  plotFlag = TRUE, #whether plot the data or not
                  miss = 0.05, #fraction of missing data
                  ymax = c(6, 3) #maximum of saturation trajectory
)

ssOut <- fitCDM(x = ssSim$x, #predictors
                nGibbs = 200,
                nBurnin = 100,
                z = ssSim$z,#response
                connect = ssSim$connect, #connectivity of time data
                quiet=TRUE)

summ <- getGibbsSummary(ssOut, burnin = 100, sigmaPerSeason = FALSE)

colMeans(summ$ymax)
colMeans(summ$betas)
colMeans(summ$tau)
colMeans(summ$sigma)




