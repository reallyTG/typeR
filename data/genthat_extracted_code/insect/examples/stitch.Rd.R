library(insect)


### Name: stitch
### Title: Paired-end read stitching.
### Aliases: stitch

### ** Examples

## No test: 
  ## download and extract example FASTQ file to temporary directory
  td <- tempdir()
  URL <- "https://www.dropbox.com/s/71ixehy8e51etdd/insect_tutorial1_files.zip?dl=1"
  dest <- paste0(td, "/insect_tutorial1_files.zip")
  download.file(URL, destfile = dest, mode = "wb")
  unzip(dest, exdir = td)
  x <- readFASTQ(paste0(td, "/COI_sample1_read1.fastq"), bin = FALSE)
  y <- readFASTQ(paste0(td, "/COI_sample1_read2.fastq"), bin = FALSE)
  z <- stitch(x, y)
  z[1]
  attr(z, "quality")[1]
## End(No test)



