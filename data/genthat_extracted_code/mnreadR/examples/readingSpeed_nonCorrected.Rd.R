library(mnreadR)


### Name: readingSpeed_nonCorrected
### Title: Reading speed calculation not corrected for the number of errors
### Aliases: readingSpeed_nonCorrected

### ** Examples

# inspect the strucutre of the dataframe
head(data_low_vision, 10)

# run the reading speed calculation
data_low_vision_new <- readingSpeed_nonCorrected(data_low_vision, rt)

# inspect the structure of the newly created dataframe
head(data_low_vision_new, 10)




