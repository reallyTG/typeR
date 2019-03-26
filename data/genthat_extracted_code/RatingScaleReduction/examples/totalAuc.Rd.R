library(RatingScaleReduction)


### Name: totalAuc
### Title: AUC of the running total of attributes
### Aliases: totalAuc

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

#arrange start AUC in an ascending order and compute total AUC according to 
#Rating Scale Reduction procedure

tot <-totalAuc(attribute, decision, plotT=TRUE)
tot$summary



