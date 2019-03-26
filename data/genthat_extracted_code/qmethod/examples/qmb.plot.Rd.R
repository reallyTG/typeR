library(qmethod)


### Name: qmb.plot
### Title: Q Methodology: Plot of bootstrap results
### Aliases: qmb.plot
### Keywords: Q methodology bootstrapping plot

### ** Examples

data(lipset)
boots <- qmboots(lipset[[1]], nfactors = 3, nsteps = 50,
                load = "auto", rotation = "varimax", 
                indet = "qindet", fsi = TRUE)
                
boots.summary <- qmb.summary(boots)

qmb.plot(boots.summary, 3, type = "loa", sort="difference")



