library(circglmbayes)


### Name: generateCircGLMData
### Title: Generate data that follows the circular GLM model
### Aliases: generateCircGLMData

### ** Examples


# Von Mises data with mean 2, kappa 3.
generateCircGLMData(truebeta0 = 2, residkappa = 3,
                    nconpred = 0, ncatpred = 0)

# circGLM data
generateCircGLMData(n = 20, nconpred = 4, truebeta = c(0, 0.4, 0.2, 0.05))




