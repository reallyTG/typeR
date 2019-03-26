library(memisc)


### Name: Sapply
### Title: A Dimension Preserving Variant of "sapply" and "lapply"
### Aliases: Lapply Sapply
### Keywords: utilities misc

### ** Examples

berkeley <- Aggregate(Table(Admit,Freq)~.,data=UCBAdmissions)
berktest1 <- By(~Dept+Gender,
                glm(cbind(Admitted,Rejected)~1,family="binomial"),
                data=berkeley)
berktest2 <- By(~Dept,
                glm(cbind(Admitted,Rejected)~Gender,family="binomial"),
                data=berkeley)

sapply(berktest1,coef)
Sapply(berktest1,coef)

sapply(berktest1,function(x)drop(coef(summary(x))))
Sapply(berktest1,function(x)drop(coef(summary(x))))

sapply(berktest2,coef)
Sapply(berktest2,coef)
sapply(berktest2,function(x)coef(summary(x)))
Sapply(berktest2,function(x)coef(summary(x)))



