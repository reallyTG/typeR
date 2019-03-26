library(RCPmod)


### Name: regimix
### Title: Fits a regimix model.
### Aliases: regimix regimix.multifit
### Keywords: misc

### ** Examples

#simulate data
example( simRCPdata)  #generates Negative Binomial data
#fit the model
my.form.RCP <- paste( paste( paste(
  'cbind(', paste( paste( 'spp', 1:S, sep=''), collapse=','), sep=''),
    ')',sep=''),
       '~x1.1+x1.2+x1.3+x2.1+x2.2+x2.3',sep='')
my.form.spp <- ~w.1+w.2+w.3
fm <- regimix( form.RCP = my.form.RCP, form.spp=my.form.spp, data = simDat,
                  dist="NegBin", nRCP = 3, inits = "random2", offset=offset)
## Not run: 
##D #fit the model using multiple starting values
##D fm <- regimix.multifit( form.RCP = my.form.RCP, form.spp=my.form.spp, data = simDat,
##D   dist="NegBin", nRCP = 3, inits = "random2", offset=offset, nstart=10, titbits=FALSE,
##D   mc.cores=1)
##D #sometimes the model 'mis-fits' and one or more of the RCP groups has no sites associated
##D #with it.  These need to be removed (based on the colSums of the posterior probabilities)
##D postProbSums <- t( sapply( fm, function(x) colSums( x$postProbs)))
##D #Identify those models with zero posterior prob classes
##D allGoodUns <- apply( postProbSums, 1, function(x) all(x!=0))
##D #subset the fits
##D fm.clean <- fm[allGoodUns]
##D #choose the model with the lowest BIC
##D goodUn <- which.min( sapply( fm.clean, BIC))
##D #Using the 'best' model, use regimix(qv) again to additional model output needed for other
##D #functions (e.g. plot.regimix(qv), predict.regimix(qv) and regiboot(qv)). Note that the
##D #model is not estimated again (see control argument of the following regimix(qv) call.
##D fm.final <- regimix( form.RCP = my.form.RCP, form.spp=my.form.spp, data = simDat,
##D   dist="NegBin", nRCP = 3, inits = unlist( fm.clean[[goodUn]]$coef),
##D   control=list(optimise=FALSE), offset=offset)
## End(Not run)



