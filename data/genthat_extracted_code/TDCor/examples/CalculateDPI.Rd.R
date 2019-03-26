library(TDCor)


### Name: CalculateDPI
### Title: Generate the DPI database to be used by the TDCOR main function
### Aliases: CalculateDPI
### Keywords: Main functions

### ** Examples


## Not run: 
##D # Load the LR transcriptomic dataset
##D data(LR_dataset)
##D 
##D # Load the vector of gene codes, gene names and prior
##D data(l_genes)
##D data(l_names)
##D data(l_prior)
##D 
##D # Load the vector of time points for the LR_dataset
##D data(times)
##D 
##D # Generate a small DPI database (3 genes)
##D DPI_example=CalculateDPI(dataset=LR_dataset,l_genes=l_genes[4:6],l_prior=l_prior[4:6],
##D times=times,time_step=1,N=5000,ks_int=c(0.5,3),kd_int=c(0.5,3),delta_int=c(0.5,3),
##D noise=0.15,delay=3)
##D 
## End(Not run)



