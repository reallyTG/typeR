library(TDCor)


### Name: TDCor-package
### Title: TDCor algorithm for gene regulatory network inference
### Aliases: TDCor-package

### ** Examples

## Not run: 
##D # Load the LR transcriptomic dataset
##D data(LR_dataset)
##D 
##D # Load the vectors of genes codes, gene names and prior
##D data(l_genes)
##D data(l_names)
##D data(l_prior)
##D 
##D # Load the vector of time points for the LR_dataset
##D data(times)
##D 
##D # Generate the TPI database (this may take several hours) 
##D 
##D TPI10=CalculateTPI(dataset=LR_dataset,l_genes=l_genes,l_prior=l_prior, 
##D times=times,time_step=1,N=10000,ks_int=c(0.5,3),kd_int=c(0.5,3), 
##D delta_int=c(0.5,3),noise=0.1,delay=3)
##D 
##D # Generate the DPI database (this may take several hours) 
##D 
##D DPI15=CalculateDPI(dataset=LR_dataset,l_genes=l_genes,l_prior=l_prior, 
##D times=times,time_step=1,N=10000,ks_int=c(0.5,3),kd_int=c(0.5,3), 
##D delta_int=c(0.5,3), noise=0.15, delay=3)
##D 
##D # Check/update if necessary the databases
##D 
##D TPI10=UpdateTPI(TPI10,LR_dataset,l_genes,l_prior)
##D DPI15=UpdateDPI(DPI15,LR_dataset,l_genes,l_prior)
##D 
##D # Choose your parameters 
##D 
##D ptime_step=1			
##D ptol=0.13			
##D pdelayspan=12			
##D pthr_cor=c(0.65,0.8)	
##D pdelaymax=c(2.5,3.5)		
##D pdelaymin=0			
##D pdelay=3			
##D pthrpTPI=c(0.55,0.8)		
##D pthrpDPI=c(0.65,0.8)		
##D pthr_overlap=c(0.4,0.6)		
##D pthr_ind1=0.65			
##D pthr_ind2=3.5			
##D pn0=1000			
##D pn1=10				
##D pregmax=5					
##D pthr_isr=c(4,6)			
##D pTPI=TPI10			
##D pDPI=DPI15			
##D pMinTarNumber=5			
##D pMinProp=0.6			
##D poutfile_name="TDCor_output.txt"	
##D 
##D 
##D # Reconstruct the network
##D 
##D tdcor_out= TDCOR(dataset=LR_dataset, l_genes=l_genes,l_names=l_names,n0=pn0,n1=pn1,
##D l_prior=l_prior, thr_ind1=pthr_ind1,thr_ind2=pthr_ind2,regmax=pregmax,thr_cor=pthr_cor,
##D delayspan=pdelayspan,delaymax=pdelaymax,delaymin=pdelaymin,delay=pdelay,thrpTPI=pthrpTPI,
##D thrpDPI=pthrpDPI,TPI=pTPI,DPI=pDPI,thr_isr=pthr_isr,time_step=ptime_step,thr_overlap=pthr_overlap,
##D tol=ptol,MinProp=pMinProp,MinTarNumber=pMinTarNumber,outfile_name=poutfile_name)
##D 
## End(Not run)



