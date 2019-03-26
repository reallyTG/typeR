library(tinyProject)


### Name: prWriteTable
### Title: Write data in an output text file
### Aliases: prWriteTable prWriteCsv prWriteCsv2

### ** Examples

projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

mydata <- data.frame(x = 1:10, y = rnorm(10))

prWriteTable(mydata)
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

# Write in a subdirectory of "output"
prWriteTable("mydir/mydata")
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)




