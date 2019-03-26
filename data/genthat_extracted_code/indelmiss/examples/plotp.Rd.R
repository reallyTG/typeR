library(indelmiss)


### Name: plotp
### Title: Plot estimates for the parameter that accounts for possible
###   missing data
### Aliases: plotp

### ** Examples

indel <- indelrates(datasource = "simulation", seed = 1, taxa = 5,
             mu = 1, nu = 5, phyl = 5000,  pmiss = 0, toi = 1, 
             bgtype="ancestornodes", bg = c(7, 9), 
             zerocorrection = TRUE, rootprob = "stationary", 
             modelnames = c("M1", "M2", "M3", "M4"),
             optmethod = "nlminb")
print(indel)
plotp(indel, model="M4") 



