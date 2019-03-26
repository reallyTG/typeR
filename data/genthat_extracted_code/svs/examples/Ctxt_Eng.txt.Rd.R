library(svs)


### Name: Ctxt_Eng.txt
### Title: Context Words for seventeen Dutch Words Translated from French
### Aliases: Ctxt_Eng.txt

### ** Examples

Ctxt_Eng <- read.table(system.file("extdata", "Ctxt_Eng.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.Ctxt_Eng <- fast_sca(data.matrix(Ctxt_Eng))
sca.Ctxt_Eng
lsa.Ctxt_Eng <- fast_lsa(data.matrix(Ctxt_Eng))
lsa.Ctxt_Eng



