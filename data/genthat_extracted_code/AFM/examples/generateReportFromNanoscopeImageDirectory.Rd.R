library(AFM)


### Name: generateReportFromNanoscopeImageDirectory
### Title: Generate a pdf report for all AFM images in a directory
### Aliases: generateReportFromNanoscopeImageDirectory

### ** Examples

library(AFM)
# A report will be generated for all the images in imageDirectory directory
# imageDirectory="c:/images"
imageDirectory=tempdir()
exit<-generateReportFromNanoscopeImageDirectory(imageDirectory)

# A report will be generated for the fifth image in the imageDirectory directory
exit<-generateReportFromNanoscopeImageDirectory(imageDirectory,5)



