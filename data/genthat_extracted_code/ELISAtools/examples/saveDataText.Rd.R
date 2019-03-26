library(ELISAtools)


### Name: saveDataText
### Title: Save elisa_batch analysis results
### Aliases: saveDataText

### ** Examples

#'#R code to run 5-parameter logistic regression on ELISA data
#load the library
library(ELISAtools)

#get file folder
dir_file<-system.file("extdata", package="ELISAtools")

batches<-loadData(file.path(dir_file,"design.txt"))

#make a guess for the parameters, the other two parameters a and d 
#will be estimated based on data.
model<-"5pl"
pars<-c(7.2,0.5, 0.015) #5pl inits
names(pars)<-c("xmid", "scal", "g")


#do fitting. model will be written into data set.
batches<-runFit(pars=pars,  batches=batches, refBatch.ID=1, model=model  )

#now call to do predications based on the model.
batches<-predictAll(batches);

#now saving the data in text.
saveDataText(batches, file.path(tempdir(),"elisa_data.txt"));





