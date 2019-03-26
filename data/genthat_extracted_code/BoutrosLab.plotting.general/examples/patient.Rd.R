library(BoutrosLab.plotting.general)


### Name: patient
### Title: Dataset describing qualities of 58 colon cancer patients
### Aliases: patient
### Keywords: datasets

### ** Examples


## Not run: 
##D # use sample to set colour scheme
##D sex.colours <- replace(as.vector(patient$sex), which(patient$sex == 'male'),'dodgerblue');
##D sex.colours <- replace(sex.colours, which(patient$sex == 'female'), 'pink');
##D len <- apply(SNV[1:15], 2, function(x){mutation.count <- length(which(x == 1))});
##D 
##D create.barplot(
##D     filename = paste0(tempdir(),'/Using_patient_dataset.tiff'),
##D     formula = len ~ colnames(SNV[1:15]) ,
##D     data = SNV,
##D     main = 'patient dataset',
##D     xaxis.rot = 45, 
##D     ylimits = c(0,30),
##D     yat = seq(0,30,5),
##D     col = sex.colours,
##D     description = 'Barplot created by BoutrosLab.plotting.general'
##D     );
## End(Not run)



