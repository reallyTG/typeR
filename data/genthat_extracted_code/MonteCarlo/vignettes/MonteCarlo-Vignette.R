## ----eval=FALSE----------------------------------------------------------
#  library(MonteCarlo)

## ----include=FALSE-------------------------------------------------------
library(MonteCarlo)
set.seed(1234)

## ------------------------------------------------------------------------
#########################################
##      Example: t-test

# Define function that generates data and applies the method of interest

ttest<-function(n,loc,scale){
  
  # generate sample:
    sample<-rnorm(n, loc, scale)
  
  # calculate test statistic:
    stat<-sqrt(n)*mean(sample)/sd(sample)
  
  # get test decision:
    decision<-abs(stat)>1.96
  
  # return result:
    return(list("decision"=decision))
}

## ------------------------------------------------------------------------

# define parameter grid:

  n_grid<-c(50,100,250,500)
  loc_grid<-seq(0,1,0.2)
  scale_grid<-c(1,2)

# collect parameter grids in list:
  param_list=list("n"=n_grid, "loc"=loc_grid, "scale"=scale_grid)

## ----eval=FALSE----------------------------------------------------------
#  # run simulation:
#  
#    MC_result<-MonteCarlo(func=ttest, nrep=1000, param_list=param_list)

## ----include=FALSE-------------------------------------------------------
  MC_result<-MonteCarlo(func=ttest, nrep=1000, param_list=param_list)

## ------------------------------------------------------------------------

  summary(MC_result)

## ------------------------------------------------------------------------
# generate table:

  MakeTable(output=MC_result, rows="n", cols=c("loc","scale"), digits=2, include_meta=FALSE)

## ------------------------------------------------------------------------
# generate table:

  MakeTable(output=MC_result, rows=c("n","scale"), cols="loc", digits=2, include_meta=FALSE)


## ------------------------------------------------------------------------
#  MC_result<-MonteCarlo(func=ttest, nrep=1000, param_list=param_list, [comment]: # debug=TRUE)

## ------------------------------------------------------------------------
ttest<-function(n,loc,scale){
  
  sample<-rnorm(n, loc, scale)
  stat<-sqrt(n)*mean(sample)/sd(sample)
  return(list("stat"=stat))
}

## ----include=FALSE-------------------------------------------------------
  MC_result<-MonteCarlo(func=ttest, nrep=1000, param_list=param_list)

## ----eval=FALSE----------------------------------------------------------
#   MC_result<-MonteCarlo(func=ttest, nrep=1000, param_list=param_list)

## ------------------------------------------------------------------------
df<-MakeFrame(MC_result)
head(df)

## ----message=FALSE, warning=FALSE----------------------------------------
library(dplyr)
library(ggplot2)
tbl <- tbl_df(df)
ggplot(filter(tbl, loc==0, scale==1)) + geom_density(aes(x=stat, col=factor(n)))

## ------------------------------------------------------------------------

mean_vs_median<-function(n,scale){

# generate sample
sample<-rnorm(n, 0, scale)

# calculate estimators
mean_sample<-mean(sample)
median_sample<-median(sample)

# return results
return(list("mean"=mean_sample, "median"=median_sample))
}

n_grid<-c(50, 250, 500)
scale_grid<-c(1, 2, 4)

param_list=list("n"=n_grid, "scale"=scale_grid)

## ----eval=FALSE----------------------------------------------------------
#  # run simulation:
#  
#  erg_mean_median<-MonteCarlo(func=mean_vs_median, nrep=1000, param_list=param_list)

## ----include=FALSE-------------------------------------------------------
erg_mean_median<-MonteCarlo(func=mean_vs_median, nrep=1000, param_list=param_list)

## ------------------------------------------------------------------------
MakeTable(output=erg_mean_median, rows="n", cols="scale", digits=2, include_meta=FALSE)

## ------------------------------------------------------------------------

MakeTable(output=erg_mean_median, rows=c("n"), cols=c("scale","list"), digits=2, include_meta=FALSE)


## ------------------------------------------------------------------------
# use partial_grid

MakeTable(output=erg_mean_median, rows="n", cols=c("scale","list"), digits=2,
          partial_grid=list("n"=c(1,3), "scale"=c(1,3)), include_meta=FALSE)


## ------------------------------------------------------------------------
MakeTable(output=erg_mean_median, rows=c("n"), cols=c("scale","list"), digits=4, include_meta=FALSE)

## ------------------------------------------------------------------------
MakeTable(output=erg_mean_median, rows=c("n"), cols=c("scale","list"), digits=2, transform=list(function(x){x*100}, function(x){x*100}), include_meta=FALSE)

## ------------------------------------------------------------------------
MakeTable(output=erg_mean_median, rows="n", cols=c("scale", "list"), digits=2, collapse=list("sd", "sd"), include_meta=FALSE)

## ------------------------------------------------------------------------
mean_vs_median<-function(n,scale,DGP){
  
  # generate sample
  
  if(DGP=="normal"){sample<-rnorm(n, 0, scale)}
  
  if(DGP=="uniform"){
    b<-scale/(2*sqrt(1/12))
    sample<-runif(n, -b, b)
  }
  
  # calculate estimators
  mean_sample<-mean(sample)
  median_sample<-median(sample)
  
  # return results
  return(list("mean"=mean_sample, "median"=median_sample))
}

n_grid<-c(50, 250, 500)
scale_grid<-c(1, 2, 4)
DGP_grid<-c("normal", "uniform")

param_list=list("n"=n_grid, "scale"=scale_grid, "DGP"=DGP_grid)

## ----eval=FALSE----------------------------------------------------------
#  # run simulation:
#  
#  erg_mean_median<-MonteCarlo(func=mean_vs_median, nrep=1000, param_list=param_list)

## ----include=FALSE-------------------------------------------------------
erg_mean_median<-MonteCarlo(func=mean_vs_median, nrep=1000, param_list=param_list)

## ------------------------------------------------------------------------
MakeTable(output=erg_mean_median, rows=c("n","DGP"), cols=c("scale", "list"), digits=2, collapse=list("sd", "sd"), include_meta=FALSE)

