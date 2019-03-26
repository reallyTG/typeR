library(parsemsf)


### Name: quantitate
### Title: Combine technical replicates and quantitate proteins
### Aliases: quantitate

### ** Examples

quantitate(c(parsemsf_example("test_db.msf"),
             parsemsf_example("test_db2.msf")),
           relabel = c("NP_12345.1" = "NP_1000.1"))



