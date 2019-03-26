library(seqminer)


### Name: tabix.read
### Title: Read tabix file, similar to running tabix in command line.
### Aliases: tabix.read

### ** Examples

if (.Platform$endian == "little") {
  fileName = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")
  snp <- tabix.read(fileName, "1:196623337-196632470")
} else {
  message("Tabix does not work well for big endian for now")
}



