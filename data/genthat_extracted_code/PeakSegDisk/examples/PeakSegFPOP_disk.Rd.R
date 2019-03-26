library(PeakSegDisk)


### Name: PeakSegFPOP_disk
### Title: PeakSegFPOP on disk
### Aliases: PeakSegFPOP_disk

### ** Examples






library(PeakSegDisk)


r <- function(chrom, chromStart, chromEnd, coverage){


  data.frame(chrom, chromStart, chromEnd, coverage)


}


four <- rbind(


  r("chr1", 0, 10,  2),


  r("chr1", 10, 20, 10),


  r("chr1", 20, 30, 14),


  r("chr1", 30, 40, 13))


write.table(


  four, tmp <- tempfile(),


  sep="\t", row.names=FALSE, col.names=FALSE)


names.list <- PeakSegFPOP_disk(tmp, "10.5")


unlink(names.list$db)


seg.df <- read.table(names.list$segments)


names(seg.df) <- col.name.list$segments


seg.df


loss.df <- read.table(names.list$loss)


names(loss.df) <- col.name.list$loss


loss.df








