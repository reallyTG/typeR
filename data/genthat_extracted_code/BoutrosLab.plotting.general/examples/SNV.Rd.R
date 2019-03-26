library(BoutrosLab.plotting.general)


### Name: SNV
### Title: Single nucleotide variant (SNV) data from colon cancer patients
### Aliases: SNV
### Keywords: datasets

### ** Examples

## Not run: 
##D len <- apply(SNV[1:15], 2, function(x){mutation.count <- length(which(x == 1))});
##D 
##D create.barplot(
##D     filename = paste0(tempdir(),'/Using_SNV_dataset.tiff'),
##D     formula = len ~ colnames(SNV[1:15]) ,
##D     data = SNV,
##D     main = 'SNV dataset',
##D     xaxis.rot = 45, 
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
## End(Not run)



