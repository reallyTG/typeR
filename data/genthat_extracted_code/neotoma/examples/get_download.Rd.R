library(neotoma)


### Name: get_download
### Title: Function to return full download records using 'site's,
###   'dataset's, or dataset IDs.
### Aliases: get_download
### Keywords: IO connection

### ** Examples

## Not run: 
##D #  Search for sites with "Pseudotsuga" pollen that are older than 8kyr BP and
##D #  that are roughly within western British Columbia:
##D t8kyr.datasets <- get_dataset(taxonname='*Picea*', loc=c(-90, 41, -89, 44),
##D                               ageold = 20000, ageyoung=10000)
##D 
##D #  Returns 20 records (as of 04/04/2013), get the dataset for all records:
##D pollen.records <- get_download(t8kyr.datasets)
##D 
##D #  Standardize the taxonomies for the different records using the WS64 taxonomy.
##D compiled.sites <- compile_taxa(pollen.records, list.name='WS64')
##D 
##D #  Extract the Pseudotsuga curves for the sites:
##D get.curve <- function(x, taxa) {
##D                if (taxa %in% colnames(x$counts)) {
##D                  count <- x$counts[,taxa]/rowSums(x$counts, na.rm=TRUE)
##D                } else {
##D                  count <- rep(0, nrow(x$count))
##D                }
##D                data.frame(site = x$dataset$site.data$site.name,
##D                age = x$sample.meta$age,
##D                count = count)
##D              }
##D 
##D curves <- do.call(rbind.data.frame,
##D                   lapply(compiled.sites, get.curve, taxa = 'Larix/Pseudotsuga'))
##D 
##D #  For illustration, remove the sites with no Pseudotsuga occurance:
##D curves <- curves[curves$count > 0, ]
##D 
##D smooth.curve <- predict(loess(sqrt(count)~age, data=curves),
##D                         data.frame(age=seq(20000, 0, by = -100)))
##D 
##D plot(sqrt(count) ~ age, data = curves,
##D      ylab = '% Pseudotsuga/Larix', xlab='Calibrated Years BP', pch=19,
##D      col=rgb(0.1, 0.1, 0.1, 0.1), xlim=c(0, 20000))
##D lines(seq(20000, 0, by = -100), smooth.curve, lwd=2, lty=2, col=2)
##D 
##D #  This figure shows us an apparent peak in Larix/Pseudotsuga pollen in the
##D #  early-Holocene that lends support to a warmer, drier early-Holocene in
##D #  western North America.
## End(Not run)




