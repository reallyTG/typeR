library(svs)


### Name: InvT_Eng.txt
### Title: Seventeen Dutch Target Words and their English Source Words
### Aliases: InvT_Eng.txt

### ** Examples

InvT_Eng <- read.table(system.file("extdata", "InvT_Eng.txt",package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.InvT_Eng <- fast_sca(InvT_Eng)
sca.InvT_Eng
lsa.InvT_Eng <- fast_lsa(InvT_Eng)
lsa.InvT_Eng



