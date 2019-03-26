library(prediction)


### Name: prediction-package
### Title: Extract Predictions from a Model Object
### Aliases: prediction-package prediction prediction.default
###   prediction.Arima prediction.Gam prediction.ar prediction.arima0
###   prediction.betareg prediction.bigLm prediction.biglm prediction.bruto
###   prediction.clm prediction.coxph prediction.crch prediction.earth
###   prediction.fda prediction.gausspr prediction.gee prediction.glimML
###   prediction.glimQL prediction.glm prediction.glmnet prediction.glmx
###   prediction.gls prediction.hetglm prediction.hurdle prediction.hxlr
###   prediction.ivreg prediction.knnreg prediction.kqr prediction.ksvm
###   prediction.lm prediction.lme prediction.loess prediction.lqs
###   prediction.mars prediction.mca prediction.mclogit prediction.merMod
###   prediction.mnlogit prediction.mnp prediction.multinom prediction.nls
###   prediction.nnet prediction.plm prediction.polr prediction.polyreg
###   prediction.ppr prediction.princomp prediction.rlm prediction.rpart
###   prediction.rq prediction.selection prediction.speedglm
###   prediction.speedlm prediction.survreg prediction.svm
###   prediction.svyglm prediction.train prediction.truncreg
###   prediction.zeroinfl
### Keywords: models

### ** Examples

require("datasets")
x <- lm(Petal.Width ~ Sepal.Length * Sepal.Width * Species, data = iris)
# prediction for every case
prediction(x)

# prediction for first case
prediction(x, iris[1,])

# basic use of 'at' argument
prediction(x, at = list(Species = c("setosa", "virginica")))

# prediction at means/modes of input variables
prediction(x, at = lapply(iris, mean_or_mode))

# prediction with multi-category outcome
## Not run: 
##D   library("mlogit")
##D   data("Fishing", package = "mlogit")
##D   Fish <- mlogit.data(Fishing, varying = c(2:9), shape = "wide", choice = "mode")
##D   mod <- mlogit(mode ~ price + catch, data = Fish)
##D   prediction(mod)
##D   prediction(mod, category = 3)
## End(Not run)




