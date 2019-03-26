library(MCPMod)


### Name: MCPMod
### Title: Perform MCPMod analysis of a data set
### Aliases: MCPMod print.MCPMod print.summary.MCPMod summary.MCPMod
### Keywords: models htest

### ** Examples

## Not run: 
##D # (i)
##D # example from Biometrics paper p. 743
##D data(biom)
##D models <- list(linear = NULL, linlog = NULL, emax = 0.2,
##D             exponential = c(0.279,0.15), quadratic = c(-0.854,-1))
##D dfe <- MCPMod(biom, models, alpha = 0.05, dePar = 0.05, pVal = TRUE,
##D            selModel = "maxT", doseEst = "MED2", clinRel = 0.4, off = 1)
##D # detailed information is available via summary
##D summary(dfe)
##D # plots data with selected model function
##D plot(dfe)
##D 
##D # example with IBS data
##D data(IBS)
##D models <- list(emax = 0.2, quadratic = -0.2, linlog = NULL)
##D dfe2 <- MCPMod(IBS, models, alpha = 0.05, pVal = TRUE,
##D              selModel = "aveAIC", clinRel = 0.25, off = 1)
##D dfe2
##D # show more digits in the output
##D print(dfe2, digits = 8)
##D summary(dfe2, digits = 8)
##D plot(dfe2, complData = TRUE, cR = TRUE)
##D plot(dfe2, CI = TRUE)
##D 
##D # simulate dose-response data
##D dfData <- genDFdata(model = "emax", argsMod = c(e0 = 0.2, eMax = 1, 
##D           ed50 = 0.05), doses = c(0,0.05,0.2,0.6,1), n=20, sigma=0.5)
##D models <- list(emax = 0.1, logistic = c(0.2, 0.08), 
##D              betaMod = c(1, 1))
##D dfe3 <- MCPMod(dfData, models, clinRel = 0.4, critV = 1.891, 
##D            scal = 1.5)
## End(Not run)
# (ii) Example for constructing a model list

# Contrasts to be included:
# Model             guesstimate(s) for stand. model parameter(s) (name)
# linear            -
# linear in log     -
# Emax              0.2 (ED50)
# Emax              0.3 (ED50)
# exponential       0.7 (delta)
# quadratic        -0.85 (delta)
# logistic          0.4  0.09 (ED50, delta)
# logistic          0.3  0.1 (ED50, delta)
# betaMod           0.3  1.3 (delta1, delta2) 
# sigmoid Emax      0.5  2 (ED50, h)
#
# For each model class exactly one list entry needs to be used.
# The names for the list entries need to be written exactly 
# as the model functions ("linear", "linlog", "quadratic", "emax", 
# "exponential", "logistic", "betaMod", "sigEmax").
# For models with no parameter in the standardized model just NULL is 
# specified as list entry.
# For models with one parameter a vector needs to be used with length
# equal to the number of contrasts to be used for this model class.
# For the models with two parameters in the standardized model a vector
# is used to hand over the contrast, if it is desired to use just one
# contrast. Otherwise a matrix with the guesstimates in the rows needs to
# be used. For the above example the models list has to look like this

list(linear = NULL, linlog = NULL, emax = c(0.2, 0.3),
     exponential = 0.7, quadratic = -0.85, logistic =
     matrix(c(0.4, 0.3, 0.09, 0.1), nrow = 2),
     betaMod = c(0.3, 1.3), sigEmax = c(0.5, 2))

# Additional parameters (who will not be estimated) are the "off"
# parameter for the linlog model and the "scal" parameter for the
# beta model, which are not handed over in the model list.


# (iii) example for incorporation of a usermodel
# simulate dose response data
dats <- genDFdata("sigEmax", c(e0 = 0, eMax = 1, ed50 = 2, h = 2),
              n = 50, sigma = 1, doses = 0:10)
# define usermodel
userMod <- function(dose, a, b, d){
  a + b*dose/(dose + d)
}
# define gradient
userModGrad <- 
    function(dose, a, b, d) cbind(1, dose/(dose+d), -b*dose/(dose+d)^2)    
# name starting values for nls
start <- list(userMod=c(a=0, b=1, d=2))       
models <- list(userMod=c(0, 1, 1), linear = NULL)
MM1 <- MCPMod(dats, models, clinRel = 0.4, selModel="AIC", start = start,
         uGrad = userModGrad)

# (iv) Contrast matrix and critical value handed over and not calculated
# simulate dose response data
dat <- genDFdata(mu = (0:4)/4, n = 20, 
                       sigma = 1, doses = (0:4)/4)
# construct optimal contrasts and critical value with planMM
doses <- (0:4)/4
mods <- list(linear = NULL, quadratic = -0.7)
pM <- planMM(mods, doses, 20)
MCPMod(dat, models = NULL, clinRel = 0.3, contMat = pM$contMat,
     critV = pM$critVal)
## Not run: 
##D # (v) Using MCPMod for mutiple contrast tests only
##D mu1 <- c(1, 2, 2, 2, 2)                      
##D mu2 <- c(1, 1, 2, 2, 2)                      
##D mu3 <- c(1, 1, 1, 2, 2)                      
##D mMat <- cbind(mu1, mu2, mu3)              
##D dimnames(mMat)[[1]] <- doses               
##D pM <- planMM(muMat = mMat, doses = doses, n = 20, cV = FALSE)
##D # calculate p-values
##D fit <-MCPMod(dat, models = NULL, clinRel = 0.3, contMat = pM$contMat,
##D         pVal = TRUE, testOnly = TRUE)
##D summary(fit)
## End(Not run)



