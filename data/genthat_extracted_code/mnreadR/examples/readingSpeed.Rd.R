library(mnreadR)


### Name: readingSpeed
### Title: Reading speed calculation corrected for the number of errors
### Aliases: readingSpeed

### ** Examples

# inspect the strucutre of the dataframe
head(data_low_vision, 10)

# run the reading speed calculation
data_low_vision_new <- readingSpeed(data_low_vision, rt, err)

# inspect the structure of the newly created dataframe
head(data_low_vision_new, 10)




