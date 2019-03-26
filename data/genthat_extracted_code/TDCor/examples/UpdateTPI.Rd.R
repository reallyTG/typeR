library(TDCor)


### Name: UpdateTPI
### Title: Update or check the TPI database
### Aliases: UpdateTPI
### Keywords: Main functions

### ** Examples

## Not run: 
##D # Load the Lateral root transcriptomic dataset
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
##D # Build a very small TPI database (3 genes)
##D TPI_example=CalculateTPI(dataset=LR_dataset,l_genes=l_genes[4:6],
##D l_prior=l_prior[4:6],times=times,time_step=1,N=5000,ks_int=c(0.5,3),
##D kd_int=c(0.5,3),delta_int=c(0.5,3),noise=0.1,delay=3)
##D 
##D # Add one gene in the database
##D TPI_example=UpdateTPI(TPI_example,dataset=LR_dataset,l_genes[4:7],l_prior[4:7])
## End(Not run)



