library(geesmv)


### Name: GEE.var.fg
### Title: A Modified GEE Variance Estimator Proposed by Fay and Graubard
###   (2001)
### Aliases: GEE.var.fg
### Keywords: Fay efficient

### ** Examples

data(dental)
data_alt <- reshape(dental, direction="long", timevar="Time", 
          varying=names(dental)[3:6], v.names="response", times=c(8,10,12,14))
data_alt <- data_alt[order(data_alt$subject),]
data_alt$gender <- as.numeric(data_alt$gender)
data_alt$Time <- sqrt(data_alt$Time)
formula <- response~Time+gender
fg.ind <- GEE.var.fg(formula,id="subject",family=gaussian,
       data_alt,corstr="independence") ##Independence correlation structure;
fg.exch <- GEE.var.fg(formula,id="subject",family=gaussian,
        data_alt,corstr="exchangeable") ##Exchangeable correlation structure;
fg.ar1 <- GEE.var.fg(formula,id="subject",family=gaussian,
        data_alt,corstr="AR-M") ##AR-1 correlation structure;
fg.unstr <- GEE.var.fg(formula,id="subject",family=gaussian,
       data_alt,corstr="unstructured") ##Unstructured correlation structure;



