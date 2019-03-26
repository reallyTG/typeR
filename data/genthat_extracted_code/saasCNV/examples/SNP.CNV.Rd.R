library(saasCNV)


### Name: SNP.CNV
### Title: CNV Analysis Pipeline for SNP array Data
### Aliases: SNP.CNV
### Keywords: SNP array CNV pipeline

### ** Examples

## Not run: 
##D ## the pipeline for SNP array analysis
##D ## download snp_table.txt.gz
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/snp_table.txt.gz"
##D tryCatch({download.file(url=url, destfile="snp_table.txt.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="snp_table.txt.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D snp_table <- read.delim(file="snp_table.txt.gz", as.is=TRUE)
##D 
##D ## download refGene_hg19.txt.gz
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/refGene_hg19.txt.gz"
##D tryCatch({download.file(url=url, destfile="refGene_hg19.txt.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="refGene_hg19.txt.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D sample.id <- "SNP_0116"
##D output.dir <- file.path(getwd(), "test_saasCNV")
##D 	
##D SNP.CNV(snp=snp_table, output.dir=output.dir, sample.id=sample.id,
##D         min.chr.probe=100,
##D         min.snps=10,
##D         joint.segmentation.pvalue.cutoff=1e-4,
##D         max.chpts=30,
##D         do.merge=TRUE, use.null.data=TRUE, num.perm=1000, maxL=5000, 
##D         merge.pvalue.cutoff=0.05,
##D         do.cnvcall.on.merge=TRUE, 
##D         cnvcall.pvalue.cutoff=0.05,
##D         do.boundary.refine=TRUE,
##D         do.plot=TRUE, cex=0.3, ref.num.probe=5000,
##D         do.gene.anno=TRUE,
##D         gene.anno.file="refGene_hg19.txt.gz",
##D         seed=123456789,
##D         verbose=TRUE)
## End(Not run)




