library(QCEWAS)


### Name: EWAS_series
### Title: Quality Control and Comparison of multiple EWAS results files
### Aliases: EWAS_series

### ** Examples

# For use in this example, the 4 sample files in the
# extdata folder of the QCEWAS library will be copied
# to your current R working directory. Running the QC
# generates several files in your working directory:
# consult the Quick-Start Guide for more information
# on how to interpret these.

file.copy(from = file.path(system.file("extdata", package = "QCEWAS"),
                           "sample_map.txt.gz"),
          to = getwd(), overwrite = FALSE, recursive = FALSE)
file.copy(from = file.path(system.file("extdata", package = "QCEWAS"),
                           "sample1.txt.gz"),
          to = getwd(), overwrite = FALSE, recursive = FALSE)
file.copy(from = file.path(system.file("extdata", package = "QCEWAS"),
                           "sample2.txt.gz"),
          to = getwd(), overwrite = FALSE, recursive = FALSE)
file.copy(from = file.path(system.file("extdata", package = "QCEWAS"),
                           "translation_table.txt"),
          to = getwd(), overwrite = FALSE, recursive = FALSE)

sample_list <- c("sample1.txt.gz", "sample2.txt.gz")
sample_N <- data.frame(file = sample_list,
                       N = c(77, 79),
                       stringsAsFactors = FALSE)
                       


QC_results <- EWAS_series(EWAS_files = sample_list,
                          output_files = c("sample_output1", "sample_output2"),
                          map = "sample_map.txt.gz",
                          N = sample_N,
                          header_translations = "translation_table.txt",
                          save_final_dataset = FALSE,
                          threshold_outliers = c(-20, 20),
                          exclude_outliers = FALSE,
                          exclude_X = TRUE, exclude_Y = FALSE)



