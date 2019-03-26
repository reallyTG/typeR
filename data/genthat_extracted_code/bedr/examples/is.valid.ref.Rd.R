library(bedr)


### Name: is.valid.ref
### Title: verifies the reference sequence in a vcf
### Aliases: is.valid.ref
### Keywords: sequence

### ** Examples


vcf.path <- system.file("extdata/callerA.vcf.gz", package = "bedr");
vcf.data <- read.vcf(vcf.path, split.info = TRUE);
vcf.data$vcf <- vcf.data$vcf[, 
	c("CHROM", "POS", "END", setdiff(colnames(vcf.data$vcf), c("CHROM", "POS", "END")))
	];
vcf.data$vcf$CHROM <- paste("chr", vcf.data$vcf$CHROM, sep = "");

## Not run: 
##D 	# need reference sequence FASTA and index file to run this, as 'fasta' parameter
##D 	is.valid.ref(vcf.data);
##D 	
## End(Not run)



