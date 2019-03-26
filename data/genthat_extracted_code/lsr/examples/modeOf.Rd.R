library(lsr)


### Name: modeOf
### Title: Sample mode
### Aliases: modeOf maxFreq

### ** Examples

# simple example
eyes <- c("green","green","brown","brown","blue")
modeOf(eyes)
maxFreq(eyes)

# vector with missing data
eyes <- c("green","green","brown","brown","blue",NA,NA,NA)

# returns NA as the modal value.
modeOf(eyes, na.rm = FALSE) 
maxFreq(eyes, na.rm = FALSE)

# returns c("green", "brown") as the modes, as before
modeOf(eyes, na.rm = TRUE) 
maxFreq(eyes, na.rm = TRUE)




