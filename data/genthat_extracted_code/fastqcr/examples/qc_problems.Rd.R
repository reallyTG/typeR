library(fastqcr)


### Name: qc_fails
### Title: Inspect Problems in Aggregated FastQC Reports
### Aliases: qc_fails qc_warns qc_problems

### ** Examples

# Demo QC dir
qc.dir <- system.file("fastqc_results", package = "fastqcr")
qc.dir
# List of files in the directory
list.files(qc.dir)

# Aggregate the report
qc <- qc_aggregate(qc.dir, progressbar = FALSE)

# Display samples with failed modules
qc_fails(qc)
qc_fails(qc, compact = FALSE)

# Display samples with warned modules
qc_warns(qc)

# Module failed in the most samples
qc_fails(qc, "module")
qc_fails(qc, "module", compact = FALSE)

# Specify a module of interest
qc_problems(qc, "module",  name = "Per sequence GC content")




