library(openair)


### Name: TaylorDiagram
### Title: Taylor Diagram for model evaluation with conditioning
### Aliases: TaylorDiagram
### Keywords: methods

### ** Examples

## in the examples below, most effort goes into making some artificial data
## the function itself can be run very simply
## Not run: 
##D ## dummy model data for 2003
##D dat <- selectByDate(mydata, year = 2003)
##D dat <- data.frame(date = mydata$date, obs = mydata$nox, mod = mydata$nox)
##D 
##D ## now make mod worse by adding bias and noise according to the month
##D ## do this for 3 different models
##D dat <- transform(dat, month = as.numeric(format(date, "%m")))
##D mod1 <- transform(dat, mod = mod + 10 * month + 10 * month * rnorm(nrow(dat)),
##D model = "model 1")
##D ## lag the results for mod1 to make the correlation coefficient worse
##D ## without affecting the sd
##D mod1 <- transform(mod1, mod = c(mod[5:length(mod)], mod[(length(mod) - 3) :
##D length(mod)]))
##D 
##D ## model 2
##D mod2 <- transform(dat, mod = mod + 7 * month + 7 * month * rnorm(nrow(dat)),
##D model = "model 2")
##D ## model 3
##D mod3 <- transform(dat, mod = mod + 3 * month + 3 * month * rnorm(nrow(dat)),
##D model = "model 3")
##D 
##D mod.dat <- rbind(mod1, mod2, mod3)
##D 
##D ## basic Taylor plot
##D 
##D TaylorDiagram(mod.dat, obs = "obs", mod = "mod", group = "model")
##D 
##D ## Taylor plot by season
##D TaylorDiagram(mod.dat, obs = "obs", mod = "mod", group = "model", type = "season")
##D 
##D ## now show how to evaluate model improvement (or otherwise)
##D mod1a <- transform(dat, mod = mod + 2 * month + 2 * month * rnorm(nrow(dat)),
##D model = "model 1")
##D mod2a <- transform(mod2, mod = mod * 1.3)
##D mod3a <- transform(dat, mod = mod + 10 * month + 10 * month * rnorm(nrow(dat)),
##D model = "model 3")
##D mod.dat2 <- rbind(mod1a, mod2a, mod3a)
##D mod.dat$mod2 <- mod.dat2$mod
##D 
##D ## now we have a data frame with 3 models, 1 set of observations
##D ## and TWO sets of model predictions (mod and mod2)
##D 
##D ## do for all models
##D TaylorDiagram(mod.dat, obs = "obs", mod = c("mod", "mod2"), group = "model")
## End(Not run)
## Not run: 
##D ## all models, by season
##D TaylorDiagram(mod.dat, obs = "obs", mod = c("mod", "mod2"), group = "model",
##D type = "season")
##D 
##D ## consider two groups (model/month). In this case all months are shown by model
##D ## but are only differentiated by model.
##D 
##D TaylorDiagram(mod.dat, obs = "obs", mod = "mod", group = c("model", "month"))
## End(Not run)





