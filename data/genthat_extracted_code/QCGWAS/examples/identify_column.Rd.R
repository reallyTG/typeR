library(QCGWAS)


### Name: identify_column
### Title: Identify non-standard column names
### Aliases: identify_column

### ** Examples

  sample_data <-
    data.frame(SNP = paste("rs", 1:10, sep = ""),
               chrom = 2,
               effect = 1:10/10,
               misc = NA)
  sample_header <- toupper(names(sample_data))


  alt_headers <-
    data.frame(
      standard = c("MARKER", "MARKER", "CHR", "CHR"),
      alternative = c("MARKER", "SNP", "CHR", "CHROM"),
      stringsAsFactors = FALSE)
  
  identify_column(std_name = "EFFECT", alt_names = alt_headers,
                  header = sample_header)
  identify_column(std_name = "MARKER", alt_names = alt_headers,
                  header = sample_header)
  identify_column(std_name = "CHR", alt_names = alt_headers,
                  header = sample_header)
  identify_column(std_name = "MISC", alt_names = alt_headers,
                  header = sample_header)



