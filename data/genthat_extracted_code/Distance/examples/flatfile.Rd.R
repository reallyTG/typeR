library(Distance)


### Name: flatfile
### Title: The flatfile data format
### Aliases: flatfile

### ** Examples

## Not run: 
##D library(Distance)
##D # Need to have the gdata library installed from CRAN, requires a system
##D # with perl installed (usually fine for Linux/Mac)
##D library(gdata)
##D 
##D # Need to get the file path first
##D # Going to the path given in the below, one can examine the format
##D minke.filepath <- system.file("minke.xlsx",package="Distance")
##D 
##D # Load the Excel file, note that header=FALSE and we add column names after
##D minke <- read.xls(minke.filepath, stringsAsFactor=FALSE,header=FALSE)
##D names(minke) <- c("Region.Label", "Area", "Sample.Label", "Effort","distance")
##D # One may want to call edit(minke) or head(minke) at this point
##D # to examine the data format
##D 
##D # Due to the way the file was saved and the default behaviour in R
##D # for numbers stored with many decimal places (they are read as strings
##D # rather than numbers, see str(minke)). We must coerce the Effort column
##D # to numeric
##D minke$Effort <- as.numeric(minke$Effort)
##D 
##D ## perform an analysis using the exact distances
##D pooled.exact <- ds(minke, truncation=1.5, key="hr", order=0)
##D summary(pooled.exact)
##D 
##D 
##D ## Try a binned analysis
##D # first define the bins
##D dist.bins <- c(0,.214, .428,.643,.857,1.071,1.286,1.5)
##D pooled.binned <- ds(minke, truncation=1.5, cutpoints=dist.bins, key="hr", order=0)
##D 
##D # binned with stratum as a covariate
##D minke$stratum <- ifelse(minke$Region.Label=="North", "N", "S")
##D strat.covar.binned <- ds(minke, truncation=1.5, key="hr",
##D                          formula=~as.factor(stratum), cutpoints=dist.bins)
##D 
##D # Stratified by North/South
##D full.strat.binned.North <- ds(minke[minke$Region.Label=="North",],
##D                   truncation=1.5, key="hr", order=0, cutpoints=dist.bins)
##D full.strat.binned.South <- ds(minke[minke$Region.Label=="South",],
##D                      truncation=1.5, key="hr", order=0, cutpoints=dist.bins)
##D 
##D ## model summaries
##D model.sel.bin <- data.frame(name=c("Pooled f(0)", "Stratum covariate",
##D                                    "Full stratification"),
##D                             aic=c(pooled.binned$ddf$criterion,
##D                                   strat.covar.binned$ddf$criterion,
##D                                   full.strat.binned.North$ddf$criterion+
##D                                   full.strat.binned.South$ddf$criterion))
##D 
##D # Note model with stratum as covariate is most parsimonious
##D print(model.sel.bin)
## End(Not run)



