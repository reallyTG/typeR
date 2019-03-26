library(detector)


### Name: detect
### Title: Detect if a data object contains PII.
### Aliases: detect detect.character detect.data.frame detect.default

### ** Examples

# atomic vectors
detect(letters)
detect(1:10)
detect(as.Date("2014-01-01"))

# data.frames
detect(mtcars)



