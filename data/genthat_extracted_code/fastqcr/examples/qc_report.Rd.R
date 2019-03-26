library(fastqcr)


### Name: qc_report
### Title: Build a QC Report
### Aliases: qc_report

### ** Examples

## Not run: 
##D # Demo QC Directory
##D qc.path <- system.file("fastqc_results", package = "fastqcr")
##D qc.path
##D 
##D # List of files in the directory
##D list.files(qc.path)
##D 
##D # Multi QC report
##D qc_report(qc.path, result.file = "~/Desktop/result")
##D 
##D # QC Report of one sample with plot interpretation
##D  qc.file <- system.file("fastqc_results", "S1_fastqc.zip", package = "fastqcr")
##D  qc_report(qc.file, result.file = "~/Desktop/result",
##D    interpret = TRUE)
## End(Not run)




