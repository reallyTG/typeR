library(episensr)


### Name: misclassification
### Title: Sensitivity analysis for disease or exposure misclassification.
### Aliases: misclassification

### ** Examples

# The data for this example come from:
# Fink, A.K., Lash,  T.L. A null association between smoking during pregnancy
# and breast cancer using Massachusetts registry data (United States).
# Cancer Causes Control 2003;14:497-503.
misclassification(matrix(c(215, 1449, 668, 4296),
dimnames = list(c("Breast cancer+", "Breast cancer-"),
c("Smoker+", "Smoker-")),
nrow = 2, byrow = TRUE),
type = "exposure",
bias_parms = c(.78, .78, .99, .99))
misclassification(matrix(c(4558, 3428, 46305, 46085),
dimnames = list(c("AMI death+", "AMI death-"),
c("Male+", "Male-")),
nrow = 2, byrow = TRUE),
type = "outcome",
bias_parms = c(.53, .53, .99, .99))
# The following example comes from Chu et al. Sensitivity analysis of
# misclassification: A graphical and a Bayesian approach.
# Annals of Epidemiology 2006;16:834-841.
misclassification(matrix(c(126, 92, 71, 224),
dimnames = list(c("Case", "Control"), c("Smoker +", "Smoker -")),
nrow = 2, byrow = TRUE),
type = "exposure",
bias_parms = c(.94, .94, .97, .97))



