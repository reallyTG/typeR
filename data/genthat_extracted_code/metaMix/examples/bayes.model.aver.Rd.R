library(metaMix)


### Name: bayes.model.aver
### Title: Bayesian Model Averaging
### Aliases: bayes.model.aver bayes.model.aver.explicit
### Keywords: bayes.model.aver bayes.model.aver.explicit

### ** Examples

## See vignette for more details

## Not run: 
##D # Either load the object created by previous steps
##D data(step2)   ## example output of step2, i.e reduce.space()
##D data(step3)   ## example ouput of step3, i.e  parallel.temper()
##D step4<-bayes.model.aver(step2=step2, step3=step3, taxon.name.map="pathtoFile/taxon.file")
##D 
##D # or alternatively point to the location of the step2.RData and step3.RData objects
##D step4<-bayes.model.aver(step2="pathtoFile/step2.RData", step3="pathtoFile/step3.RData",
##D                         taxon.name.map="pathtoFile/taxon.file")
##D 
## End(Not run)                                                      



