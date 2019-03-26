library(EMSaov)


### Name: PooledANOVA
### Title: Pooling nonsignificant interactions to Residuals
### Aliases: PooledANOVA

### ** Examples

data(film)
anova.result<-EMSanova(thickness~Gate*Operator*Day,data=film,
                        type=c("F","R","R"))
anova.result 
del.ID<-c("Gate:Day","Residuals")
PooledANOVA(anova.result,del.ID)



