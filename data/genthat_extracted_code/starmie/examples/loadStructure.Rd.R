library(starmie)


### Name: loadStructure
### Title: Read Structure Output
### Aliases: loadStructure

### ** Examples

# read in K = 10 Structure file (both out_f and log file)
k10_r1 <- system.file("extdata/microsat_testfiles", "locprior_K10.out_f", package = "starmie")
k10_log <- system.file("extdata/microsat_testfiles", "chain_K10.log", package = "starmie")
# no log
k10_data <- loadStructure(k10_r1)
k10_data
# with log
k10_data <- loadStructure(k10_r1, k10_log)
k10_data



