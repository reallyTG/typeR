library(indelmiss)


### Name: plotrates
### Title: Plot estimates for insertion and deletion rates
### Aliases: plotrates

### ** Examples

indel <- indelrates(datasource = "simulation", seed = 1, taxa = 5,
             mu = 1, nu = 5, phyl = 5000,  pmiss = 0, toi = 1, 
             bgtype="ancestornodes", bg = c(7, 9), 
             zerocorrection = TRUE, 
             modelnames = c("M1", "M2", "M3", "M4"),
             optmethod = "nlminb")
print(indel)
plotrates(indel, model="M4") 



