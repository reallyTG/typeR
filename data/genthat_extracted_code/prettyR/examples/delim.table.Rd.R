library(prettyR)


### Name: delim.table
### Title: Format a 2D table
### Aliases: delim.table
### Keywords: misc

### ** Examples

 testdf<-data.frame(a=sample(0:1,100,TRUE),b=rnorm(100),c=rnorm(100))
 testglm<-summary(glm(a~b*c,testdf,family="binomial"))
 # produce a CSV file to import into a spreadsheet, just the coefficients
 delim.table(testglm$coefficients,"testglm.csv")
 # now create an HTML file of the three tables in the result
 # add a background color different from the default
 delim.table(testglm,"testglm.html",header="<html><body bgcolor=\"#ffaaff\">",
  html=TRUE)
 # these tables can be pasted into a word processor and converted
 # using "Insert|Table" or similar commands
 delim.table(testglm,"testglm.tab",delim="\t",leading.delim=FALSE)
 # to clean up, delete the files "testglm.csv", "testglm.tab" and "testglm.html"



