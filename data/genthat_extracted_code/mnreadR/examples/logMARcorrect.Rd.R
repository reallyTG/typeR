library(mnreadR)


### Name: logMARcorrect
### Title: Print size correction for non-standard viewing distance
### Aliases: logMARcorrect

### ** Examples

# inspect the strucutre of the dataframe
head(data_low_vision, 10)

# run the correction
data_low_vision_new <- logMARcorrect(data_low_vision, ps, vd)

# inspect the structure of the newly created dataframe
head(data_low_vision_new, 10)




