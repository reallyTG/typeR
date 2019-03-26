library(Haplin)


### Name: haplinStrat
### Title: Fit 'haplin' to each subset/stratum of data, determined by the
###   argument 'strata'
### Aliases: haplinStrat

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

# running haplinStrat, checking for gene-environment interactions
res.GxE <- haplinStrat( data.preproc, markers = 2, strata = 1, poo = FALSE,
  response = "mult", reference = 2, use.missing = TRUE )
res.GxE

# running haplinStrat, checking for POO-environment interactions
res.POOxE <- haplinStrat( data.preproc, markers = c(1,2,3), strata = 1, poo = TRUE,
  response = "mult", reference = "ref.cat", use.missing = TRUE )
res.POOxE

## Not run: 
##D # All standard haplin runs can be done with haplinStrat. 
##D # Below is an illustration. See the haplin help page for more 
##D # examples.
##D # 
##D # Analyzing the effect of fetal genes, including triads with missing data,
##D # using a multiplicative response model. The first column of the data file
##D # in this example contains the stratification variable.
##D result <- haplinStrat("C:/work/data.dat", strata = 1, use.missing = T, response = "mult",
##D reference = "ref.cat", winlength = 1)
##D # Provide summary of separate results:
##D lapply(result, summary)
##D # Plot results separately:
##D par(ask = T)
##D lapply(result, plot)
##D #
##D # Convert results to table format and stack them over strata:
##D haptable(result)
##D # Test for interaction between haplotype risk estimates and the strata variable:
##D postTest(result)
##D 
##D 
##D 
##D 
## End(Not run)




