library(saasCNV)


### Name: NGS.CNV
### Title: CNV Analysis Pipeline for WGS and WES Data
### Aliases: NGS.CNV
### Keywords: NGS CNV pipeline

### ** Examples

## Not run: 
##D ## NGS pipeline analysis
##D ## download vcf_table.txt.gz
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/vcf_table.txt.gz"
##D tryCatch({download.file(url=url, destfile="vcf_table.txt.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="vcf_table.txt.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D vcf_table <- read.delim(file="vcf_table.txt.gz", as.is=TRUE)
##D 
##D ## download refGene_hg19.txt.gz
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/refGene_hg19.txt.gz"
##D tryCatch({download.file(url=url, destfile="refGene_hg19.txt.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="refGene_hg19.txt.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D sample.id <- "WES_0116"
##D output.dir <- file.path(getwd(), "test_saasCNV")
##D 
##D NGS.CNV(vcf=vcf_table, output.dir=output.dir, sample.id=sample.id,
##D         min.chr.probe=100,
##D         min.snps=10,
##D         joint.segmentation.pvalue.cutoff=1e-4,
##D         max.chpts=30,
##D         do.merge=TRUE, use.null.data=TRUE, num.perm=1000, maxL=2000, 
##D         merge.pvalue.cutoff=0.05,
##D         do.cnvcall.on.merge=TRUE, 
##D         cnvcall.pvalue.cutoff=0.05,
##D         do.plot=TRUE, cex=0.3, ref.num.probe=1000,
##D         do.gene.anno=TRUE,
##D         gene.anno.file="refGene_hg19.txt.gz",
##D         seed=123456789,
##D         verbose=TRUE)
## End(Not run)




