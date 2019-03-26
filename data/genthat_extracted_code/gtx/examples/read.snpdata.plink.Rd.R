library(gtx)


### Name: read.snpdata.plink
### Title: Read genotype dosages in the format output by PLINK.
### Aliases: read.snpdata.plink

### ** Examples

## Not run: 
##D mypheno <- read.table("MYPHENO.dat", header = TRUE,
##D                       as.is = TRUE, na.strings = c("NA", "-9"))
##D system("plink --bfile MYBED --freq --out MYEXPORT")
##D system("plink --bfile MYBED --recodeA --out MYEXPORT")
##D mydata <- read.snpdata.plink("MYEXPORT", phenotypes = mypheno)
## End(Not run)



