library(QCEWAS)


### Name: translate_header
### Title: Translate column names into standard names
### Aliases: translate_header

### ** Examples

# For use in this example, the 2 sample files in the
# extdata folder of the QCEWAS library will be copied
# to your current R working directory

file.copy(from = file.path(system.file("extdata", package = "QCEWAS"),
                           "sample2.txt.gz"),
          to = getwd(), overwrite = FALSE, recursive = FALSE)
file.copy(from = file.path(system.file("extdata", package = "QCEWAS"),
                           "translation_table.txt"),
          to = getwd(), overwrite = FALSE, recursive = FALSE)

sample_ewas <- read.table("sample2.txt.gz", header = TRUE,
                          stringsAsFactors = FALSE, nrow = 10)
colnames(sample_ewas)


translation_table <- read.table("translation_table.txt", header = TRUE,
                                stringsAsFactors = FALSE)
sample_translation <- translate_header(header = colnames(sample_ewas),
                                       alternative = translation_table)
sample_translation                                         

colnames(sample_ewas) <- sample_translation$header_h

colnames(sample_ewas)




