## ----setup, echo=FALSE---------------------------------------------------
library(knitr)
# opts_knit$set(root.dir=tempdir())

## ----eval=FALSE----------------------------------------------------------
#  library(filematrix)
#  fm = fm.create(
#          filenamebase = "big_fm",
#          nrow = 1e5,
#          ncol = 1e5)
#  
#  tic = proc.time()
#  for( i in seq_len(ncol(fm)) ) {
#      message(i, " of ", ncol(fm))
#      fm[,i] = i + 1:nrow(fm)
#  }
#  toc = proc.time()
#  show(toc-tic)
#  
#  # Cleanup
#  
#  closeAndDeleteFiles(fm)

## ----eval=FALSE----------------------------------------------------------
#  library(bigmemory)
#  fm = filebacked.big.matrix(
#          nrow = 1e5,
#          ncol = 1e5,
#          type = "double",
#          backingfile = "big_bm.bmat",
#          backingpath = "./",
#          descriptorfile = "big_bm.desc.txt")
#  
#  tic = proc.time()
#  for( i in seq_len(ncol(fm)) ) {
#      message(i, " of ", ncol(fm))
#      fm[,i] = i + 1:nrow(fm)
#  }
#  flush(fm)
#  toc = proc.time()
#  show(toc-tic)
#  
#  # Cleanup
#  
#  rm(fm)
#  gc()
#  unlink("big_bm.bmat")
#  unlink("big_bm.desc.txt")

