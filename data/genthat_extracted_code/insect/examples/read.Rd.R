library(insect)


### Name: read
### Title: Read FASTA and FASTQ files.
### Aliases: read readFASTQ readFASTA

### ** Examples

## No test: 
  ## download and extract example FASTQ file to temporary directory
  td <- tempdir()
  URL <- "https://www.dropbox.com/s/71ixehy8e51etdd/insect_tutorial1_files.zip?dl=1"
  dest <- paste0(td, "/insect_tutorial1_files.zip")
  download.file(URL, destfile = dest, mode = "wb")
  unzip(dest, exdir = td)
  x <- readFASTQ(paste0(td, "/COI_sample2.fastq"))
 
## End(No test)



