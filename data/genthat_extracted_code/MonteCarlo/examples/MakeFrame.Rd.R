library(MonteCarlo)


### Name: MakeFrame
### Title: Conversion of MonteCarlo outputs to data.frame.
### Aliases: MakeFrame

### ** Examples

test_func<-function(n,loc,scale){
 sample<-rnorm(n, loc, scale)
 stat<-sqrt(n)*mean(sample)/sd(sample)
 decision<-abs(stat)>1.96
 return(list("decision"=decision, "stat"=stat))
}

n_grid<-c(50,100,250,500)
loc_grid<-c(0,1)
scale_grid<-c(1,2)

param_list=list("n"=n_grid, "loc"=loc_grid, "scale"=scale_grid)
erg<-MonteCarlo(func=test_func, nrep=250, param_list=param_list, ncpus=1)
df<-MakeFrame(erg)
head(df)

library(dplyr)
library(ggplot2)
tbl <- tbl_df(df)
ggplot(filter(tbl, loc==0)) + geom_density(aes(x=stat, col=factor(n)))




