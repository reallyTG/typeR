library(MonteCarlo)


### Name: MonteCarlo
### Title: Parallized Monte Carlo Simulation
### Aliases: MonteCarlo

### ** Examples

test_func<-function(n,loc,scale){
 sample<-rnorm(n, loc, scale)
 stat<-sqrt(n)*mean(sample)/sd(sample)
 decision<-abs(stat)>1.96
 return(list("decision"=decision))
}

# Example without parallization
n_grid<-c(50,100,250,500)
loc_grid<-seq(0,1,0.2)
scale_grid<-c(1,2)

param_list=list("n"=n_grid, "loc"=loc_grid, "scale"=scale_grid)
erg<-MonteCarlo(func=test_func, nrep=250, param_list=param_list, ncpus=1)
summary(erg)

rows<-c("n")
cols<-c("loc","scale")
MakeTable(output=erg, rows=rows, cols=cols, digits=2)

# Note that parallized computation is not always faster, 
# due to the computational costs of the overhead 
# that is needed to manage multiple CPUs.




