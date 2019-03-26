library(nanostringr)


### Name: rcc
### Title: Read NanoString RCC files
### Aliases: rcc read_rcc parse_counts parse_attributes

### ** Examples

rcc_file <- system.file("extdata", "example.RCC", package = "nanostringr")
parse_counts(rcc_file)
parse_attributes(rcc_file)



