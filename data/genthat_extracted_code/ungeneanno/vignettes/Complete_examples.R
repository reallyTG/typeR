## ---- echo = FALSE, message = FALSE--------------------------------------
library(ungeneanno)

## ------------------------------------------------------------------------
  f <- matrix(c("1","BRAF.exp","1","BRCA2.mut","2","BRAF.cnv","2","AURKB.mut","2","PTEN.exp")
              ,ncol=2,byrow=TRUE)
  f

## ------------------------------------------------------------------------
   geneanno <- getUniqueGeneList(geneanno(),f)
   geneanno@genelist
   geneanno@groupnos

