library(insect)


### Name: qfilter
### Title: Quality filtering for amplicon sequences.
### Aliases: qfilter

### ** Examples

## No test: 
  ## download and extract example FASTQ file to temporary directory
  td <- tempdir()
  URL <- "https://www.dropbox.com/s/71ixehy8e51etdd/insect_tutorial1_files.zip?dl=1"
  dest <- paste0(td, "/insect_tutorial1_files.zip")
  download.file(URL, destfile = dest, mode = "wb")
  unzip(dest, exdir = td)
  x <- readFASTQ(paste0(td, "/COI_sample2.fastq"))
  ## trim primers from sequences
  mlCOIintF <- "GGWACWGGWTGAACWGTWTAYCCYCC"
  jgHCO2198 <- "TAIACYTCIGGRTGICCRAARAAYCA"
  x <- trim(x, up = mlCOIintF, down = jgHCO2198)
  ## filter sequences to remove singletons, low quality & short/long reads
  x <- qfilter(x, minlength = 250, maxlength = 350)
 
## End(No test)



