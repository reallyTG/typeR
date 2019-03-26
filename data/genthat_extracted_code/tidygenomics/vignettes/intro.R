## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(dplyr)
library(tidygenomics)

## ------------------------------------------------------------------------
x1 <- data.frame(id = 1:4, 
                chromosome = c("chr1", "chr1", "chr2", "chr2"),
                start = c(100, 200, 300, 400),
                end = c(150, 250, 350, 450))

x2 <- data.frame(id = 1:4,
                 chromosome = c("chr1", "chr2", "chr2", "chr1"),
                 start = c(140, 210, 400, 300),
                 end = c(160, 240, 415, 320))

genome_intersect(x1, x2, by=c("chromosome", "start", "end"), mode="both")

## ------------------------------------------------------------------------
x1 <- data.frame(id = 1:4,
                chromosome = c("chr1", "chr1", "chr2", "chr1"),
                start = c(100, 200, 300, 400),
                end = c(150, 250, 350, 450))

x2 <- data.frame(id = 1:4,
                chromosome = c("chr1", "chr2", "chr1", "chr1"),
                start = c(120, 210, 300, 400),
                end = c(125, 240, 320, 415))

genome_subtract(x1, x2, by=c("chromosome", "start", "end"))

## ------------------------------------------------------------------------
x1 <- data_frame(id = 1:4, 
                 chr = c("chr1", "chr1", "chr2", "chr3"),
                 start = c(100, 200, 300, 400),
                 end = c(150, 250, 350, 450))

x2 <- data_frame(id = 1:4,
                 chr = c("chr1", "chr1", "chr1", "chr2"),
                 start = c(220, 210, 300, 400),
                 end = c(225, 240, 320, 415))
genome_join_closest(x1, x2, by=c("chr", "start", "end"), distance_column_name="distance", mode="left")

## ------------------------------------------------------------------------
x1 <- data.frame(id = 1:4, bla=letters[1:4],
                chromosome = c("chr1", "chr1", "chr2", "chr1"),
                start = c(100, 120, 300, 260),
                end = c(150, 250, 350, 450))
genome_cluster(x1, by=c("chromosome", "start", "end"))
genome_cluster(x1, by=c("chromosome", "start", "end"), max_distance=10)

## ------------------------------------------------------------------------
x1 <- data.frame(id = 1:4,
                 chromosome = c("chr1", "chr1", "chr2", "chr1"),
                 start = c(100, 200, 300, 400),
                 end = c(150, 250, 350, 450))

genome_complement(x1, by=c("chromosome", "start", "end"))

## ------------------------------------------------------------------------
x1 <- data_frame(id = 1:4, 
                 chr = c("chr1", "chr1", "chr2", "chr3"),
                 start = c(100, 200, 300, 400),
                 end = c(150, 250, 350, 450))

x2 <- data_frame(id = 1:4,
                 chr = c("chr1", "chr1", "chr1", "chr2"),
                 start = c(220, 210, 300, 400),
                 end = c(225, 240, 320, 415))
fuzzyjoin::genome_join(x1, x2, by=c("chr", "start", "end"), mode="inner")

fuzzyjoin::genome_join(x1, x2, by=c("chr", "start", "end"), mode="left")

fuzzyjoin::genome_join(x1, x2, by=c("chr", "start", "end"), mode="anti")

