library(geesmv)


### Name: GEE.var.wl
### Title: A Modified GEE Variance Estimator Proposed by Wang and Long
###   (2011).
### Aliases: GEE.var.wl
### Keywords: efficiency Gee

### ** Examples

data(dental)
data_alt <- reshape(dental, direction="long", timevar="Time", 
                   varying=names(dental)[3:6], v.names="response", times=c(8,10,12,14))
data_alt <- data_alt[order(data_alt$subject),]
data_alt$gender <- as.numeric(data_alt$gender)
data_alt$Time <- sqrt(data_alt$Time)
formula <- response~Time+gender
wl.ind <- GEE.var.wl(formula,id="subject",family=gaussian,
       data_alt,corstr="independence") ##Independence correlation structure;            
wl.exch <- GEE.var.wl(formula,id="subject",family=gaussian,
       data_alt,corstr="exchangeable") ##Exchangeable correlation structure;               
wl.ar1 <- GEE.var.wl(formula,id="subject",family=gaussian,
       data_alt,corstr="AR-M") ##AR-1 correlation structure;            
wl.unstr <- GEE.var.wl(formula,id="subject",family=gaussian,
         data_alt,corstr="unstructured") ##Unstructured correlation structure;
             



