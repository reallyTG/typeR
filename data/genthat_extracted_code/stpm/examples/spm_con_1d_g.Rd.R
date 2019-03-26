library(stpm)


### Name: spm_con_1d_g
### Title: Fitting a 1-D genetic SPM model with constant parameters
### Aliases: spm_con_1d_g

### ** Examples

## Not run: 
##D  
##D library(stpm) 
##D data(ex_spmcon1dg)
##D res <- spm_con_1d_g(ex_data$spm_data, ex_data$gene_data, 
##D a = -0.02, b=0.2, q=0.01, f=3, f1=3, mu0=0.01, theta=1e-05, 
##D upper=c(-0.01,3,0.1,10,10,0.1,1e-05), lower=c(-1,0.01,0.00001,1,1,0.001,1e-05), 
##D effect=c('q'))
## End(Not run)



