library(FindIt)


### Name: ConditionalEffect
### Title: Estimating the Conditional Effects with the CausalANOVA.
### Aliases: ConditionalEffect

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
## Without Screening and Collapsing
## ####################################### 
#################### AMEs and two-way AMIEs ####################
fit2 <- CausalANOVA(formula=won ~ newRecordF + promise + coeth_voting + relevantdegree,
                    int2.formula = ~ newRecordF:coeth_voting,
                    data=Carlson, pair.id=Carlson$contestresp,diff=TRUE,
                    cluster=Carlson$respcodeS, nway=2)
summary(fit2)
plot(fit2, type="ConditionalEffect", fac.name=c("newRecordF","coeth_voting"))
ConditionalEffect(fit2, treat.fac="newRecordF", cond.fac="coeth_voting")



