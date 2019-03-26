library(psych)


### Name: iqitems
### Title: 16 multiple choice IQ items
### Aliases: iqitems
### Keywords: datasets

### ** Examples

## Not run: 
##D data(iqitems)
##D iq.keys <- c(4,4,4, 6,  6,3,4,4,   5,2,2,4,   3,2,6,7)
##D score.multiple.choice(iq.keys,iqitems)   #this just gives summary statisics
##D #convert them to true false 
##D iq.scrub <- scrub(iqitems,isvalue=0)  #first get rid of the zero responses
##D iq.tf <-  score.multiple.choice(iq.keys,iq.scrub,score=FALSE) 
##D               #convert to wrong (0) and correct (1) for analysis
##D describe(iq.tf) 
##D #see the ability data set for these analyses
##D #now, for some item analysis
##D #iq.irt <- irt.fa(iq.tf)  #do a basic irt
##D #iq.sc <-score.irt(iq.irt,iq.tf)  #find the scores
##D #op <- par(mfrow=c(4,4))
##D #irt.responses(iq.sc[,1], iq.tf)  
##D #op <- par(mfrow=c(1,1))
## End(Not run)



