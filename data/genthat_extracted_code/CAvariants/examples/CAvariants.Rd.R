library(CAvariants)


### Name: CAvariants
### Title: Six variants of correspondence analysis
### Aliases: CAvariants
### Keywords: correspondence analysis variants multivariate

### ** Examples

data(asbestos)
CAvariants(asbestos, catype = "CA", firstaxis = 1, lastaxis = 2) 
CAvariants(asbestos, catype = "DOCA", mi = c(1:nrow(asbestos)), mj =c(4.5,14.5,24.5,34.5,44.5),  
firstaxis = 1,lastaxis = 2, ellcomp = TRUE, M = min(nrow(asbestos), ncol(asbestos)) - 1) 
CAvariants(asbestos, catype = "DONSCA", firstaxis = 1, lastaxis = 2) 
data(shopdataM)
CAvariants(shopdataM, catype = "NSCA", firstaxis = 1, lastaxis = 3)
CAvariants(shopdataM, catype = "SONSCA", firstaxis = 1, lastaxis = 2)
CAvariants(shopdataM, catype = "SOCA", firstaxis = 1, lastaxis = 2)



