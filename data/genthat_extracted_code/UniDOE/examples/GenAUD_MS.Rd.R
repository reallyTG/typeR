library(UniDOE)


### Name: GenAUD_MS
### Title: Generating sequential Uniform Design of Experiments using
###   diffrent initial designs
### Aliases: GenAUD_MS

### ** Examples

D1 = DesignQuery(n = 18, s = 7, q = 3, crit = "MD2")
D2 = GenAUD_MS(X0=D1+1, n=18, crit="MD2",
               maxiter = 100, nshoot = 5,
               vis = TRUE)



