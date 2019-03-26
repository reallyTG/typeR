library(fastqcr)


### Name: qc_aggregate
### Title: Aggregate FastQC Reports for Multiple Samples
### Aliases: qc_aggregate summary.qc_aggregate qc_stats

### ** Examples

# Demo QC dir
qc.dir <- system.file("fastqc_results", package = "fastqcr")
qc.dir

# List of files in the directory
list.files(qc.dir)

# Aggregate the report
qc <- qc_aggregate(qc.dir, progressbar = FALSE)
qc

# Generates a summary of qc_aggregate
summary(qc)

# General statistics of fastqc reports.
qc_stats(qc)




