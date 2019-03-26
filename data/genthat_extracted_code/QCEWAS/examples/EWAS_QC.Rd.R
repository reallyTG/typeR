library(QCEWAS)


### Name: EWAS_QC
### Title: Automated Quality Control of EWAS results files
### Aliases: EWAS_QC

### ** Examples

# For use in this example, the 2 sample files in the
# extdata folder of the QCEWAS library will be copied
# to your current R working directory. Running the QC
# generates 7 new files in your working directory:
# a cleaned, post-QC dataset, a log file, and 5 graphs.
# Consult the Quick-Start guide for more information on
# how to interpret these.

file.copy(from = file.path(system.file("extdata", package = "QCEWAS"),
                           "sample_map.txt.gz"),
          to = getwd(), overwrite = FALSE, recursive = FALSE)
file.copy(from = file.path(system.file("extdata", package = "QCEWAS"),
                           "sample1.txt.gz"),
          to = getwd(), overwrite = FALSE, recursive = FALSE)

QC_results <- EWAS_QC(data = "sample1.txt.gz",
                      map = "sample_map.txt.gz",
                      outputname = "sample_output",
                      threshold_outliers = c(-20, 20),
                      exclude_outliers = FALSE,
                      exclude_X = TRUE, exclude_Y = FALSE,
                      save_final_dataset = TRUE, gzip_final_dataset = FALSE)




