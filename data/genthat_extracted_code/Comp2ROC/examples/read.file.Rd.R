library(Comp2ROC)


### Name: read.file
### Title: Read data from file
### Aliases: read.file
### Keywords: Read Data File

### ** Examples

# This is a simple example how to read a file:
## No test: 
data.filename = "zhang.csv"
modality1DataColumn = "modality1"
modality2DataColumn = "modality2"
modality2StatusHeader = "status"  # if different from modality1's header
                                  # (a.k.a they are independent)
zhang = read.file(data.filename, TRUE, ";", ".", modality1, TRUE, modality2, TRUE, "status")
## End(No test)



