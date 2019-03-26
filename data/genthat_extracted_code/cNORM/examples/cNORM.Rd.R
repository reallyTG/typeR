library(cNORM)


### Name: cNORM
### Title: cNORM: Continuous Norming
### Aliases: cNORM cNORM-package
### Keywords: Based Biometrics, Development, Norming Psychometrics,
###   Regression Test

### ** Examples

# Model internal 'elfe' dataset with the default k = 4 regression on T scores
data.elfe <- prepareData(elfe)
model.elfe <- bestModel(data.elfe)
plotPercentiles(data.elfe, model.elfe)

# Show model fit of models with progressing number of predictors
printSubset(model.elfe)
plotSubset(model.elfe)

# Plot manifest and predicted values, plot series of percentile charts
plotRaw(data.elfe, model.elfe)
## Not run: 
##D plotPercentileSeries(data.elfe, model.elfe)
## End(Not run)

# Additional tests: Check model assumptions
checkConsistency(model.elfe)
plotDerivative(model.elfe)

# Generate norm tables; predict values, here: grade 3.75 from T score 25
# to 75 and within the raw value range of this specific test (0 to 28)
normTable <- normTable(3.75, model.elfe, minNorm=25, maxNorm=75, step=0.5)
rawTable <- rawTable(3.75, model.elfe, minRaw = 0, maxRaw = 28, minNorm=25,
                     maxNorm=75)

# Predict a specific norm score
score <- predictNorm(raw = 21, A = 3.75,
                          model = model.elfe, minNorm=25, maxNorm=75)

# Semi-parametric modeling with Box Cox power transformation for grade 3.75
bcParameters <- boxcox(model.elfe, 3.75)
# Print L, M and S
bcParameters$lambdaBC
bcParameters$meanBC
bcParameters$sdBC
# Plot density function of box cox versus regression model
plotBoxCox(model.elfe, bcParameters, type=2)



