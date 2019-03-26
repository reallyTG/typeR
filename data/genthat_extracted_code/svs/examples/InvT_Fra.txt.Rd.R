library(svs)


### Name: InvT_Fra.txt
### Title: Seventeen Dutch Target Words and their French Source Words
### Aliases: InvT_Fra.txt

### ** Examples

InvT_Fra <- read.table(system.file("extdata", "InvT_Fra.txt",package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.InvT_Fra <- fast_sca(InvT_Fra)
sca.InvT_Fra
lsa.InvT_Fra <- fast_lsa(InvT_Fra)
lsa.InvT_Fra



