library(DynTxRegime)


### Name: optimalSeq
### Title: Regression Based Value-Search Estimation of Optimal Dynamic
###   Treatment Regimes
### Aliases: optimalSeq

### ** Examples


# Load and process data set
  data(bmiData)

  # define response y to be the negative 12 month
  # change in BMI from baseline
  bmiData$y <- -100*(bmiData[,6] - bmiData[,4])/bmiData[,4]

# Define the propensity for treatment model and methods.
  moPropen <- buildModelObj(model =  ~ 1, 
                            solver.method = 'glm', 
                            solver.args = list('family'='binomial'),
                            predict.method = 'predict.glm',
                            predict.args = list(type='response'))


# Create modelObj object for main effect component
  moMain <- buildModelObj(model = ~ gender + parentBMI + month4BMI,
                          solver.method = 'lm')

# Create modelObj object for contrast component
  moCont <- buildModelObj(model = ~ parentBMI + month4BMI,
                          solver.method = 'lm')

# treatment regime rules at each decision point.
  regimes <- function(a,b,c,data){
               tst <- a + b*data$parentBMI + c*data$month4BMI > 0 
               res <- character(nrow(data))
               res[tst] <- "MR"
               res[!tst] <- "CD"
               return(res)
             }

# genoud requires some additional information 
  c1 <- c(-1,-1,-1)
  c2 <- c( 1, 1, 1)
  Domains <- cbind(c1,c2)
  starts <- c(0,0,0)

#!! A LARGER VALUE FOR POP.SIZE IS RECOMMENDED
#!! THIS VALUE WAS CHOSEN TO MINIMIZE RUN TIME OF EXAMPLES
  pop.size <- 50
## Not run: 
##D   ft <- optimalSeq(moPropen = moPropen, moMain = moMain, moCont = moCont, 
##D                    data = bmiData,  response = bmiData$y,  txName = "A2", 
##D                    regimes = regimes, iter = 0L,
##D                    pop.size = pop.size, starting.values = starts, 
##D                    Domains = Domains, solution.tolerance = 0.0001)
##D 
##D ## Available methods
##D 
##D   # Coefficients of the propensity score and outcome regression
##D   coef(ft)
##D 
##D   # Description of method used to obtain object
##D   DTRstep(ft)
##D 
##D   # Estimated value of estimated optimal treatment for training data
##D   estimator(ft)
##D 
##D   # Value object returned by outcome regression method
##D   fitObject(ft)
##D 
##D   # Value object returned by genetic algorithm
##D   genetic(ft)
##D 
##D   # Estimated optimal treatment for training data
##D   optTx(ft)
##D 
##D   # Estimated optimal treatment for new data
##D   optTx(ft, newdata = bmiData)
##D 
##D   # Value object returned by outcome regression method
##D   outcome(ft)
##D 
##D   # Plots if defined by outcome regression method
##D   dev.new()
##D   par(mfrow = c(2,4))
##D   plot(ft)
##D 
##D   dev.new()
##D   par(mfrow = c(2,4))
##D   plot(ft, suppress = TRUE)
##D 
##D   # Value object returned by propensity score regression method
##D   propen(ft)
##D 
##D   # Estimated decision function parameters
##D   regimeCoef(ft)
##D 
##D   # Show main results of method
##D   show(ft)
##D 
##D   # Show summary results of method
##D   summary(ft)
##D 
## End(Not run)




