library(indelmiss)


### Name: plot.indelmiss
### Title: Plot parameter estimates from the model fit
### Aliases: plot.indelmiss

### ** Examples

indel <- indelrates(datasource = "simulation", seed = 1, taxa = 5,
             mu = 1, nu = 5, phyl = 5000,  pmiss = 0, toi = 1, 
             bgtype="ancestornodes", bg = c(7, 9), 
             zerocorrection = TRUE, rootprob="maxlik",  
             modelnames = c("M1", "M2", "M3", "M4"),
             optmethod = "nlminb")
print(indel)
plot(indel, model="M4") 



