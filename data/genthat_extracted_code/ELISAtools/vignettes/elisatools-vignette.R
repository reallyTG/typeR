## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = FALSE,
  comment = "#>",
  tidy=FALSE,
  engine='R'
)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("ELISAtools")

## ---- eval=T-------------------------------------------------------------
    library(ELISAtools)

## ------------------------------------------------------------------------
dir_file<-system.file("extdata", package="ELISAtools")
tbl.design<-read.table(file.path(dir_file,"design.txt"), header=T,sep="\t")
print(tbl.design)	   

## ------------------------------------------------------------------------
system.file("extdata", package="ELISAtools");

## ----chunk1, fig.show='asis', fig.cap="\\label{fig:chunk1}Raw batch data"----
dir_file<-system.file("extdata", package="ELISAtools")
  
batches<-loadData(file.path(dir_file,"design.txt"))
  
#batch data object
names(batches)
length(batches)
  
#visualize the raw day without analyses
plotAlignData(batches);

## ----chunk2--------------------------------------------------------------
#make a guess for the initial value of the parameters, 
#the other two parameters a and d will be estimated based on data. 
#Sometimes it is important to make the initial values 
#closed to the true ones 
pars<-c(7.2,0.05, 0.015)
names(pars)<-c("xmid", "scal", "g")
  
#do fitting. model will be written into data set.
batches<-runFit(pars=pars,  batches=batches, refBatch.ID=1  )
  
#now call to do predications based on the model.
batches<-predictAll(batches);

## ----chunk3, fig.show='asis', fig.cap="\\label{fig:chunk3}Batch 1 ELISA data with 5-parameter fitting (no S factor adjustment)"----
#plotting batch 1 data for visualizing
plotBatchData(batches[[1]])

## ----chunk4, fig.show='asis', fig.cap="\\label{fig:chunk4} ELISA batch data with 5-parameter fitting and S factor adjustment"----
#plotting batch data with adjustment for visualizing
plotAlignData(batches)

## ---- eval=F-------------------------------------------------------------
#  #save the batch data with fitting results and S factors
#  fn<-file.path(tempdir(),"batchAnalysis.txt");
#  saveDataText(batches, fn);

## ----eval=F--------------------------------------------------------------
#  #reporting. need to specify a directory that is writable!!!
#  reportHtml(batches, file.dir=tempdir())

## ----eval=F--------------------------------------------------------------
#    #now saving the combine data.
#    saveDB(batches, file.path(tempdir(),"elisa_tool1.rds"));
#    batches.old<-loadDB(file.path(tempdir(), "elisa_tool1.rds"));

## ---- eval=F-------------------------------------------------------------
#    #now suppose want to join/combine the two batches, old and new
#    batches.com<-combineData(batches.old, batches);
#    reportHtml(batches.com,file.dir=tempdir())

## ------------------------------------------------------------------------
  sessionInfo()

