library(bedr)


### Name: get.fasta
### Title: Query fasta sequence
### Aliases: get.fasta
### Keywords: fasta

### ** Examples



if (check.binary("bedtools")) {

## Not run: 
##D 
##D   # get the sequence for a set of regions as a data.frame
##D   index <- get.example.regions();
##D   a <- index[[1]];
##D   b <- get.fasta(bedr.sort.region(a));
##D 
##D   # this time output a fasta
##D   d <- get.fasta(b, output.fasta = TRUE);
##D   writeLines(d[[1]], con = "test.fasta");
##D 
##D   # get the region adjacent to a set of mutations in a vcf
##D   clinvar.vcf.example <- system.file(
##D     "extdata/clinvar_dbSNP138_example.vcf.gz", 
##D     package = "bedr"
##D     );
##D   clinvar <- read.vcf(clinvar.vcf.example);
##D 
##D   # note that clinvar uses ncbi fasta which does not use "chr" and codes chrM as MT
##D   clinvar.bed <- data.frame(
##D     chr = paste0("chr", gsub("MT", "M", clinvar$vcf$CHROM)),
##D     start = clinvar$vcf$POS - 2,
##D     end = clinvar$vcf$POS + 1,
##D     stringsAsFactors = FALSE
##D     );
##D 
##D   # get trinucleotide sequences of variants on chr M only
##D   mutation.triplet <- get.fasta(
##D   	clinvar.bed[which(clinvar.bed$chr == "chrM"), ], 
##D   	fasta = system.file("extdata/ucsc.hg19.chrM.fasta", package = "bedr"),
##D   	check.chr = FALSE
##D   	);
##D   
## End(Not run)
}



