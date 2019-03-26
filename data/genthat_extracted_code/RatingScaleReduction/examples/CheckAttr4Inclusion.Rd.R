library(RatingScaleReduction)


### Name: CheckAttr4Inclusion
### Title: Check the next attribute for possible inclusion into AUC
### Aliases: CheckAttr4Inclusion

### ** Examples

#creating the matrix of attributes and the decision vector
#must be as.numeric()
data(aSAH)
attach(aSAH)
is.numeric(aSAH)

attribute <-data.frame(as.numeric(gender), 
as.numeric(age), as.numeric(wfns), as.numeric(s100b), as.numeric(ndka))
colnames(attribute) <-c("a1", "a2", "a3", "a4", "a5")
decision <-as.numeric(outcome)

#deLong test, two-side alternative hiphotesis
CheckAttr4Inclusion(attribute, decision, method=c("delong"), 
alternative=c("two.side"))

#bootstrap, two-side alternative hiphotesis
#CheckAttr4Inclusion(attribute, decision, method=c("bootstrap"), boot.n=500)
#


