## ----"setup", include=FALSE----------------------------------------------
require("knitr")
opts_knit$set(root.dir = ".")

## ----load library--------------------------------------------------------
library(ISAT)

## ----demo----------------------------------------------------------------
      filename =c("DEMO_cell_seg_data.txt")
      cell_names = c( 'Melanoma','CD8 + T cell', 'CD4+ T cell', 'T regulatory cell','PDL1+ cell', 'CD3+ T cell','other')
#calculate distance result for the file
      distance_result = findNNs(filename,cell_names)
      
      
#calculate density result for the file
      density_result=getFileCount(filename)
      

