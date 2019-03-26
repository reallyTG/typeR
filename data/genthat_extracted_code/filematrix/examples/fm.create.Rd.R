library(filematrix)


### Name: fm.create
### Title: Functions to Create a New, or Open an Existing Filematrix
### Aliases: fm.create fm.create.from.matrix fm.open fm.load
###   fm.create.from.text.file close,filematrix-method closeAndDeleteFiles

### ** Examples

# Create a 10x10 matrix
fm = fm.create(filenamebase=tempfile(), nrow=10, ncol=10)

# Change values in the top 3x3 corner
fm[1:3,1:3] = 1:9

# View the values in the top 4x4 corner
fm[1:4,1:4]

# Close and delete the filematrix
closeAndDeleteFiles(fm)



