library(geesmv)


### Name: geesmv-package
### Title: Modified Variance Estimators for Generalized Estimating
###   Equations
### Aliases: geesmv-package geesmv
### Keywords: package

### ** Examples


### Run the data analysis using the package using seizure dataset (Poisson);
data(seizure)
seizure$subject <- 1:length(seizure[,1])
data_alt <- reshape(seizure, direction="long", idvar="subject", timevar="Time", 
                   varying=names(seizure)[1:4], v.names="response", times=1:4) 
data_alt <- data_alt[order(data_alt$subject),]
data_alt <- data_alt[,c(4,1:3,5,6)]

### independence working correlation structure;
formula <- response~base+trt+Time
lz.ind <- GEE.var.lz(formula,id="subject",family=poisson,
               data_alt,corstr="independence")
               
mk.ind <- GEE.var.mk(formula,id="subject",family=poisson,
                data_alt,corstr="independence")
                
pan.ind <- GEE.var.pan(formula,id="subject",family=poisson,
         data_alt,corstr="independence")
         
gst.ind <- GEE.var.gst(formula,id="subject",family=poisson,
        data_alt,corstr="independence")
        
kc.ind <- GEE.var.kc(formula,id="subject",family=poisson,
         data_alt,corstr="independence") 
         
md.ind <- GEE.var.md(formula,id="subject",family=poisson,
        data_alt,corstr="independence")
        
fg.ind <- GEE.var.fg(formula,id="subject",family=poisson,data_alt,
                      corstr="independence",b=0.75) 
mbn.ind <- GEE.var.mbn(formula,id="subject",family=poisson,data_alt,
                      corstr="independence",d=2,r=1)                
wl.ind <- GEE.var.wl(formula,id="subject",family=poisson,
             data_alt,corstr="independence")



