library(geesmv)


### Name: GEE.var.mk
### Title: A Modified GEE Variance Estimator Proposed by Mackinnon (1985).
### Aliases: GEE.var.mk
### Keywords: GEE Mackinnon

### ** Examples

data(dental)
data_alt <- reshape(dental, direction="long", timevar="Time", 
                   varying=names(dental)[3:6], v.names="response", times=c(8,10,12,14))
data_alt <- data_alt[order(data_alt$subject),]
data_alt$gender <- as.numeric(data_alt$gender)
data_alt$Time <- sqrt(data_alt$Time)
formula <- response~Time+gender
mk.ind <- GEE.var.mk(formula,id="subject",family=gaussian,
      data_alt,corstr="independence") ##Independence correlation structure;            
mk.exch <- GEE.var.mk(formula,id="subject",family=gaussian,
        data_alt,corstr="exchangeable") ##Exchangeable correlation structure;                
mk.ar1 <- GEE.var.mk(formula,id="subject",family=gaussian,
       data_alt,corstr="AR-M") ##AR-1 correlation structure;                         
mk.unstr <- GEE.var.mk(formula,id="subject",family=gaussian,
        data_alt,corstr="unstructured") ##Unstructured correlation structure;



