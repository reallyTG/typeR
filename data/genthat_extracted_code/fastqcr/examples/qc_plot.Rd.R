library(fastqcr)


### Name: qc_plot
### Title: Plot FastQC Results
### Aliases: qc_plot print.qctable

### ** Examples

# Demo file
qc.file <- system.file("fastqc_results", "S1_fastqc.zip",  package = "fastqcr")
qc.file
# Read all modules
qc <- qc_read(qc.file)

# Plot per sequence GC content
qc_plot(qc, "Per sequence GC content")

# Per base sequence quality
qc_plot(qc, "Per base sequence quality")

# Per sequence quality scores
qc_plot(qc, "Per sequence quality scores")

# Per base sequence content
qc_plot(qc, "Per base sequence content")

# Sequence duplication levels
qc_plot(qc, "Sequence duplication levels")





