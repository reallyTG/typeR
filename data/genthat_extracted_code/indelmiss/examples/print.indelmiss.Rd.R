library(indelmiss)


### Name: print.indelmiss
### Title: Print summary information from fit
### Aliases: print.indelmiss

### ** Examples

indel <- indelrates(datasource = "simulation", seed = 1, taxa = 5,
             mu = 1, nu = 3, phyl = 5000,  pmiss = c(0.2, 0.5), toi = c(1, 3), 
             zerocorrection = TRUE, 
             modelnames = c("M1", "M2", "M3", "M4"),
             optmethod = "nlminb")
print(indel)



