library(compare)


### Name: sourceFile
### Title: Evaluate R Code from a File
### Aliases: sourceFile
### Keywords: utilities logic

### ** Examples

modelNames <- c("id", "age", 
                "edu", "class", 
                "IndianMothers")
sourceFile(system.file("example", "student1.R", package="compare"),
           modelNames)



