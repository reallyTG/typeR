library(geesmv)


### Name: GEE.var.lz
### Title: GEE Sandwich Variance Estimator Proposed by Liang and Zeger
###   (1986).
### Aliases: GEE.var.lz
### Keywords: Liang GEE

### ** Examples

data(dental)
data_alt <- reshape(dental, direction="long", timevar="Time", 
        varying=names(dental)[3:6], v.names="response", times=c(8,10,12,14))
data_alt <- data_alt[order(data_alt$subject),]
data_alt$gender <- as.numeric(data_alt$gender)
data_alt$Time <- sqrt(data_alt$Time)
formula <- response~Time+gender
lz.ind <- GEE.var.lz(formula,id="subject",family=gaussian,
          data_alt,corstr="independence") ##Independence correlation structure;                   
lz.exch <- GEE.var.lz(formula,id="subject",family=gaussian,
         data_alt,corstr="exchangeable") ##Exchangeable correlation structure;                    
lz.ar1 <- GEE.var.lz(formula,id="subject",family=gaussian,
          data_alt,corstr="AR-M") ##AR-1 correlation structure;                     
lz.unstr <- GEE.var.lz(formula,id="subject",family=gaussian,
        data_alt,corstr="unstructured") ##Unstructured correlation structure;



