library(QCGWAS)


### Name: switch_strand
### Title: Convert alleles to the opposing DNA strand
### Aliases: switch_strand

### ** Examples

  data("gwa_sample")

  switched_data <- gwa_sample[ , c("MARKER", "EFFECT_ALL",
                                   "OTHER_ALL", "STRAND")]
  switched_data[1:10, ]

  switched_data[ , 2:4] <- switch_strand(input =
            switched_data[ , 2:4], strand_col = TRUE)
  switched_data[1:10, ]



