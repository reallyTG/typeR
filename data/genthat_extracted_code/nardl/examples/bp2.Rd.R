library(nardl)


### Name: bp2
### Title: LM test for serial correlation
### Aliases: bp2

### ** Examples


reg<-nardl(food~inf,fod,ic="aic",maxlags = TRUE,graph = TRUE,case=3)
lm2<-bp2(reg$fit,reg$np,fill=0,type="F")




