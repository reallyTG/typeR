library(geesmv)


### Name: GEE.var.md
### Title: A Modified GEE Variance Estimator Proposed by Mancl and DeRouen
###   (2001).
### Aliases: GEE.var.md
### Keywords: Mancl GEE

### ** Examples

data(dental)
data_alt <- reshape(dental, direction="long", timevar="Time", 
            varying=names(dental)[3:6], v.names="response", times=c(8,10,12,14))
data_alt <- data_alt[order(data_alt$subject),]
data_alt$gender <- as.numeric(data_alt$gender)
data_alt$Time <- sqrt(data_alt$Time)
formula <- response~Time+gender
md.ind <- GEE.var.md(formula,id="subject",family=gaussian,
          data_alt,corstr="independence") ##Independence correlation structure;                    
md.exch <- GEE.var.md(formula,id="subject",family=gaussian,
         data_alt,corstr="exchangeable") ##Exchangeable correlation structure;                 
md.ar1 <- GEE.var.md(formula,id="subject",family=gaussian,
          data_alt,corstr="AR-M") ##AR-1 correlation structure;                     
md.unstr <- GEE.var.md(formula,id="subject",family=gaussian,
         data_alt,corstr="unstructured") ##Unstructured correlation structure;



