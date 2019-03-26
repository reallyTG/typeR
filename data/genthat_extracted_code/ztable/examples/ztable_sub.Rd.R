library(ztable)


### Name: ztable_sub
### Title: Exporting "data.frame" to an object of class "ztable"
### Aliases: ztable_sub

### ** Examples

require(ztable)
x=head(iris)
ztable(x)
ztable(x,size=3,caption="Table 1. ztable Test")
ztable(x,size=7,caption="Table 1. ztable Test",caption.position="l")
ztable(x,size=7,caption="Table 1. ztable Test",caption.placement="bottom",
      caption.position="l")
fit=lm(mpg~.,data=mtcars)
ztable(fit)
data(USArrests)
pr1 <- prcomp(USArrests)
ztable(pr1)
ztable(summary(pr1))
require(survival)
data(colon)
attach(colon)
out <- glm(status ~ rx+obstruct+adhere+nodes+extent, data=colon, family=binomial)
ztable(out)
colon$TS = Surv(time,status==1)
out1=coxph(TS~rx+obstruct+adhere+differ+extent+surg+node4,data=colon)
ztable(out1)
ztable(head(mtcars),zebra=1)
ztable(head(mtcars),zebra=1,zebra.type=2)



