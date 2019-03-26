library(valr)


### Name: as.tbl_interval
### Title: Coerce objects to tbl_intervals.
### Aliases: as.tbl_interval as.tbl_interval.tbl_df
###   as.tbl_interval.data.frame as.tbl_interval.GRanges

### ** Examples

## Not run: 
##D gr <- GenomicRanges::GRanges(
##D         seqnames = S4Vectors::Rle(
##D                      c("chr1", "chr2", "chr1", "chr3"),
##D                      c(1, 1, 1, 1)),
##D         ranges   = IRanges::IRanges(
##D                      start = c(1, 10, 50, 100),
##D                      end = c(100, 500, 1000, 2000),
##D                      names = head(letters, 4)),
##D         strand   = S4Vectors::Rle(
##D                      c("-", "+"), c(2, 2))
##D       )
##D 
##D as.tbl_interval(gr)
##D 
##D # There are two ways to convert a tbl_interval to GRanges:
##D 
##D gr <- GenomicRanges::GRanges(
##D         seqnames = S4Vectors::Rle(x$chrom),
##D         ranges   = IRanges::IRanges(
##D                      start = x$start + 1,
##D                      end = x$end,
##D                      names = x$name),
##D         strand   = S4Vectors::Rle(x$strand)
##D         )
##D # or:
##D 
##D gr <- GenomicRanges::makeGRangesFromDataFrame(dplyr::mutate(x, start = start +1))
##D 
## End(Not run)




