## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
concordance=TRUE
)

## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(concordance=TRUE)
options(knitr.table.format = "latex")

## ----echo=FALSE, message=FALSE-------------------------------------------
opts_chunk$set(cache = TRUE, dev = "pdf")

## ----message=F, echo=TRUE------------------------------------------------
# load MVN package
library(MVN)

## ----message=F, eval=FALSE, echo=TRUE------------------------------------
#  # load Iris data
#  data(iris)

## ----message=FALSE, echo=TRUE--------------------------------------------
# setosa subset of the Iris data
setosa <- iris[1:50, 1:4]

## ----message=FALSE, echo=TRUE, warning=FALSE, eval=FALSE-----------------
#  mvn(data, subset = NULL, mvnTest = c("mardia", "hz", "royston", "dh",
#    "energy"), covariance = TRUE, tol = 1e-25, alpha = 0.5,
#    scale = FALSE, desc = TRUE, transform = "none", R = 1000,
#    univariateTest = c("SW", "CVM", "Lillie", "SF", "AD"),
#    univariatePlot = "none", multivariatePlot = "none",
#    multivariateOutlierMethod = "none", showOutliers = FALSE,
#    showNewData = FALSE)
#  

## ----message=FALSE, echo=FALSE, warning=FALSE, eval=TRUE-----------------
  text_tbl <- data.frame(
  Arguments = c("data", "subset", "mvnTest", "covariance", "tol", "alpha", "scale", "desc", "transform", "R", "univariateTest", "univariatePlot", "multivariatePlot", "multivariateOutlierMethod", "showOutliers", "showNewData"),
  Definition = c( "a numeric matrix or data frame", "define a variable name if subset analysis is required", "select one of the MVN tests. Type 'mardia' for Mardia's test, 'hz' for Henze-Zirkler's test, 'royston' for Royston's test, 'dh' for Doornik-Hansen's test and energy for E-statistic. See details for further information.", "this option works for 'mardia' and 'royston'. If TRUE covariance matrix is normalized by n, if FALSE it is normalized by n-1", "a numeric tolerance value which isused for inversion of the covariance matrix (default = 1e-25)", "a numeric parameter controlling the size of the subsets over which the determinant is minimized. Allowed values for the alpha are between 0.5 and 1 and the default is 0.5.", "if TRUE scales the colums of data", "a logical argument. If TRUE calculates descriptive statistics", "select a transformation method to transform univariate marginal via logarithm ('log'), square root ('sqrt') and square ('square')", "number of bootstrap replicates for Energy test, default is 1000", "select one of the univariate normality tests, Shapiro-Wilk ('SW'), Cramer-von Mises ('CVM'), Lilliefors ('Lillie'), Shapiro-Francia ('SF'), Anderson-Darling ('AD')", "select one of the univariate normality plots, Q-Q plot ('qq'), histogram ('histogram'), box plot ('box'), scatter ('scatter')", "'qq' for chi-square Q-Q plot, 'persp' for perspective plot, 'contour' for contour plot", "select multivariate outlier detection method, 'quan' quantile method based on Mahalanobis distance and 'adj' adjusted quantile method based on Mahalanobis distance", "if TRUE prints multivariate outliers", "if TRUE prints new data without outliers"
  )
  )


## ----message=FALSE, echo=FALSE, warning=FALSE, eval=TRUE-----------------
library(magrittr)
library(kableExtra)
    kable(text_tbl, format = "latex", booktabs = T) %>%
    kable_styling(full_width = F) %>%
    column_spec(1, bold = T, color = "black") %>%
    column_spec(2, width = "30em") %>%
        kable_styling(latex_options = "striped")

## ----"Mardia test", message=FALSE, echo=TRUE-----------------------------
result <- mvn(data = setosa, mvnTest = "mardia")
result$multivariateNormality

## ----message=FALSE, echo=FALSE-------------------------------------------
tmp <- mvn(data = setosa, mvnTest = "mardia")

## ----"Henze-Zirkler test", message=FALSE, echo=TRUE----------------------
result <- mvn(data = setosa, mvnTest = "hz")
result$multivariateNormality

## ----"Royston test", message=FALSE, echo=TRUE----------------------------
result <- mvn(data = setosa, mvnTest = "royston")
result$multivariateNormality

## ----"Doornik-Hansen test", message=FALSE, echo=TRUE---------------------
result <- mvn(data = setosa, mvnTest = "dh")
result$multivariateNormality

