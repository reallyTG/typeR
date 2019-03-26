library(ahp)


### Name: Load
### Title: Load an ahp model from file
### Aliases: Load LoadString

### ** Examples

ahpFile <- system.file("extdata", "car.ahp", package="ahp")

#look at a sample file
cat(readChar(ahpFile, file.info(ahpFile)$size))

#load the file into R
carAhp <- Load(ahpFile)




