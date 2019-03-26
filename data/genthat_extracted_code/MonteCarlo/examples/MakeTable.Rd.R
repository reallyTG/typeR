library(MonteCarlo)


### Name: MakeTable
### Title: Create LaTeX Tables From MonteCarlo Output.
### Aliases: MakeTable

### ** Examples

test_func<-function(n,loc,scale){
 sample<-rnorm(n, loc, scale)
 stat<-sqrt(n)*mean(sample)/sd(sample)
 decision<-abs(stat)>1.96
 return(list("decision"=decision))
}

n_grid<-c(50,100,250,500)
loc_grid<-seq(0,1,0.2)
scale_grid<-c(1,2)

param_list=list("n"=n_grid, "loc"=loc_grid, "scale"=scale_grid)
erg<-MonteCarlo(func=test_func, nrep=250, param_list=param_list, ncpus=1)
str(erg)

rows<-c("n")
cols<-c("loc","scale")
MakeTable(output=erg, rows=rows, cols=cols, digits=2)


#-------- Further Examples: Compare Mean and Median as Estimators for the Expected Value

# define func

func<-function(n,loc,scale){
 
 # generate sample
 sample<-rnorm(n, loc, scale)
 
 # calculate estimators
 mean_sample<-mean(sample)
 median_sample<-median(sample)
 
 # calculate bias
 bias_mean_sample<-mean_sample-loc
 bias_median_sample<-median_sample-loc
 
 # return results
 return(list("mean for calculation of sd"=mean_sample, 
 "bias_mean"=bias_mean_sample, 
 "median for calculation of sd"=median_sample,
 "bias_median"=bias_median_sample))
}

n_grid<-c(50,100,250,500)
loc_grid<-seq(0,1,0.2)
scale_grid<-c(1,2)

param_list=list("n"=n_grid, "loc"=loc_grid, "scale"=scale_grid)
erg_mean_median<-MonteCarlo(func=func, nrep=250, param_list=param_list, ncpus=1)

rows<-c("n")
cols<-c("loc","scale")

# use partial_grid

MakeTable(output=erg_mean_median, rows=rows, cols=cols, digits=2,
          partial_grid=list("n"=c(1,3), "loc"=c(1,3,5)), include_meta=FALSE)

# use collapse to calculate standard deviation and bias

collapse<-list("sd", "mean", "sd", "mean")
MakeTable(output=erg_mean_median, rows=rows, cols=cols, digits=2, 
          collapse=collapse, include_meta=FALSE)

# merge all results in one table

MakeTable(output=erg_mean_median, rows=c("n","loc"), cols=c("scale","list"),
          digits=2, collapse=collapse, include_meta=FALSE)

# transform the results for better scaling

scale_table_10<-function(x){x*10}

MakeTable(output=erg_mean_median, rows=c("n","loc"), cols=c("scale","list"),
          digits=2, collapse=collapse,
          transform=list(scale_table_10, NULL, function(x){x*10}, NULL),
          include_meta=FALSE)




