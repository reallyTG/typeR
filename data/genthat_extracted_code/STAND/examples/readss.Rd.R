library(STAND)


### Name: readss
### Title: Read Analyze Data From ASCII File
### Aliases: readss
### Keywords: manip

### ** Examples

# to demonstrate the use of readss add a new factor grp to the cansdata
# this factor with four levels (A_1 A_2 B_1 B_2) combines strata and sample
data(cansdata)
grp <- paste(cansdata$strata,cansdata$sample,sep="_")
temp <- data.frame(cansdata,grp) # add four level factor grp to cansdata

#    the next line is NOT executable  use CUT AND PASTE
#    sink("demoread.txt") ; print(temp) ; sink()

# The preceding line writes temp to a text file demoread.txt in the current folder
# This file would normally be created by another program, e.g. Excel
#   now use readss() to read this space delimited text file and calculate
#   all of the summary statistics for each level of grp and output
#   the results to a new text file demoreadout.csv in the current folder

#     rdemo <- readss("demoread",L=0.2,bcol=5)

#  rdemo is the R data frame that was used to calculate results in demoreadout.csv
#  to see same results rounded to three places in R console use
#  round( IH.summary(rdemo,L=0.2,bcol=5), 3)

#  To select a subset of statistics from IH.summary first define the subset
#  psel<-c("Xp.obs","Xp","Xp.UCL","f","f.UCL","Rsq","m","n")
#  entering the following command will overwrite demoreadout.csv
#  with rows and columns reversed and the subset of statistics as columns
#  and the results will be rounded to 4 places
#  rdemo <- readss("demoread",L=0.2,bcol=5,rto=4,pstat=psel,rev=TRUE)
#
#  to see same results rounded to three places in R console use
#  t(round( IH.summary(rdemo,L=0.2,bcol=5)[psel,], 3))



