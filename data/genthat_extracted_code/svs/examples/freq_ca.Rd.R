library(svs)


### Name: freq_ca
### Title: Compute Level Frequencies (for a Factor)
### Aliases: freq_ca

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
freq_ca(SndT_Fra)



