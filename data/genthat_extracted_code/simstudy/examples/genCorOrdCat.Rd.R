library(simstudy)


### Name: genCorOrdCat
### Title: Generate correlated ordinal categorical data
### Aliases: genCorOrdCat

### ** Examples

#### Set definitions

baseprobs <- matrix(c(0.2, 0.1, 0.1, 0.6,
                      0.7, 0.2, 0.1, 0,
                      0.5, 0.2, 0.3, 0,
                      0.4, 0.2, 0.4, 0,
                      0.6, 0.2, 0.2, 0), 
                    nrow = 5, byrow = TRUE)
                    
set.seed(333)                     
dT <- genData(1000)

dX <- genCorOrdCat(dT, adjVar = NULL, baseprobs = baseprobs, 
                   prefix = "q", rho = .125, corstr = "cs")

dM <- melt(dX, id.vars = "id")
dProp <- dM[ , prop.table(table(value)), by = variable]
dProp[, response := c(1:4, 1:3, 1:3, 1:3, 1:3)]

dcast(dProp, variable ~ response, value.var = "V1", fill = 0)
                   



