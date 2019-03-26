## ----ex1-----------------------------------------------------------------
library(permutes)
head(MMN)
nrow(MMN) #how many observations?
length(unique(MMN$time)) #how many timepoints?

## ----permDry,eval=F------------------------------------------------------
#  perms <- permu.test(cbind(Fp1,AF3,F7,F3,FC1,FC5,C3,CP1,CP5,P7,P3,Pz,PO3,O1,Oz,O2,PO4,
#  	P4,P8,CP6,CP2,C4,FC6,FC2,F4,F8,AF4,Fp2,Fz,Cz) ~ dev | time,data=MMN)
#  ## (output not shown)

## ----perm,eval=F---------------------------------------------------------
#  library(doParallel)
#  cl <- makeCluster(2) #or more
#  registerDoParallel(cl)
#  perms <- permu.test(cbind(Fp1,AF3,F7,F3,FC1,FC5,C3,CP1,CP5,P7,P3,Pz,PO3,O1,Oz,O2,PO4,
#  	P4,P8,CP6,CP2,C4,FC6,FC2,F4,F8,AF4,Fp2,Fz,Cz) ~ dev | time,data=MMN,parallel=TRUE)

## ----interceptForDeterminism,cache=F,results='hide',echo=F---------------
set.seed(10)
perms <- permu.test(cbind(Fp1,AF3,F7,F3,FC1,FC5,C3,CP1,CP5,P7,P3,Pz,PO3,O1,Oz,O2,PO4,
	P4,P8,CP6,CP2,C4,FC6,FC2,F4,F8,AF4,Fp2,Fz,Cz) ~ dev | time,data=MMN)

## ----permplot------------------------------------------------------------
plot(perms)

## ----es------------------------------------------------------------------
head(perms) #take a look at the data structure
perms[perms$p >= .05,c('F','w2')] <- NA
plot(perms)

## ----agg-----------------------------------------------------------------
perms2 <- perms[perms$measure %in% .(Fp1,AF3,F7,F3,FC1,FC5,C3,CP1,CP5,CP6,CP2,C4,FC6,FC2,
	F4,F8,AF4,Fp2,Fz),]
perms2$measure <- 'Aggregate'
perms2 <- aggregate(. ~ measure + time + factor,perms2,mean)
plot(perms2$time,perms2$p)
abline(h=.01)

## ----2val----------------------------------------------------------------
unique(perms2[perms2$p < .01,'time'])

## ----aggplot-------------------------------------------------------------
class(perms2) <- c('permutes','data.frame')
plot(perms2,type='p',breaks=20*1:(450/20)) #x-axis labeling

## ----reshape-------------------------------------------------------------
library(dplyr)
library(tidyr)
part <- MMN %>%
	filter(time > 151, time < 263) %>%
	mutate(time = time - mean(time)) %>%
	gather('electrode','amplitude',Fp1:Cz) %>%
	mutate(lat = recode(electrode,Fp1=6,AF3=5,F7=6,F3=3,FC1=1,FC5=4,T7=6,C3=2,CP1=1,CP5=4,
		P7=6,P3=3,Pz=9,PO3=5,O1=6,Oz=13,O2=13,PO4=12,P4=10,P8=13,CP6=11,CP2=8,C4=9,T8=13,
		FC6=11,FC2=8,F4=10,F8=13,AF4=12,Fp2=13,Fz=9,Cz=7), lon = recode(electrode,Fp1=6,
		AF3=5,F7=2,F3=4,FC1=3,FC5=1,T7=8,C3=8,CP1=11,CP5=9,P7=10,P3=12,Pz=7,PO3=13,O1=14,
		Oz=7,O2=6,PO4=5,P4=4,P8=2,CP6=1,CP2=3,C4=8,T8=8,FC6=9,FC2=11,F4=12,F8=10,AF4=13,
		Fp2=14,Fz=15,Cz=8)) %>%
	filter(electrode %in% .(Fp1,AF3,F7,F3,FC1,FC5,C3,CP1,CP5,CP6,CP2,C4,FC6,FC2,F4,F8,AF4,
		Fp2,Fz),complete.cases(.))

