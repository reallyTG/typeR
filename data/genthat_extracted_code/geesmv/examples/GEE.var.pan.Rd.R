library(geesmv)


### Name: GEE.var.pan
### Title: A Modified GEE Variance Estimator Proposed by Pan (2001).
### Aliases: GEE.var.pan
### Keywords: Pan GEE

### ** Examples

data(dental)
data_alt <- reshape(dental, direction="long", timevar="Time", 
         varying=names(dental)[3:6], v.names="response", times=c(8,10,12,14))
data_alt <- data_alt[order(data_alt$subject),]
data_alt$gender <- as.numeric(data_alt$gender)
data_alt$Time <- sqrt(data_alt$Time)
formula <- response~Time+gender
pan.ind <- GEE.var.pan(formula,id="subject",family=gaussian, 
          data_alt,corstr="independence") ##Independence correlation structure;                
pan.exch <- GEE.var.pan(formula,id="subject",family=gaussian,
          data_alt,corstr="exchangeable") ##Exchangeable correlation structure;                 
pan.ar1 <- GEE.var.pan(formula,id="subject",family=gaussian,
          data_alt,corstr="AR-M") ##AR-1 correlation structure;                   
pan.unstr <- GEE.var.pan(formula,id="subject",family=gaussian,
          data_alt,corstr="unstructured") ##Unstructured correlation structure;



