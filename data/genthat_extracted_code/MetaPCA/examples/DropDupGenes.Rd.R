library(MetaPCA)


### Name: DropDupGenes
### Title: MetaPCA: Meta-analysis in the Dimension Reduction of Genomic
###   data
### Aliases: DropDupGenes
### Keywords: MetaAnalysis

### ** Examples

	## Not run: 
##D 	#One of example that shows how to generate a expression matrix used in the analysis
##D 	requireAll(c('GEOquery', 'affy', 'hgu133plus2.db'))
##D 	#It might be needed to download the source files first, and save it to local directory
##D 	#such as "./data/Prostate/Varambally" in this example
##D 	#ftp://ftp.ncbi.nih.gov/pub/geo/DATA/SeriesMatrix/GSE3325/GSE3325_series_matrix.txt.gz
##D 	Varambally <- getGEO('GSE3325', destdir="./data/Prostate/Varambally")
##D 	Varambally <- Varambally[[1]]
##D 	Varambally.sLabel <- as.character(pData(Varambally)$title)
##D 	Varambally.sLabel[grep("Benign",Varambally.sLabel)] <- "Normal"
##D 	Varambally.sLabel[grep("primary",Varambally.sLabel)] <- "Primary"
##D 	Varambally.sLabel[grep("Metastatic",Varambally.sLabel)] <- "Metastasis"
##D 	Varambally <- exprs(Varambally)
##D 	colnames(Varambally) <- Varambally.sLabel
##D 	rownames(Varambally) <- unlist(mget(rownames(Varambally), hgu133plus2SYMBOL))
##D 	Varambally <- DropDupGenes(Varambally, na.rm=TRUE)
##D 	Varambally <- log2(Varambally)
##D 	
## End(Not run)



