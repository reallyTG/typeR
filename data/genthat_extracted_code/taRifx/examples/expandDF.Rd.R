library(taRifx)


### Name: expandDF
### Title: Functions to manipulate data frames
### Aliases: expandDF splitDF unsplitDF

### ** Examples

library(datasets)
# Duplicate a dataset
expandDF(sleep,TRUE)
# Expand the final observation
expandDF(sleep,nrow(sleep),numtimes=10)
# Split a data.frame by group
s.df <- splitDF(sleep,'group')
s.df
# Reconstitute original data.frame
unsplitDF(s.df)



