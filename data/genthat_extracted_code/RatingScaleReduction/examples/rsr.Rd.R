library(RatingScaleReduction)


### Name: rsr
### Title: Rating scale reduction
### Aliases: rsr

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

#rating scale reduction procedure
rsred <-rsr(attribute, decision, plotRSR=TRUE)
rsred



