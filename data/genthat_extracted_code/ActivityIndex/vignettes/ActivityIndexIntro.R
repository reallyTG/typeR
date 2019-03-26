## ----"setup",echo=FALSE,cache=FALSE,warning=FALSE,message=FALSE----
library(ActivityIndex)
library(knitr)
options(width=52,scipen=1,digits=5)
opts_chunk$set(tidy=TRUE)

## ----"AccessCSV",echo=TRUE,eval=FALSE-------------
#  system.file("extdata","sample_GT3X+.csv.gz",package="ActivityIndex")
#  system.file("extdata","sample_table.csv.gz",package="ActivityIndex")

## ----"GT3X+_CSV",echo=FALSE,eval=TRUE-------------
fname = system.file("extdata", "sample_GT3X+.csv.gz", package = "ActivityIndex")
unzipped = R.utils::gunzip(fname, temporary = TRUE, remove = FALSE,
                           overwrite = TRUE)
cat(readLines(unzipped, n = 15), sep = "\n")

## ----"Table_CSV",echo=FALSE,eval=TRUE-------------
fname = system.file("extdata", "sample_table.csv.gz", package = "ActivityIndex")
unzipped = R.utils::gunzip(fname,
                           temporary = TRUE,
                           remove = FALSE,
                           overwrite = TRUE)
cat(readLines(unzipped, n = 5), sep = "\n")

## ----"ReadData",echo=TRUE,warning=FALSE,message=FALSE----
sampleGT3XPlus=ReadGT3XPlus(system.file("extdata","sample_GT3X+.csv.gz",package="ActivityIndex"))
sampleTable=ReadTable(system.file("extdata", "sample_table.csv.gz",package="ActivityIndex"))

## ----"str_sampleGT3XPlus",echo=TRUE,eval=TRUE-----
str(sampleGT3XPlus)

## ----"head_sampleTable",echo=TRUE,eval=TRUE-------
head(sampleTable,n=6)

## ----"computeAI_syntax",echo=TRUE,eval=FALSE------
#  computeActivityIndex(x, x_sigma0 = NULL, sigma0 = NULL, epoch = 1, hertz)

## ----"computeAI_onthefly",echo=TRUE,eval=TRUE-----
AI_sampleTable_x=computeActivityIndex(sampleTable, x_sigma0=sampleTable[1004700:1005600,], epoch=1, hertz=30)
AI_sampleGT3XPlus_x=computeActivityIndex(sampleGT3XPlus, x_sigma0=sampleTable[1004700:1005600,], epoch=1, hertz=30)

## ----"compute_sigma0",echo=TRUE,eval=TRUE---------
sample_sigma0=Sigma0(sampleTable[1004700:1005600,],hertz=30)

## ----"computeAI_beforehand",echo=TRUE,eval=TRUE----
AI_sampleTable=computeActivityIndex(sampleTable, sigma0=sample_sigma0, epoch=1, hertz=30)
AI_sampleGT3XPlus=computeActivityIndex(sampleGT3XPlus, sigma0=sample_sigma0, epoch=1, hertz=30)

## ----"head_AI",echo=TRUE,eval=TRUE----------------
head(AI_sampleGT3XPlus,n=10)

## ----"computeAI_minute",echo=TRUE,eval=TRUE-------
AI_sampleTable_min=computeActivityIndex(sampleTable, sigma0=sample_sigma0, epoch=60, hertz=30)
AI_sampleGT3XPlus_min=computeActivityIndex(sampleGT3XPlus, sigma0=sample_sigma0, epoch=60, hertz=30)

## ----"head_AI_min",echo=TRUE,eval=TRUE------------
head(AI_sampleGT3XPlus_min)

