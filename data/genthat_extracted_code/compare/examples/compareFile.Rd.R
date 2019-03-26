library(compare)


### Name: compareFile
### Title: Compare Several Objects
### Aliases: compareFile compareFiles
### Keywords: utilities logic

### ** Examples

modelNames <- c("id", "age", 
                "edu", "class", 
                "IndianMothers")
compareFile(system.file("example", "student1.R", package="compare"),
            modelNames,
            system.file("example", "model.R", package="compare"))