## ----gam,eval=F----------------------------------------------------------
#  part$both <- part$dev * part$session #construct interaction term
#  clusterExport(cl,'part')
#  pairs <- list(c('S13','S94'),c('S16','S95'))
#  fun <- function (C) {
#  	library(mgcv)
#  	data <- part[part$cond %in% C,]
#  
#  	form <- amplitude ~ dev*session + s(ppn,bs='re') + s(ppn,by=dev,bs='re') +
#  		s(ppn,by=session,bs='re') + s(ppn,by=both,bs='re') +
#  		te(lat,lon,time,bs=c('sos','tp'),d=c(2,1),k=c(19,5)) +
#  		t2(lat,lon,time,ppn,bs=c('sos','tp','re'),d=c(2,1,1),k=c(19,5,5),m=1,full=TRUE)
#  	model <- bam(form,data=data,nthreads=8)
#  
#  	# Figure out the autocorrelation in the residuals. We cannot use acf(resid(m)),
#  	# because that will not take into account event boundaries (the whole dataset will be
#  	# treated as a single huge EEG signal)
#  	AR.start <- data$time == min(data$time)
#  	res <- resid(model)
#  	bins <- findInterval(1:length(res),which(AR.start))
#  	res.binned <- split(res,bins)
#  	rhos <- sapply(res.binned,function (x) acf(x,plot=FALSE)$acf[2])
#  
#  	bam(form,data=data,nthreads=8,AR.start=AR.start,rho=mean(rhos))
#  }
#  models <- parLapply(cl,pairs,fun)

## ----DONTRUNTHIS2,eval=F-------------------------------------------------
#  for (i in 1:2) {
#  	cat('\n---',pairs[[i]],'---\n')
#  	print(summary(models[[i]]))
#  }

## ----modelresults,echo=F-------------------------------------------------
cat('
--- S13 S94 ---

Family: gaussian 
Link function: identity 

Formula:
amplitude ~ dev * session + s(ppn, bs = "re") + s(ppn, by = dev, 
    bs = "re") + s(ppn, by = session, bs = "re") + s(ppn, by = both, 
    bs = "re") + te(lat, lon, time, bs = c("sos", "tp"), d = c(2, 
    1), k = c(19, 5)) + t2(lat, lon, time, ppn, bs = c("sos", 
    "tp", "re"), d = c(2, 1, 1), k = c(19, 5, 5), m = 1, full = TRUE)

Parametric coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   0.7964     0.1742   4.573 4.81e-06 ***
dev          -0.8847     0.2258  -3.917 8.95e-05 ***
session      -0.3645     0.1607  -2.268   0.0233 *  
dev:session  -0.1791     0.3444  -0.520   0.6031    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Approximate significance of smooth terms:
                         edf  Ref.df         F  p-value    
s(ppn)                  4.59   26.00     0.311 7.01e-09 ***
s(ppn):dev             25.87   26.00 17915.461  < 2e-16 ***
s(ppn):session         18.91   20.00 13891.178  < 2e-16 ***
s(ppn):both            19.71   20.00 18452.996  < 2e-16 ***
te(lat,lon,time)       74.64   79.84    25.534  < 2e-16 ***
t2(lat,lon,time,ppn) 1678.87 2538.00  4723.986  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

R-sq.(adj) =  0.773   Deviance explained = 77.6%
fREML = -65336  Scale est. = 0.17323   n = 111325

--- S16 S95 ---

Family: gaussian 
Link function: identity 

Formula:
amplitude ~ dev * session + s(ppn, bs = "re") + s(ppn, by = dev, 
    bs = "re") + s(ppn, by = session, bs = "re") + s(ppn, by = both, 
    bs = "re") + te(lat, lon, time, bs = c("sos", "tp"), d = c(2, 
    1), k = c(19, 5)) + t2(lat, lon, time, ppn, bs = c("sos", 
    "tp", "re"), d = c(2, 1, 1), k = c(19, 5, 5), m = 1, full = TRUE)

Parametric coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.83630    0.19354   4.321 1.55e-05 ***
dev         -1.09572    0.22361  -4.900 9.59e-07 ***
session     -0.58773    0.18237  -3.223  0.00127 ** 
dev:session -0.08214    0.24845  -0.331  0.74094    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Approximate significance of smooth terms:
                         edf  Ref.df        F  p-value    
s(ppn)                 15.47   26.00    3.569  < 2e-16 ***
s(ppn):dev             25.78   26.00 5721.790  < 2e-16 ***
s(ppn):session         19.02   20.00 4496.386 1.81e-12 ***
s(ppn):both            19.30   20.00 8343.386 1.15e-14 ***
te(lat,lon,time)       71.69   77.68   11.707  < 2e-16 ***
t2(lat,lon,time,ppn) 1515.23 2545.00 1013.609 4.85e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

R-sq.(adj) =  0.653   Deviance explained = 65.9%
fREML = -30484  Scale est. = 0.29661   n = 111203
')

## ----sidak,eval=F--------------------------------------------------------
#  corrected.summary <- function (summary) {
#  	correct <- function (table) {
#  		corr <- .05 / (1 - (1-.05)^(1/2))
#  		table[,4] <- pmin(table[,4]*corr,1)
#  		table
#  	}
#  	summary$p.table <- correct(summary$p.table)
#  	summary$s.table <- correct(summary$s.table)
#  	return(summary)
#  }

