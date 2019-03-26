library(MCPMod)


### Name: plotModels
### Title: Plot candidate models
### Aliases: plotModels
### Keywords: hplot

### ** Examples

# JBS example
doses <- c(0,10,25,50,100,150)
models <- list(linear = NULL, emax = c(25),
            logistic = c(50, 10.88111), exponential = c(85),
            betaMod = matrix(c(0.33, 2.31, 1.39, 1.39),
             byrow=TRUE, nrow=2))
plotModels(models, doses, base = 0, maxEff = 0.4, scal = 200) 
# all models in one panel
plotModels(models, doses, base = 0, maxEff = 0.4, scal = 200,
           superpose = TRUE)

# plotModels can also be called using a fullMod object
fM <- fullMod(models, doses, base = 0, maxEff = 0.4, scal = 200)
plotModels(fM)
# or even easier
plot(fM)



