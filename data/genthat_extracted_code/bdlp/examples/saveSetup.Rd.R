library(bdlp)


### Name: saveSetup
### Title: Saves a list of metadata objects to a new setup file
### Aliases: saveSetup

### ** Examples

require(MASS)
a = new("metadata.metric", 
        clusters = list(c1 = list(n = 25, mu = c(4,5), Sigma=diag(1,2)),
                        c2 = list(n = 25, mu = c(-1,-2), Sigma=diag(1,2))),
                        genfunc = mvrnorm)
b = new("metadata.metric", 
        clusters = list(c1 = list(n = 44, mu = c(1,2), Sigma=diag(1,2)),
                        c2 = list(n = 66, mu = c(-5,-6), Sigma=diag(1,2))),
                        genfunc = mvrnorm)
saveSetup(name="test2002.R", author="Mister Twister", mail="mister.twister@edu.com",
           inst="Twister University", cit="Simple Data, pp. 23-24", objects=list(a, b),
           table=data.frame(n = c(50, 110), k = c(2,2), shape = c("spherical", "spherical")))  



