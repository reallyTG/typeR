## ---- eval = FALSE-------------------------------------------------------
#  # Metadata

## ---- results = "asis", echo = FALSE-------------------------------------
ind   <- c('ind_1','ind_1','ind_2','ind_2','ind_3')
time  <- c(0, 5, 0, 10, 5)
group <- c('group_A','group_A','group_B','group_B','group_A')
outputMeta <- data.frame(ind, time, group, stringsAsFactors = FALSE)
pander::pandoc.table(outputMeta)

## ---- eval = FALSE-------------------------------------------------------
#  # Data

## ---- results = "asis", echo = FALSE-------------------------------------
variable1  <- c(1,3.5, 4,9.5,5)
variable2  <- c(110.2, NaN, 79.1, 132.0, 528.3)
outputData <- data.frame(variable1, variable2, stringsAsFactors = FALSE)
pander::pandoc.table(outputData)

## ---- eval = FALSE-------------------------------------------------------
#  library(santaR)
#  
#  ## Metadata
#  # number of rows
#  nrow(acuteInflammation$meta)
#  # number of columns
#  ncol(acuteInflammation$meta)
#  # a subset
#  acuteInflammation$meta[12:20,]

## ---- results = "asis", echo = FALSE-------------------------------------
library(santaR)
nrow(acuteInflammation$meta)

## ---- results = "asis", echo = FALSE-------------------------------------
library(santaR)
ncol(acuteInflammation$meta)

## ---- results = "asis", echo = FALSE-------------------------------------
library(santaR)
pander::pandoc.table(acuteInflammation$meta[12:20,])

## ---- eval = FALSE-------------------------------------------------------
#  ## Data
#  # number of rows
#  nrow(acuteInflammation$data)
#  # number of columns
#  ncol(acuteInflammation$data)
#  # a subset
#  acuteInflammation$data[12:20,1:4]

## ---- results = "asis", echo = FALSE-------------------------------------
library(santaR)
nrow(acuteInflammation$data)

## ---- results = "asis", echo = FALSE-------------------------------------
library(santaR)
ncol(acuteInflammation$data)

## ---- results = "asis", echo = FALSE-------------------------------------
library(santaR)
pander::pandoc.table(acuteInflammation$data[12:20,1:4])

## ---- eval = FALSE-------------------------------------------------------
#  library(santaR)
#  
#  # Concatenate
#  outputTable <- cbind(acuteInflammation$meta, acuteInflammation$data)
#  
#  # Save to disk
#  outputPath = file.path('path_to_my_output_folder', 'acuteInflammation_GUI_demo.csv')
#  write.csv(outputTable, file=outputPath, row.names=FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  library(santaR)
#  
#  # Rename datasets
#  inMeta <- acuteInflammation$meta
#  inData <- acuteInflammation$data
#  			
#  # Save to disk
#  outputPath = file.path('path_to_my_output_folder', 'acuteInflammation_GUI_demo.rdata')
#  save(inMeta, inData, file=outputPath, compress=TRUE)

