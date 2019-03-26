library(FindIt)


### Name: cv.CausalANOVA
### Title: Cross validation for the CausalANOVA.
### Aliases: cv.CausalANOVA plot.cv.CausalANOVA

### ** Examples


data(Carlson)
## Specify the order of each factor
Carlson$newRecordF<- factor(Carlson$newRecordF,ordered=TRUE,
                            levels=c("YesLC", "YesDis","YesMP",
                                     "noLC","noDis","noMP","noBusi"))
Carlson$promise <- factor(Carlson$promise,ordered=TRUE,levels=c("jobs","clinic","education"))
Carlson$coeth_voting <- factor(Carlson$coeth_voting,ordered=FALSE,levels=c("0","1"))
Carlson$relevantdegree <- factor(Carlson$relevantdegree,ordered=FALSE,levels=c("0","1"))

## ####################################### 
## Collapsing Without Screening
## ####################################### 
#################### AMEs and two-way AMIEs ####################
## We show a very small example for illustration.
## Recommended to use cv.collapse.cost=c(0.1,0.3,0.5) and nfolds=10 in practice.
fit.cv <- cv.CausalANOVA(formula=won ~ newRecordF + promise + coeth_voting + relevantdegree,
                         int2.formula = ~ newRecordF:coeth_voting,
                         data=Carlson, pair.id=Carlson$contestresp,diff=TRUE,
                         cv.collapse.cost=c(0.1,0.3), nfolds=2,
                         cluster=Carlson$respcodeS, nway=2)
fit.cv




