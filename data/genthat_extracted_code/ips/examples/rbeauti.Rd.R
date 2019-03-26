library(ips)


### Name: rbeauti
### Title: XML Input Files for BEAST
### Aliases: rbeauti

### ** Examples

data(ips.16S)

## define taxon sets
spec <- rownames(ips.16S)
ingroup <- spec[grep("Ips|Orthomotomicus", spec)]
outgroup <- spec[grep("Pityogenes", spec)]
ts <- list(list(id = "ingroup", taxon = ingroup),
           list(id = "outgroup", taxon = outgroup))

## print XML file to screen
rbeauti(ips.16S, taxonset = ts)



