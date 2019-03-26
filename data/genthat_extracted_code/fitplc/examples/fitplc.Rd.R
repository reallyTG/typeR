library(fitplc)


### Name: fitcond
### Title: Fit a PLC curve
### Aliases: fitcond fitplc fitplcs fitconds

### ** Examples


# We use the built-in example dataset 'stemvul' in the examples below. See ?stemvul.
# Most examples will fit the Weibull model (the default); try running some of the examples
# with 'model="sigmoidal"' and compare the results.
  
# 1. Fit one species (or fit all, see next example)
dfr1 <- subset(stemvul, Species =="dpap")

# Fit Weibull model. Store results in object 'pfit'
# 'varnames' specifies the names of the 'PLC' variable in the dataframe,
# and water potential (WP). 
# In this example, we use only 50 bootstrap replicates but recommend you set this
# to 1000 or so.
pfit <- fitplc(dfr1, varnames=c(PLC="PLC", WP="MPa"), nboot=50)

# Look at fit
pfit

# Make a standard plot. The default plot is 'relative conductivity',
# (which is 1.0 where PLC = 0). For plotting options, see ?plot.plcfit
plot(pfit)

# Or plot the percent embolism
plot(pfit, what="embol")

# Get the coefficients of the fit.
coef(pfit)

# Repeat for the sigmoidal model
# Note that varnames specification above is the same as the default, so it 
# can be omitted.
pfit2 <- fitplc(dfr1, model="sigmoid")
plot(pfit2)
coef(pfit2)

# 2. Fit all species in the dataset.
# Here we also set the starting values (which is sometimes needed).
# In this example, we use only 50 bootstrap replicates but recommend you set this
# to 1000 or so. 
allfit <- fitplcs(stemvul, "Species", varnames=c(PLC="PLC", WP="MPa"), nboot=50)

# 3. Plot the fits.
plot(allfit, onepanel=TRUE, plotci=FALSE, px_ci="none", pxlinecol="dimgrey")

# Coefficients show the estimates and 95% CI (given by 'lower' and 'upper')
# Based on the CI's, species differences can be decided.
coef(allfit)

# 3. Specify Weights. The default variable name is Weights, if present in the dataset
# it will be used for weighted non-linear regression
# In this example, we use only 50 bootstrap replicates but recommend you set this
# to 1000 or so. 
dfr1$Weights <- abs(50-dfr1$PLC)^1.2
pfit <- fitplc(dfr1, varnames=c(PLC="PLC", WP="MPa"), weights=Weights, nboot=50)
coef(pfit)

# 4. Fit the Weibull curve directly to the raw conductance data. 
# Use this option when you don't want to transform your data to PLC. 
# You have two options: specify the 'maximum' conductance yourself (and provide Kmax), 
# or set the threshold water potential (Kmax_WP), which is then used to calculate Kmax
# (from the average of the conductance values where WP > Kmax_WP).

# Option 1 : maximum conductivity (i.e. at full hydration) is known, and used as input.
kfit1 <- fitcond(dfr1, varnames=c(K="Cond", WP="MPa"), Kmax=7.2, nboot=50)

# Option 2 : calculate maximum cond. from data where water potential : -0.3 MPa.
# In this example, we use only 50 bootstrap replicates but recommend you set this
# to 1000 or so. 
kfit2 <- fitcond(dfr1, varnames=c(K="Cond", WP="MPa"), WP_Kmax = -0.3, nboot=50)
# Use plot(kfit1) as for fitplc, as well as coef() etc.

# Fit multiple conductivity curves at once (bootstrap omitted for speed).
kfits3 <- fitconds(stemvul, "Species", varnames=list(K="Cond", WP="MPa"), WP_Kmax=-0.3, boot=FALSE)
plot(kfits3, onepanel=TRUE, ylim=c(0,12), px_ci="none")

# 5. Random effects.
# This example takes into account the fact that the individual data points for a species are not 
# independent, but rather clustered by branch. 
fitr <- fitplc(dfr1, random=Branch)

# Visualize the random effects.
plot(fitr, plotrandom=TRUE)



