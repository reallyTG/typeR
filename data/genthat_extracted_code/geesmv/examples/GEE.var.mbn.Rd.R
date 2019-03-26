library(geesmv)


### Name: GEE.var.mbn
### Title: A modified GEE Variance Estimator Proposed by Morel, Bokossa and
###   Neerchal (2003).
### Aliases: GEE.var.mbn
### Keywords: GEE Morel

### ** Examples

data(dental)
data_alt <- reshape(dental, direction="long", timevar="Time", 
         varying=names(dental)[3:6], v.names="response", times=c(8,10,12,14))
data_alt <- data_alt[order(data_alt$subject),]
data_alt$gender <- as.numeric(data_alt$gender)
data_alt$Time <- sqrt(data_alt$Time)
formula <- response~Time+gender
mbn.ind <- GEE.var.mbn(formula,id="subject",family=gaussian,
       data_alt,corstr="independence",d=2,r=1) ##Independence correlation structure;            
mbn.exch <- GEE.var.mbn(formula,id="subject",family=gaussian,
      data_alt,corstr="exchangeable",d=2,r=1) ##Exchangeable correlation structure;             
mbn.ar1 <- GEE.var.mbn(formula,id="subject",family=gaussian,
       data_alt,corstr="AR-M",d=2,r=1) ##AR-1 correlation structure;                   
mbn.unstr <- GEE.var.mbn(formula,id="subject",family=gaussian,
       data_alt,corstr="unstructured",d=2,r=1) ##Unstructured correlation structur;



