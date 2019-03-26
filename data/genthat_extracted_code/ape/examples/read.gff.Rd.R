library(ape)


### Name: read.gff
### Title: Read GFF Files
### Aliases: read.gff
### Keywords: IO

### ** Examples

## Not run: 
##D ## requires to be connected on Internet
##D d <- "ftp://ftp.ensembl.org/pub/release-86/gff3/homo_sapiens/"
##D f <- "Homo_sapiens.GRCh38.86.chromosome.MT.gff3.gz"
##D download.file(paste0(d, f), "mt_gff3.gz")
##D gff.mito <- read.gff("mt_gff3.gz")
##D ## the lengths of the sequence features:
##D gff.mito$end - (gff.mito$start - 1)
##D table(gff.mito$type)
##D ## where the exons start:
##D gff.mito$start[gff.mito$type == "exon"]
## End(Not run)



