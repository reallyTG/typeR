library(bedr)


### Name: tabix
### Title: Main bedtools wrapper function.
### Aliases: tabix
### Keywords: bedtools bedops tabix region interval bed

### ** Examples

if (check.binary("tabix")) {
query.regions <- c("1:1000-100000", "1:1000000-1100000")
cosmic.vcf.example <- system.file(
	"extdata/CosmicCodingMuts_v66_20130725_ex.vcf.gz",
	package = "bedr"
	)
cosmic.query <- tabix(query.regions, cosmic.vcf.example, check.chr = FALSE)
}



