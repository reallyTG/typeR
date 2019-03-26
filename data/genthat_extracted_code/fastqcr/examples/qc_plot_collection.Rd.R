library(fastqcr)


### Name: qc_plot_collection
### Title: Plot FastQC Results of multiple samples
### Aliases: qc_plot_collection

### ** Examples

qc.dir <- system.file("fastqc_results", package = "fastqcr")
qc.files <- list.files(qc.dir, full.names = TRUE)

# read all modules in all files
qc <- qc_read_collection(qc.files, sample_names = paste('S', 1:5, sep = ''))

# Plot per sequence GC content
qc_plot_collection(qc, "Per sequence GC content")

# Per base sequence quality
qc_plot_collection(qc, "Per base sequence quality")

# Per sequence quality scores
qc_plot_collection(qc, "Per sequence quality scores")

# Per base sequence content
qc_plot_collection(qc, "Per base sequence content")

# Sequence duplication levels
qc_plot_collection(qc, "Sequence duplication levels")




