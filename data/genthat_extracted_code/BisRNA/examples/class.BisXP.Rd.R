library(BisRNA)


### Name: class.BisXP
### Title: Cast bisulfite experiment data into a BisXP object
### Aliases: class.BisXP

### ** Examples

 RNA     <- c("NM_00001","NM_00001","NM_00002")
 Cpos     <- as.integer(c(1,5,1))
 ncratio  <- c(0.1,0.5,0.3)
 pv.adj   <- c(0.001,0.1,0.3)
 BSdata   <- data.frame(RNA, Cpos, ncratio, pv.adj, stringsAsFactors = FALSE)
 bsXP     <- class.BisXP(BSdata)



