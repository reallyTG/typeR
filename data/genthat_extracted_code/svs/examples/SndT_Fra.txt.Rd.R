library(svs)


### Name: SndT_Fra.txt
### Title: Seventeen Dutch Source Words and their French Translations
### Aliases: SndT_Fra.txt

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt",package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.SndT_Fra <- fast_sca(SndT_Fra)
sca.SndT_Fra
lsa.SndT_Fra <- fast_lsa(SndT_Fra)
lsa.SndT_Fra



