library(semTools)


### Name: FitDiff-class
### Title: Class For Representing A Template of Model Fit Comparisons
### Aliases: FitDiff-class show,FitDiff-method summary,FitDiff-method

### ** Examples


HS.model <- ' visual =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed =~ x7 + x8 + x9 '

out <- measurementInvariance(model = HS.model, data = HolzingerSwineford1939,
                             group = "school", quiet = TRUE)
modelDiff <- compareFit(out)
summary(modelDiff)
summary(modelDiff, fit.measures = "all")
summary(modelDiff, fit.measures = c("aic", "bic"))

## Not run: 
##D ## Save results to a file
##D saveFile(modelDiff, file = "modelDiff.txt")
##D 
##D ## Copy to a clipboard
##D clipboard(modelDiff)
## End(Not run)




