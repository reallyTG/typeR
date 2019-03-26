library(QCGWAS)


### Name: translate_header
### Title: Translate column names into standard names
### Aliases: translate_header

### ** Examples

  sample_data <-
    data.frame(SNP = paste("rs", 1:10, sep = ""),
               chrom = 2,
               effect = 1:10/10,
               misc = NA,
               stringsAsFactors = FALSE)
  # Creates a table with four columns:
  #   SNP, chrom, effect and misc.

  ( alt_headers <-
      data.frame(
        standard = c("MARKER", "MARKER", "CHR", "CHR"),
        alternative = c("MARKER", "SNP", "CHR", "CHROM"),
        stringsAsFactors = FALSE) )
  # Creates the translation table
  #  with the standard names in column 1 and the alternatives
  #  in column 2.
  
  ( header_info <- 
      translate_header(header = names(sample_data),
        standard = c("MARKER", "CHR", "EFFECT"),
        alternative = alt_headers)  )
        
  # Despite not being in the translation table, EFFECT is
  #  changed to uppercase because it is present in standard.
  #  misc is neither in standard or the translation table, so
  #  it is marked as unknown and left unchanged.

  names(sample_data) <- header_info$header_h