## ----"Energy test", message=FALSE, echo=TRUE-----------------------------
result <- mvn(data = setosa, mvnTest = "energy")
result$multivariateNormality

## ----echo=FALSE, message=FALSE, fig.width=5, fig.height=5----------------
par(mar=c(4.2,4.1,3,0.2))
result <- mvn(data = setosa, mvnTest = "royston", multivariatePlot = "qq")

## ----qqUniPlot, eval=FALSE, message=FALSE, echo=TRUE---------------------
#  # create univariate Q-Q plots
#  result <- mvn(data = setosa, mvnTest = "royston", univariatePlot = "qqplot")
#  
#  # create univariate histograms
#  result <- mvn(data = setosa, mvnTest = "royston", univariatePlot = "histogram")

## ----include=TRUE, echo=FALSE--------------------------------------------
par(cex.main=1)
result <- mvn(data = setosa, mvnTest = "royston", univariatePlot = "qqplot")

## ----include=TRUE, echo=FALSE--------------------------------------------
par(cex.main=1)
result <- mvn(data = setosa, mvnTest = "royston", univariatePlot = "histogram")

## ----eval=FALSE, message=FALSE, echo=TRUE--------------------------------
#  result <- mvn(data = setosa, mvnTest = "royston", univariateTest = "SW", desc = TRUE)
#  result$univariateNormalityResult

## ----SWUnivariate, eval=TRUE, message=FALSE, echo=FALSE------------------
result$Descriptives

## ----message=FALSE, echo=FALSE, fig.keep='none'--------------------------
setosa3 <- iris[1:50, 1:3]
mard <- mvn(setosa3, mvnTest = "mardia")
hz <- mvn(setosa3, mvnTest = "hz")
roys <- mvn(setosa3, mvnTest = "royston")
dh <- mvn(setosa3, mvnTest = "dh")
en <- mvn(setosa3, mvnTest = "en")

## ----eval=FALSE, fig.keep='none', message=FALSE, echo=TRUE---------------
#  setosa2 <- iris[1:50, 1:2]
#  
#  # perspective plot
#  result <- mvn(setosa2, mvnTest = "hz", multivariatePlot = "persp")
#  
#  # contour plot
#  result <- mvn(setosa2, mvnTest = "hz", multivariatePlot = "contour")

## ----message=FALSE, echo=FALSE, fig.width=5, fig.height=5----------------
setosa2 <- iris[1:50, 1:2]
result <- mvn(setosa2, mvnTest = "hz")
par <- par(mar=c(0.4,0.4,0.4,0.4))
result <- mvn(setosa2, mvnTest = "hz", multivariatePlot = "persp")

## ----echo=FALSE, message=FALSE, fig.width=5, fig.height=5----------------
setosa2 <- iris[1:50, 1:2]
result <- mvn(setosa2, mvnTest = "hz", multivariatePlot = "contour")

## ----message=FALSE, echo=FALSE, fig.keep='none'--------------------------
setosa2 <- iris[1:50, 1:2]
mard <- mvn(setosa2, mvnTest = "mardia")
hz <- mvn(setosa2, mvnTest = "hz")
roys <- mvn(setosa2, mvnTest = "royston")
dh <- mvn(setosa2, mvnTest = "dh")
en <- mvn(setosa2, mvnTest = "en")

## ----mvoutlier, eval=FALSE, echo=TRUE------------------------------------
#  versicolor <- iris[51:100, 1:3]
#  # Mahalanobis distance
#  result <- mvn(data = versicolor, mvnTest = "hz", multivariateOutlierMethod = "quan")
#  # Adjusted Mahalanobis distance
#  result <- mvn(data = versicolor, mvnTest = "hz", multivariateOutlierMethod = "adj")

## ----echo=FALSE, message=FALSE, fig.width=5, fig.height=5----------------
  versicolor <- iris[51:100, 1:3]
  result <- mvn(data = versicolor, mvnTest = "hz", multivariateOutlierMethod = "quan")

## ----echo=FALSE, message=FALSE, fig.width=5, fig.height=5----------------
  versicolor <- iris[51:100, 1:3]
  result <- mvn(data = versicolor, mvnTest = "hz", multivariateOutlierMethod = "adj")

## ----echo=TRUE, message=FALSE--------------------------------------------
head(iris)

## ----echo=TRUE, message=FALSE--------------------------------------------
result <- mvn(data = iris, subset = "Species", mvnTest = "hz")
result$multivariateNormality

