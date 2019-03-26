library(saasCNV)


### Name: reannotate.CNV.res
### Title: Gene Annotation
### Aliases: reannotate.CNV.res
### Keywords: CNV gene annotation

### ** Examples


## Not run: 
##D ## An example of RefSeq gene annotation file,
##D ## the original version of which can be downloaded from UCSC Genome Browser
##D url <- "https://zhangz05.u.hpc.mssm.edu/saasCNV/data/refGene_hg19.txt.gz"
##D tryCatch({download.file(url=url, destfile="refGene_hg19.txt.gz")
##D          }, error = function(e) {
##D           download.file(url=url, destfile="refGene_hg19.txt.gz", method="curl")
##D          })
##D ## If download.file fails to download the data, please manually download it from the url.
##D 
##D gene.anno <- read.delim(file="refGene_hg19.txt.gz", as.is=TRUE, comment.char="")
##D data(seq.cnv)
##D seq.cnv.anno <- reannotate.CNV.res(res=seq.cnv, gene=gene.anno, only.CNV=TRUE)
## End(Not run)




