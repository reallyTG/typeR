library(pegas)


### Name: read.vcf
### Title: Read Variant Calling Format Files
### Aliases: read.vcf
### Keywords: IO

### ** Examples

## Not run: 
##D ## Chr Y from the 1000 Genomes:
##D a <- "ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/release/20130502"
##D b <- "ALL.chrY.phase3_integrated_v1b.20130502.genotypes.vcf.gz"
##D ## WARNING: the name of the file above may change
##D url <- paste(a, b, sep = "/")
##D ## Solution 1: download first
##D download.file(url, "chrY.vcf.gz")
##D ## no need to uncompress:
##D (info <- VCFloci("chrY.vcf.gz"))
##D str(info) # show the modes of the columns
##D ## Solution 2: read remotely (since pegas 0.11)
##D info2 <- VCFloci(url)
##D identical(info, info2)
##D rm(info2)
##D 
##D SNP <- is.snp(info)
##D table(SNP) # how many loci are SNPs?
##D ## compare with:
##D table(getINFO(info, "VT"))
##D 
##D op <- par(mfcol = c(4, 1), xpd = TRUE)
##D lim <- c(2.65e6, 2.95e6)
##D ## distribution of SNP and non-SNP mutations along the Y chr:
##D plot(info$POS, !SNP, "h", col = "red", main = "non-SNP mutations",
##D      xlab = "Position", ylab = "", yaxt = "n")
##D rect(lim[1], -0.1, lim[2], 1.1, lwd = 2, lty = 2)
##D plot(info$POS, SNP, "h", col = "blue", main = "SNP mutations",
##D      xlab = "Position", ylab = "", yaxt = "n")
##D rect(lim[1], -0.1, lim[2], 1.1, lwd = 2, lty = 2)
##D par(xpd = FALSE)
##D ## same focusing on a smaller portion of the chromosome:
##D plot(info$POS, !SNP, "h", col = "red", xlim = lim, xlab = "Position",
##D      ylab = "", yaxt = "n")
##D plot(info$POS, SNP, "h", col = "blue", xlim = lim, xlab = "Position",
##D      ylab = "", yaxt = "n")
##D par(op)
##D 
##D ## read both types of mutations separately:
##D X.SNP <- read.vcf("chrY.vcf.gz", which.loci = which(SNP))
##D X.other <- read.vcf("chrY.vcf.gz", which.loci = which(!SNP))
##D 
##D identical(rownames(X.SNP), VCFlabels("chrY.vcf.gz")) # TRUE
##D cat(VCFheader("chrY.vcf.gz"))
##D 
##D ## get haplotypes for the first 10 loci:
##D h <- haplotype(X.SNP, 1:10)
##D ## plot their frequencies:
##D op <- par(mar = c(3, 10, 1, 1))
##D plot(h, horiz=TRUE, las = 1)
##D par(op)
## End(Not run)



