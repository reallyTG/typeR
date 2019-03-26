library(codyn)


### Name: rank_shift
### Title: Mean Rank Shifts
### Aliases: rank_shift

### ** Examples

 # Calculate mean rank shifts within replicates
 data(knz_001d)

 myoutput <- rank_shift(knz_001d,
                     time.var = "year",
                     species.var = "species",
                     abundance.var = "abundance",
                     replicate.var = "subplot")

 # Calculate mean rank shifts for a data frame with no replication

 myoutput_singlerep <- rank_shift(subset(knz_001d, subplot=="A_1"),
                           time.var = "year",
                           species.var = "species",
                           abundance.var = "abundance")



