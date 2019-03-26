library(imputeTS)


### Name: statsNA
### Title: Print Statistics about Missing Values
### Aliases: statsNA

### ** Examples

#Example 1: Print stats about the missing data in tsNH4
statsNA(tsNH4)

#Example 2: Return list with stats about the missing data in tsAirgap
statsNA(tsAirgap, printOnly= FALSE)

#Example 3: Same as example 1, just written with pipe operator
tsNH4 %>% statsNA




