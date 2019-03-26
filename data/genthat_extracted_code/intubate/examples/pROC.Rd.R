library(intubate)


### Name: pROC
### Title: Interfaces for pROC package for data science pipelines.
### Aliases: ntbt_auc ntbt_ci ntbt_ci.auc ntbt_ci.coords ntbt_ci.se
###   ntbt_ci.sp ntbt_ci.thresholds ntbt_multiclass.roc ntbt_plot.roc
###   ntbt_roc
### Keywords: intubate magrittr pROC auc ci ci.auc ci.coords ci.se ci.sp
###   ci.thresholds multiclass.roc plot.roc roc

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(pROC)
##D 
##D ## NOTE: pROC examples below use both formula and non-formula variants.
##D ##       In examples for other packages, almost always only
##D ##       the formula variant is shown, but in those cases also
##D ##       the non-formula variants should work.
##D 
##D ## ntbt_auc: Compute the area under the ROC curve
##D data(aSAH)
##D 
##D ## Original function to interface
##D auc(outcome ~ s100b, data = aSAH)
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D auc(outcome, s100b)
##D detach()
##D ## or use $
##D auc(aSAH$outcome, aSAH$s100b)
##D 
##D ## The interface puts data as first parameter
##D ## NOTE: in this case the formula version fails, and I have found no
##D ##       way to trick auc into accepting the formula (so far).
##D ##       Maybe (only maybe) there is a problem with auc, as formula
##D ##       variant may not be used, so it was probably not
##D ##       reported as a bug before. The rest of the interfaced
##D ##       functions seem to work fine.
##D ## ntbt_auc(data = aSAH, outcome ~ s100baSAH)
##D ## The non-formula variant works fine
##D ntbt_auc(aSAH, outcome, s100b)
##D 
##D ## so it can be used easily in a pipeline.
##D #aSAH %>%
##D #  ntbt_auc(outcome ~ s100baSAH)
##D aSAH %>%
##D   ntbt_auc(outcome, s100b)
##D 
##D 
##D ## ntbt_ci: Compute the confidence interval of a ROC curve
##D ## Original function to interface
##D ci(outcome ~ s100b, data = aSAH)
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D ci(outcome, s100b)
##D detach()
##D ## or use $
##D ci(aSAH$outcome, aSAH$s100b)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ci(aSAH, outcome ~ s100b)
##D ntbt_ci(aSAH, outcome, s100b)
##D 
##D ## so it can be used easily in a pipeline.
##D aSAH %>%
##D   ntbt_ci(outcome ~ s100b)
##D aSAH %>%
##D   ntbt_ci(outcome, s100b)
##D 
##D 
##D ## ci.auc: Compute the confidence interval of the AUC
##D ## Original function to interface
##D ci.auc(outcome ~ s100b, data = aSAH)
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D ci.auc(outcome, s100b)
##D detach()
##D ## or use $
##D ci.auc(aSAH$outcome, aSAH$s100b)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ci.auc(aSAH, outcome ~ s100b)
##D ntbt_ci.auc(aSAH, outcome, s100b)
##D 
##D ## so it can be used easily in a pipeline.
##D aSAH %>%
##D   ntbt_ci.auc(outcome ~ s100b)
##D aSAH %>%
##D   ntbt_ci.auc(outcome, s100b)
##D 
##D 
##D ## ntbt_ci.coords: Compute the confidence interval of arbitrary coordinates
##D ## Original function to interface
##D set.seed(1)
##D ci.coords(outcome ~ s100b, data = aSAH, x="best", input = "threshold", 
##D           ret=c("specificity", "ppv", "tp"))
##D set.seed(1)
##D ci.coords(aSAH$outcome, aSAH$s100b, x="best", input = "threshold", 
##D           ret=c("specificity", "ppv", "tp"))
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D set.seed(1)
##D ci.coords(outcome, s100b, x="best", input = "threshold", 
##D           ret=c("specificity", "ppv", "tp"))
##D detach()
##D ## or use $
##D set.seed(1)
##D ci.coords(aSAH$outcome, aSAH$s100b, x="best", input = "threshold", 
##D           ret=c("specificity", "ppv", "tp"))
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_ci.coords(aSAH, outcome ~ s100b, x="best", input = "threshold", 
##D                ret=c("specificity", "ppv", "tp"))
##D set.seed(1)
##D ntbt_ci.coords(aSAH, outcome, s100b, x="best", input = "threshold", 
##D                ret=c("specificity", "ppv", "tp"))
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D aSAH %>%
##D   ntbt_ci.coords(outcome ~ s100b, x="best", input = "threshold", 
##D                  ret=c("specificity", "ppv", "tp"))
##D set.seed(1)
##D aSAH %>%
##D   ntbt_ci.coords(outcome, s100b, x="best", input = "threshold", 
##D                  ret=c("specificity", "ppv", "tp"))
##D 
##D 
##D ## ntbt_ci.se: Compute the confidence interval of sensitivities at given specificities
##D ## Original function to interface
##D set.seed(1)
##D ci.se(outcome ~ s100b, data = aSAH)
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D set.seed(1)
##D ci.se(outcome, s100b)
##D detach()
##D ## or use $
##D set.seed(1)
##D ci.se(aSAH$outcome, aSAH$s100b)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_ci.se(aSAH, outcome ~ s100b)
##D set.seed(1)
##D ntbt_ci.se(aSAH, outcome, s100b)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D aSAH %>%
##D   ntbt_ci.se(outcome ~ s100b)
##D set.seed(1)
##D aSAH %>%
##D   ntbt_ci.se(outcome, s100b)
##D 
##D 
##D ## ntbt_ci.sp: Compute the confidence interval of specificities at given sensitivities
##D ## Original function to interface
##D set.seed(1)
##D ci.sp(outcome ~ s100b, data = aSAH)
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D set.seed(1)
##D ci.sp(outcome, s100b)
##D detach()
##D ## or use $
##D set.seed(1)
##D ci.sp(aSAH$outcome, aSAH$s100b)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_ci.sp(aSAH, outcome ~ s100b)
##D set.seed(1)
##D ntbt_ci.sp(aSAH, outcome, s100b)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D aSAH %>%
##D   ntbt_ci.sp(outcome ~ s100b, x="best", input = "threshold", 
##D              ret=c("specificity", "ppv", "tp"))
##D set.seed(1)
##D aSAH %>%
##D   ntbt_ci.sp(outcome, s100b, x="best", input = "threshold", 
##D              ret=c("specificity", "ppv", "tp"))
##D 
##D 
##D ## ntbt_ci.thresholds: Compute the confidence interval of thresholds
##D ## Original function to interface
##D set.seed(1)
##D ci.thresholds(outcome ~ s100b, data = aSAH)
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D set.seed(1)
##D ci.thresholds(outcome, s100b)
##D detach()
##D ## or use $
##D set.seed(1)
##D ci.thresholds(aSAH$outcome, aSAH$s100b)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_ci.thresholds(aSAH, outcome ~ s100b)
##D set.seed(1)
##D ntbt_ci.thresholds(aSAH, outcome, s100b)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D aSAH %>%
##D   ntbt_ci.thresholds(outcome ~ s100b)
##D set.seed(1)
##D aSAH %>%
##D   ntbt_ci.thresholds(outcome, s100b)
##D 
##D 
##D ## ntbt_multiclass.roc: Multi-clmulticlass.roc Multi-class AUCass AUC
##D ## Original function to interface
##D multiclass.roc(gos6 ~ s100b, data = aSAH, levels = c(3, 4, 5))
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D multiclass.roc(gos6, s100b, levels = c(3, 4, 5))
##D detach()
##D ## or use $
##D multiclass.roc(aSAH$gos6, aSAH$s100b, levels = c(3, 4, 5))
##D 
##D ## The interface puts data as first parameter
##D ntbt_multiclass.roc(aSAH, gos6 ~ s100b, levels = c(3, 4, 5))
##D ntbt_multiclass.roc(aSAH, gos6, s100b, levels = c(3, 4, 5))
##D 
##D ## so it can be used easily in a pipeline.
##D aSAH %>%
##D   ntbt_multiclass.roc(gos6 ~ s100b, levels = c(3, 4, 5))
##D aSAH %>%
##D   ntbt_multiclass.roc(gos6, s100b, levels = c(3, 4, 5))
##D 
##D 
##D ## ntbt_plot.roc: Plot a ROC curve
##D ## Original function to interface
##D plot.roc(outcome ~ s100b, data = aSAH, type="b", pch=21, col="blue", bg="grey")
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D plot.roc(outcome, s100b, type="b", pch=21, col="blue", bg="grey")
##D detach()
##D ## or use $
##D plot.roc(aSAH$outcome, aSAH$s100b, type="b", pch=21, col="blue", bg="grey")
##D 
##D ## The interface puts data as first parameter
##D ntbt_plot.roc(aSAH, outcome ~ s100b, type="b", pch=21, col="blue", bg="grey")
##D ntbt_plot.roc(aSAH, outcome, s100b, type="b", pch=21, col="blue", bg="grey")
##D 
##D ## so it can be used easily in a pipeline.
##D aSAH %>%
##D   ntbt_plot.roc(outcome ~ s100b, type="b", pch=21, col="blue", bg="grey")
##D aSAH %>%
##D   ntbt_plot.roc(outcome, s100b, type="b", pch=21, col="blue", bg="grey")
##D 
##D 
##D ## ntbt_roc: Build a ROC curve
##D ## Original function to interface
##D roc(outcome ~ s100b, data = aSAH, type="b", pch=21, col="blue", bg="grey")
##D ## For non-formula variants, either:
##D ## 1) need to attach
##D attach(aSAH)
##D roc(outcome, s100b, type="b", pch=21, col="blue", bg="grey")
##D detach()
##D ## or use $
##D roc(aSAH$outcome, aSAH$s100b, type="b", pch=21, col="blue", bg="grey")
##D 
##D ## The interface puts data as first parameter
##D ntbt_roc(aSAH, outcome ~ s100b, type="b", pch=21, col="blue", bg="grey")
##D ntbt_roc(aSAH, outcome, s100b, type="b", pch=21, col="blue", bg="grey")
##D 
##D ## so it can be used easily in a pipeline.
##D aSAH %>%
##D   ntbt_roc(outcome ~ s100b, type="b", pch=21, col="blue", bg="grey")
##D aSAH %>%
##D   ntbt_roc(outcome, s100b, type="b", pch=21, col="blue", bg="grey")
## End(Not run)



