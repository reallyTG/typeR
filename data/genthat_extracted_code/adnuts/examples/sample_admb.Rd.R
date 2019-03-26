library(adnuts)


### Name: sample_admb
### Title: Bayesian inference of an ADMB model using the no-U-turn sampler.
### Aliases: sample_admb

### ** Examples

## Not run: 
##D ## This is the packaged simple regression model
##D path.simple <- system.file('examples', 'simple', package='adnuts')
##D ## It is best to have your ADMB files in a separate folder and provide that
##D ## path, so make a copy of the model folder locally.
##D path <- 'simple'
##D dir.create(path)
##D trash <- file.copy(from=list.files(path.simple, full.names=TRUE), to=path)
##D ## Compile and run model
##D oldwd <- getwd()
##D setwd(path)
##D system('admb simple.tpl')
##D system('simple')
##D setwd('..')
##D init <- function() rnorm(2)
##D ## Run NUTS with defaults
##D fit <- sample_admb(model='simple', init=init, path=path)
##D unlink(path, TRUE) # cleanup folder
##D setwd(oldwd)
## End(Not run)




