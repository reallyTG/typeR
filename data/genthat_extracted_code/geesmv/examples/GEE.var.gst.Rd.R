library(geesmv)


### Name: GEE.var.gst
### Title: A modified GEE Variance Estimator Proposed by Gosho et al.(2014)
### Aliases: GEE.var.gst
### Keywords: Gosho GEE

### ** Examples

data(dental)
data_alt <- reshape(dental, direction="long", timevar="Time", 
         varying=names(dental)[3:6], v.names="response", times=c(8,10,12,14))
data_alt <- data_alt[order(data_alt$subject),]
data_alt$gender <- as.numeric(data_alt$gender)
data_alt$Time <- sqrt(data_alt$Time)
formula <- response~Time+gender
gst.ind <- GEE.var.gst(formula,id="subject",family=gaussian,
        data_alt,corstr="independence") ##Independence correlation structure;              
gst.exch <- GEE.var.gst(formula,id="subject",family=gaussian,
        data_alt,corstr="exchangeable") ##Exchangeable correlation structure;     
gst.ar1 <- GEE.var.gst(formula,id="subject",family=gaussian,
        data_alt,corstr="AR-M") ##AR-1 correlation structure;          
gst.unstr <- GEE.var.gst(formula,id="subject",family=gaussian,
         data_alt,corstr="unstructured") ##Unstructured correlation structure;



