library(psych)


### Name: read.file
### Title: Shortcuts for reading from the clipboard or a file
### Aliases: read.clipboard read.clipboard.csv read.clipboard.tab
###   read.clipboard.lower read.clipboard.upper read.clipboard.fwf
###   read.file read.file.csv write.file write.file.csv read.https
### Keywords: multivariate IO

### ** Examples

#Because these are dynamic functions, they need to be run interactively and 
# can not be shown as examples.

#my.data <- read.file()   #search the directory for a file and then read it. 
#or, if the file is a rda, etc. file
#read.file()  #without assigning a value.

#filesList()  #search the system for a particular file and then list all the files in that directory
#fileCreate() #search for a particular directory and create a file there.

#the example data set from read.delim in the readr package to read a remote csv file
#my.data  <-read.file("https://github.com/tidyverse/readr/raw/master/inst/extdata/mtcars.csv")
#my.data <- read.clipboad()
#my.data <- read.clipboard.csv()
#my.data <- read.clipboad(header=FALSE)
#my.matrix <- read.clipboard.lower()



