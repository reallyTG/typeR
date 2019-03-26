library(poLCA)


### Name: poLCA.reorder
### Title: Reorder latent classes in poLCA
### Aliases: poLCA.reorder
### Keywords: methods

### ** Examples

##
## Using the "cheating" sample data set, make the larger
## non-cheater class the first ("reference") class in a 
## latent class regression model.  The coefficient on GPA
## now maintains a consistent interpretation.
##
data(cheating)
f2 <- cbind(LIEEXAM,LIEPAPER,FRAUD,COPYEXAM)~GPA
lc.ch <- poLCA(f2,cheating,nclass=2,verbose=FALSE)
probs.start.new <- poLCA.reorder(lc.ch$probs.start,order(lc.ch$P,decreasing=TRUE))
lc.ch <- poLCA(f2,cheating,nclass=2,probs.start=probs.start.new)



