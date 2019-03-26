library(FindIt)


### Name: test.CausalANOVA
### Title: Estimating the AMEs and AMIEs after Regularization with the
###   CausalANOVA.
### Aliases: test.CausalANOVA

### ** Examples

## ####################################### 
## With Screening and Collapsing
## #######################################
data(Carlson)
## Specify the order of each factor
Carlson$newRecordF<- factor(Carlson$newRecordF,ordered=TRUE,
                            levels=c("YesLC", "YesDis","YesMP",
                                     "noLC","noDis","noMP","noBusi"))
Carlson$promise <- factor(Carlson$promise,ordered=TRUE,levels=c("jobs","clinic","education"))
Carlson$coeth_voting <- factor(Carlson$coeth_voting,ordered=FALSE,levels=c("0","1"))
Carlson$relevantdegree <- factor(Carlson$relevantdegree,ordered=FALSE,levels=c("0","1"))

## Sample Splitting
train.ind <- sample(unique(Carlson$respcodeS), 272, replace=FALSE)
test.ind <- setdiff(unique(Carlson$respcodeS), train.ind)
Carlson.train <- Carlson[is.element(Carlson$respcodeS,train.ind), ]
Carlson.test <- Carlson[is.element(Carlson$respcodeS,test.ind), ]
 
#################### AMEs and two-way AMIEs ####################
fit.r2 <- CausalANOVA(formula=won ~ newRecordF + promise + coeth_voting + relevantdegree,
                      data=Carlson.train, pair.id=Carlson.train$contestresp,diff=TRUE,
                      screen=TRUE, collapse=TRUE,
                      cluster=Carlson.train$respcodeS, nway=2)
summary(fit.r2)

## refit with test.CausalANOVA
fit.r2.new <- test.CausalANOVA(fit.r2, newdata=Carlson.test, diff=TRUE,
                               pair.id=Carlson.test$contestresp, cluster=Carlson.test$respcodeS)

summary(fit.r2.new)
plot(fit.r2.new)
plot(fit.r2.new, type="ConditionalEffect", fac.name=c("newRecordF","coeth_voting"))
ConditionalEffect(fit.r2.new, treat.fac="newRecordF", cond.fac="coeth_voting")



