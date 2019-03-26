library(memisc)


### Name: to.data.frame
### Title: Convert an Array into a Data Frame
### Aliases: to.data.frame
### Keywords: manip

### ** Examples

berkeley <- Aggregate(Table(Admit,Freq)~.,data=UCBAdmissions)
berktest1 <- By(~Dept+Gender,
                glm(cbind(Admitted,Rejected)~1,family="binomial"),
                data=berkeley)
berktest2 <- By(~Dept,
                glm(cbind(Admitted,Rejected)~Gender,family="binomial"),
                data=berkeley)
Stest1 <- Lapply(berktest2,function(x)predict(x,,se.fit=TRUE)[c("fit","se.fit")])
Stest2 <- Sapply(berktest2,function(x)coef(summary(x)))
Stest2.1 <- Lapply(berktest1,function(x)predict(x,,se.fit=TRUE)[c("fit","se.fit")])
to.data.frame(Stest1)
to.data.frame(Stest2,as.vars=2)
to.data.frame(Stest2.1)



