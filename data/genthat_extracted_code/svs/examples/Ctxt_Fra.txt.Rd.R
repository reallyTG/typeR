library(svs)


### Name: Ctxt_Fra.txt
### Title: Context Words for seventeen Dutch Words Translated from French
### Aliases: Ctxt_Fra.txt

### ** Examples

Ctxt_Fra <- read.table(system.file("extdata", "Ctxt_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.Ctxt_Fra <- fast_sca(data.matrix(Ctxt_Fra))
sca.Ctxt_Fra
lsa.Ctxt_Fra <- fast_lsa(data.matrix(Ctxt_Fra))
lsa.Ctxt_Fra



