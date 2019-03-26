library(memisc)


### Name: By
### Title: Conditional Evaluation of an Expression
### Aliases: By
### Keywords: manip univar

### ** Examples


berkeley <- Aggregate(Table(Admit,Freq)~.,data=UCBAdmissions)
(Bres <- By(~Dept,glm(cbind(Admitted,Rejected)~Gender,family="binomial"),data=berkeley))
# The results all have 'data' components
str(Bres[[1]]$data)

attach(berkeley)
(Bres <- By(~Dept,glm(cbind(Admitted,Rejected)~Gender,family="binomial")))
detach(berkeley)




