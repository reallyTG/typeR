library(semPlot)


### Name: semPaths
### Title: Plot path diagram for SEM models.
### Aliases: semPaths

### ** Examples
 # Regression analysis with interaction effects ----------------------------

# A silly dataset:
X <- rnorm(100)
Y <- rnorm(100)
Z <- rnorm(1)*X + rnorm(1)*Y + rnorm(1)*X*Y
DF <- data.frame(X,Y,Z)

# Regression including interaction:
res <- lm(Z ~ X*Y, data = DF)

# Path diagram:
semPaths(res, intAtSide=TRUE)

# Standardized estimates:
semPaths(res,"std","hide", intAtSide=TRUE)

# Simple CFA -------------------------------------------
library("lavaan")
example(cfa)

semPaths(fit, 'std', 'est', curveAdjacent = TRUE, style = "lisrel")


# MIMIC model ----------------------------------------------------
## Lavaan
## Not run: 
##D library("lavaan")
##D 
##D # Example 5.8 from mplus user guide:
##D Data <- read.table("http://www.statmodel.com/usersguide/chap5/ex5.8.dat")
##D names(Data) <- c(paste("y", 1:6, sep=""),
##D                  paste("x", 1:3, sep=""))
##D 
##D # Model:
##D model.Lavaan <- 'f1 =~ y1 + y2 + y3
##D f2 =~ y4 + y5 + y6
##D f1 + f2 ~ x1 + x2 + x3 '
##D 
##D # Run Lavaan:
##D library("lavaan")
##D fit <- lavaan:::cfa(model.Lavaan, data=Data, std.lv=TRUE)
##D 
##D # Plot path diagram:
##D semPaths(fit,title=FALSE)
##D 
##D # Omit exogenous covariances:
##D semPaths(fit,title=FALSE, exoVar = FALSE, exoCov = FALSE)
##D 
##D # Standardized parameters:
##D semPaths(fit,"std", edge.label.cex = 0.5, exoVar = FALSE, 
##D   exoCov = FALSE)
##D 
##D ## Mplus
##D 
##D # Same model, now using mplus output:
##D outfile <- tempfile(fileext=".out")
##D download.file("http://www.statmodel.com/usersguide/chap5/ex5.8.out",outfile)
##D 
##D # Plot model:
##D semPaths(outfile,intercepts=FALSE)
##D # Note that mplus did not report the fixed variances of the exogenous variables.
##D 
##D 
##D 
##D 
##D # Thresholds  -----------------------------------------------------
##D ## Lavaan
##D 
##D # Example 5.8 from mplus user guide:
##D Data <- read.table("http://www.statmodel.com/usersguide/chap5/ex5.2.dat")
##D names(Data) <- c("u1","u2","u3","u4","u5","u6")
##D Data <- as.data.frame(lapply(Data, ordered))
##D 
##D # Lavaan model:
##D model <- ' f1 =~ u1 + u2 + u3; f2 =~ u4 + u5 + u6 '
##D 
##D # Run Lavaan:
##D fit <- lavaan::cfa(model, data=Data)
##D 
##D # Plot path diagram:
##D semPaths(fit,intercepts=FALSE)
##D 
##D ## Mplus
##D 
##D # Same model, now using mplus output:
##D outfile <- tempfile(fileext=".out")
##D download.file("http://www.statmodel.com/usersguide/chap5/ex5.2.out",outfile)
##D 
##D # Plot model:
##D semPaths(outfile)
##D 
##D 
##D 
##D 
##D # OpenMx ----------------------------------------------------------
##D # To install OpenMx see:
##D # http://openmx.psyc.virginia.edu/
##D 
##D library("OpenMx")
##D 
##D # Example from mxRun help page:
##D # Create and run the 1-factor CFA on the openmx.psyc.virginia.edu front page
##D data(demoOneFactor)  # load the demoOneFactor dataframe
##D manifests <- names(demoOneFactor) # set the manifest to the 5 demo variables
##D latents   <- c("G")  # define 1 latent variable
##D model <- mxModel("One Factor", type="RAM",
##D   manifestVars = manifests,
##D 	latentVars   = latents,
##D 	mxPath(from=latents  , to=manifests),
##D 	mxPath(from=manifests, arrows=2),
##D 	mxPath(from=latents  , arrows=2, free=FALSE, values=1.0),
##D 	mxData(cov(demoOneFactor), type="cov", numObs=500)
##D )
##D model <- mxRun(model) #run model, returning the result
##D 
##D # Plot with colors from OpenMx front page:
##D semPaths(model, color = list(
##D               lat = rgb(245, 253, 118, maxColorValue = 255), 
##D               man = rgb(155, 253, 175, maxColorValue = 255)),
##D           mar = c(10, 5, 10, 5))
##D 
##D ## Factor Analysis:
##D source("http://openmx.ssri.psu.edu/docs/OpenMx/latest/_static/demo/TwoFactorModel_PathCov.R")
##D semPaths(twoFactorFit, layout = "tree2")
##D 
##D # Multi-group analysis -------------------------------------------
##D ## LISREL:
##D # Download measurment invariance example:
##D modFile <- tempfile(fileext=".OUT")
##D download.file("http://sachaepskamp.com/files/mi1.OUT",modFile)
##D layout(t(1:2))
##D semPaths(modFile,"eq",ask=FALSE, intAtSide = TRUE, mar = c(8, 1, 5, 1))
##D # Color indicates equality constraints.
## End(Not run)



