library(UPMASK)


### Name: analyse_randomKde2d_smart
### Title: Perform analysis of random 2d distributions
### Aliases: analyse_randomKde2d_smart
### Keywords: utilities

### ** Examples

# Create the smart look-up table
library(RSQLite)
stcon <- create_smartTable()

# Runs the analysis on random fields
system.time(
toyRes1 <- analyse_randomKde2d_smart(300, 200, 100, 100, smartTableDB=stcon)) # slow
system.time(
toyRes2 <- analyse_randomKde2d_smart(300, 200, 100, 100, smartTableDB=stcon)) # quick

# Clean the environment
rm(list=c("toyRes1", "toyRes2"))
dbDisconnect(stcon)



