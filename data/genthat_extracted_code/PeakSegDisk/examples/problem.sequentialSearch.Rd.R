library(PeakSegDisk)


### Name: problem.sequentialSearch
### Title: problem sequentialSearch
### Aliases: problem.sequentialSearch

### ** Examples






## Create simple 6 point data set discussed in supplementary


## materials. GFPOP/GPDPA computes up-down model with 2 peaks, but


## neither CDPA (PeakSegDP::cDPA) nor PDPA (jointseg)


r <- function(chrom, chromStart, chromEnd, coverage){


  data.frame(chrom, chromStart, chromEnd, coverage)


}


supp <- rbind(


  r("chr1", 0, 1,  3),


  r("chr1", 1, 2, 9),


  r("chr1", 2, 3, 18),


  r("chr1", 3, 4, 15),


  r("chr1", 4, 5, 20),


  r("chr1", 5, 6, 2)


)


data.dir <- file.path(tempfile(), "chr1-0-6")


dir.create(data.dir, recursive=TRUE)


write.table(


  supp, file.path(data.dir, "coverage.bedGraph"),


  sep="\t", row.names=FALSE, col.names=FALSE)





## Compute optimal up-down model with 2 peaks via sequential search.


fit <- PeakSegDisk::problem.sequentialSearch(data.dir, 2L)





library(ggplot2)


ggplot()+


  theme_bw()+


  geom_point(aes(


    chromEnd, coverage),


    data=supp)+


  geom_segment(aes(


    chromStart+0.5, mean,


    xend=chromEnd+0.5, yend=mean),


    data=fit$segments,


    color="green")








