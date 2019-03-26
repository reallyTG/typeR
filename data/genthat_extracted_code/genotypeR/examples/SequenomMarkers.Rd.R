library(genotypeR)


### Name: SequenomMarkers
### Title: R wrapper script to run Sequenom Marker design pipeline
### Aliases: SequenomMarkers
### Keywords: SequenomMarker

### ** Examples


## Not run: 
##D example_files <- system.file("SequenomMarkers_v2/two_sample/test_files", package = "genotypeR")
##D 
##D vcf1 <- paste(example_files, "Sample1.vcf", sep="/")
##D vcf2 <- paste(example_files, "Sample2.vcf", sep="/")
##D 
##D ##look in outdir to look at the results in Master_SNPs.sorted.txt.
##D outdir <- paste(example_files, "test_dir", sep="/")
##D 
##D SequenomMarkers(vcf1, vcf2, outdir, platform="sq")
##D 
## End(Not run)




