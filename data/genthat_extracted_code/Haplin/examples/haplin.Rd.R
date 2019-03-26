library(Haplin)


### Name: haplin
### Title: Fitting log-linear models to case-parent triad and/or
###   case-control data
### Aliases: haplin

### ** Examples

# setting up the directory with exemplary data
dir.in <- system.file( "extdata", package = "Haplin" )
file.in <- paste0( dir.in, "/data.dat" )

# reading data in
data.in <- genDataRead( file.in, file.out = "poo_exmpl_data_read", format = "haplin",
  n.vars = 1, allele.sep = " ", col.sep = " ", overwrite = TRUE )
# preprocessing the data
data.preproc <- genDataPreprocess( data.in, design = "triad",
  file.out = "poo_exmpl_data_preproc", overwrite = TRUE )

# running haplin, calculating POO
res.POO <- haplin( data.preproc, markers = 2, poo = TRUE, response = "mult",
  reference = 2, use.missing = TRUE )
res.POO

## Not run: 
##D # 1. Read the data:
##D my.haplin.data <- genDataRead( file.in = "HAPLIN.trialdata.txt", file.out =
##D   "trial_data1", dir.out = ".", format = "haplin", n.vars = 0 )
##D 
##D # 2. Run pre-processing:
##D haplin.data.prep <- genDataPreprocess( data.in = my.haplin.data, format =
##D   "haplin", design = "triad", file.out = "trial_data1_prep", dir.out = "." )
##D 
##D # 3. Analyze:
##D # Standard run:
##D haplin( haplin.data.prep )
##D 
##D # Specify path, estimate maternal effects:
##D haplin( haplin.data.prep, maternal = T )
##D 
##D # Specify path, use haplotype no. 2 as reference:
##D haplin( haplin.data.prep, reference = 2 )
##D 
##D # Remove more haplotypes from estimation by increasing the threshold 
##D # to 5%:
##D haplin( haplin.data.prep, threshold = 0.05 )
##D 
##D # Estimate maternal effects, using the most frequent haplotype as reference. 
##D # Use all data, including triads with missing data. Select 
##D # markers 3, 4 and 8 from the supplied data.
##D haplin( haplin.data.prep, use.missing = T, maternal = T, 
##D reference = "ref.cat", markers = c(3,4,8) )
##D # Note: in this version of haplin, the jackknife is 
##D # no longer necessary since the standard errors are already corrected.
##D 
##D # Some examples showing how to save the haplin result and later 
##D # recall plot and summary results:
##D 
##D # Same analysis as above, saving the result in the object "result.1":
##D result.1 <- haplin( haplin.data.prep, use.missing = T, maternal = T, 
##D reference = "ref.cat", markers = c(3,4,8) )
##D 
##D # Replot the saved result (fetal effects):
##D plot( result.1 )
##D 
##D # Replot the saved result (maternal effects):
##D plot( result.1, plot.maternal = T )
##D 
##D # Print a very short summary of saved result:
##D result.1
##D 
##D # A full summary of saved result, with confidence intervals and 
##D # p-values (the same as haplin prints when running):
##D summary( result.1 )
##D 
##D # Some examples when the data file contains two covariates, 
##D # the second is the case-control variable:
##D 
##D # The following standard triad run is INCORRECT since it disregards 
##D # case status:
##D haplin("data.dat", use.missing = T, n.vars = 2, design = "triad")
##D 
##D # Combined run on "hybrid" design, correctly using both case-parent 
##D # triads and control-parent triads:
##D haplin( my.haplin.data, use.missing = T, n.vars = 2, ccvar = 2, 
##D design = "cc.triad" )
##D 
##D # If parent columns are not in the file, a plain case-control 
##D # run can be used:
##D haplin( my.haplin.data, use.missing = T, n.vars = 2, ccvar = 2, 
##D design = "cc", response = "mult", reference = "ref.cat" )
##D 
##D # An example of how to produce a data file with all possible haplotypes
##D # identified for each triad, together with their probaility weights:
##D result.data <- haplin( my.haplin.data, use.missing = T, 
##D markers = c(3,4,8), data.out = "prelim" )
##D # result.data will then contain the data file, with a vector of 
##D # probabilities (freq) computed from the preliminary haplotype
##D # frequencies.
## End(Not run)




