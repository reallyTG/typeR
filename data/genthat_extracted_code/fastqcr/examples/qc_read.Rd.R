library(fastqcr)


### Name: qc_read
### Title: Read FastQC Data
### Aliases: qc_read

### ** Examples

# Demo file
qc.file <- system.file("fastqc_results", "S1_fastqc.zip",  package = "fastqcr")
qc.file
# Read all modules
qc_read(qc.file)

# Read a specified module
qc_read(qc.file,"Per base sequence quality")




