library(Haplin)


### Name: haplinSlide
### Title: Run haplin analysis in a series of sliding windows over a
###   sequence of markers/SNPs
### Aliases: haplinSlide

### ** Examples


## Not run: 
##D # (Almost) all standard haplin runs can be done with haplinSlide. 
##D # Below is an illustration. See the haplin help page for more 
##D # examples.
##D # 
##D 
##D # 1. Read the data:
##D my.haplin.data <- genDataRead( file.in = "HAPLIN.trialdata.txt", file.out =
##D   "trial_data1", dir.out = ".", format = "haplin", n.vars = 0 )
##D 
##D # 2. Run pre-processing:
##D haplin.data.prep <- genDataPreprocess( data.in = my.haplin.data,
##D   format = "haplin", design = "triad", file.out = "trial_data1_prep",
##D   dir.out = "." )
##D 
##D # 3. Analyze:
##D # Analyzing the effect of fetal genes, including triads with missing data,
##D # using a multiplicative response model. When winlength = 1, separate
##D # markers are used. To make longer windows, winlength can be increased
##D # correspondingly:
##D result.1 <- haplinSlide( haplin.data.prep, use.missing = T, response = "mult",
##D reference = "ref.cat", winlength = 1, table.output = F)
##D # Provide summary of separate results:
##D lapply(result.1, summary)
##D # Plot results:
##D par(ask = T)
##D lapply(result.1, plot)
##D 
##D 
##D 
##D 
## End(Not run)




