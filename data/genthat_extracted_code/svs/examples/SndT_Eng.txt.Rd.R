library(svs)


### Name: SndT_Eng.txt
### Title: Seventeen Dutch Source Words and their English Translations
### Aliases: SndT_Eng.txt

### ** Examples

SndT_Eng <- read.table(system.file("extdata", "SndT_Eng.txt",package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.SndT_Eng <- fast_sca(SndT_Eng)
sca.SndT_Eng
lsa.SndT_Eng <- fast_lsa(SndT_Eng)
lsa.SndT_Eng



