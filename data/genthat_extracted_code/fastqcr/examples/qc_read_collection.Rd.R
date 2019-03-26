library(fastqcr)


### Name: qc_read_collection
### Title: Read a collection of FastQC data files
### Aliases: qc_read_collection

### ** Examples

# extract paths to the demo files
qc.dir <- system.file("fastqc_results", package = "fastqcr")
qc.files <- list.files(qc.dir, full.names = TRUE)

# read all modules in all files
qc <- qc_read_collection(qc.files, sample_names = paste('S', 1:5, sep = ''))


# read a specified module in all files
qc <- qc_read_collection(qc.files, 
    sample_names = paste('S', 1:5, sep = ''),
    modules = "Per base sequence quality")




