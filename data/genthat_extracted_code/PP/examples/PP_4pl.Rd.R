library(PP)


### Name: PP_4pl
### Title: Estimate Person Parameters for the 4-PL model
### Aliases: PP_4pl
### Keywords: 4pl Parameters, Person

### ** Examples

################# 4 PL #############################################################

### real data ##########

data(pp_amt)

d <- as.matrix(pp_amt$daten_amt[,-(1:7)])

rd_res <- PP_4pl(respm = d, thres = pp_amt$betas[,2], type = "wle")
summary(rd_res)


### fake data ##########
# smaller ... faster

set.seed(1522)
# intercepts
diffpar <- seq(-3,3,length=12)
# slope parameters
sl     <- round(runif(12,0.5,1.5),2)
la     <- round(runif(12,0,0.25),2)
ua     <- round(runif(12,0.8,1),2)

# response matrix
awm <- matrix(sample(0:1,10*12,replace=TRUE),ncol=12)


## 1PL model ##### 

# MLE
res1plmle <- PP_4pl(respm = awm,thres = diffpar,type = "mle")
# WLE
res1plwle <- PP_4pl(respm = awm,thres = diffpar,type = "wle")
# MAP estimation
res1plmap <- PP_4pl(respm = awm,thres = diffpar,type = "map")
# EAP estimation
res1pleap <- PP_4pl(respm = awm,thres = diffpar,type = "eap")
# robust estimation
res1plrob <- PP_4pl(respm = awm,thres = diffpar,type = "robust")

# summarize results
summary(res1plmle)
summary(res1plwle)
summary(res1plmap)


## 2PL model ##### 

# MLE
res2plmle <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "mle")
# WLE
res2plwle <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "wle")
# MAP estimation
res2plmap <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "map")
# EAP estimation
res2pleap <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "eap")
# robust estimation
res2plrob <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "robust")


## 3PL model ##### 

# MLE
res3plmle <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,type = "mle")
# WLE
res3plwle <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,type = "wle")
# MAP estimation
res3plmap <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,type = "map")
# EAP estimation
res3pleap <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la, type = "eap")


## 4PL model ##### 

# MLE
res4plmle <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,upperA=ua,type = "mle")
# WLE
res4plwle <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,upperA=ua,type = "wle")
# MAP estimation
res4plmap <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,upperA=ua,type = "map")
# EAP estimation
res4pleap <- PP_4pl(respm = awm,thres = diffpar,
                    slopes = sl,lowerA = la,upperA=ua,type = "eap")


## A special on robust estimation:
# it reproduces the example given in Schuster & Ke-Hai 2011:

diffpar <- c(-3,-2,-1,0,1,2,3)

AWM <- matrix(0,7,7)
diag(AWM) <- 1

res1plmle <- PP_4pl(respm = AWM,thres = diffpar, type = "mle")

summary(res1plmle)

res1plrob <- PP_4pl(respm = AWM,thres = diffpar, type = "robust")

summary(res1plrob)



