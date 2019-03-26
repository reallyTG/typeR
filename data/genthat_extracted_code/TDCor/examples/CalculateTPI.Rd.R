library(TDCor)


### Name: CalculateTPI
### Title: Generate the TPI database to be used by the TDCOR main function
### Aliases: CalculateTPI
### Keywords: Main functions

### ** Examples


## Not run: 
##D # Load the lateral root transcriptomic dataset
##D data(LR_dataset)
##D 
##D # Load the vectors of gene codes, gene names and prior
##D data(l_genes)
##D data(l_names)
##D data(l_prior)
##D 
##D # Load the vector of time points for the the lateral root dataset
##D data(times)
##D 
##D # Generate a small TPI database (3 genes)
##D 
##D TPI_example=CalculateTPI(dataset=LR_dataset,l_genes=l_genes[4:6],
##D l_prior=l_prior[4:6],times=times,time_step=1,N=5000,ks_int=c(0.5,3),
##D kd_int=c(0.5,3),delta_int=c(0.5,3),noise=0.1,delay=3)
## End(Not run)



