library(BisRNA)


### Name: read.BisXP
### Title: Read RNA bisulfite experiment data and cast it into a BisXP
###   object
### Aliases: read.BisXP

### ** Examples

 RNAs     <- c("NM_00001","NM_00001","NM_00002")
 Cpos     <- c(1,5,1)
 ncratio  <- c(0.1,0.5,0.3)
 pv.adj   <- c(0.001,0.1,0.3)
 BSdata <- data.frame(RNAs, Cpos, ncratio, pv.adj)



