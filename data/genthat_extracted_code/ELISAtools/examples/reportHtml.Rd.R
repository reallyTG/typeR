library(ELISAtools)


### Name: reportHtml
### Title: Report ELISA data in HTML format.
### Aliases: reportHtml

### ** Examples

#R code to run 5-parameter logistic regression on ELISA data
#load the library
library(ELISAtools)

##
#get file folder
dir_file<-system.file("extdata", package="ELISAtools")

batches<-loadData(file.path(dir_file,"design.txt"))


#----IMPORTANT-----
#please make sure you have the write permission to save the html report
reportHtml(batches,file.dir=tempdir());




