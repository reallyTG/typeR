library(questionr)


### Name: freq.na
### Title: Generate frequency table of missing values.
### Aliases: freq.na

### ** Examples

data(hdv2003)
## Examine a single vector.
freq.na(hdv2003$qualif)
## Examine a data frame.
freq.na(hdv2003)
## Examine several variables.
freq.na(hdv2003, "nivetud", "trav.satisf")
## To see only variables with the most number of missing values
head(freq.na(hdv2003))



