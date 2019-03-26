library(EMSaov)


### Name: ApproxF
### Title: Calculate ANOVA with approximate F value
### Aliases: ApproxF

### ** Examples

data(film)
anova.result<-EMSanova(thickness~Gate*Operator*Day,data=film,
                        type=c("F","R","R"))
anova.result                         
ApproxF(SS.table=anova.result,approx.name="Gate") 
EMSanova(thickness~Gate+Operator+Day,data=film,
          type=c("F","R","R"),
          approximate=TRUE)                      
       



