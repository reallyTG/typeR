library(BoutrosLab.plotting.general)


### Name: generate.filename
### Title: Generate a filename in the lab standard
### Aliases: generate.filename
### Keywords: utilities

### ** Examples

# generate a filename to screen
generate.filename('NSCLC', 'StatisticalAnalysis', 'txt');

# generate a filename in context of another function
save.session.profile( paste0(paste0(tempdir(),"/"),
	generate.filename('Prostate', 'StatisticalAnalysisSessionProfile', 'txt')) );

# generate a filename without a date
generate.filename('NSCLC', 'StatisticalAnalysis', 'txt', FALSE);



