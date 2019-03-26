## ----global_options, warning=FALSE, eval=FALSE, echo=FALSE---------------
#  knitr::opts_chunk$set(root.dir = normalizePath("/Users/owner/Documents/GENEActiv/GENEAclassifyPDF"))
#  knitr::opts_chunk$get("root.dir")  # returns 'Users/Me/Docs/Proj'

## ----installing the dependencies,eval=FALSE------------------------------
#  
#  install.packages("GENEAread",repos = "http://cran.us.r-project.org")
#  install.packages("changepoint",repos = "http://cran.us.r-project.org")
#  install.packages("signal",repos = "http://cran.us.r-project.org")
#  install.packages("mmap",repos = "http://cran.us.r-project.org")
#  
#  # Load in the libraries
#  library(GENEAread)
#  library(changepoint)
#  library(signal)
#  library(mmap)

## ----Installing from Source,eval=FALSE-----------------------------------
#  # You will need to change the folder location inside setwd("") to the directory where you saved the tar.gz file
#  # Note that R only uses / not \ when refering to a file/directory location
#  setwd("/Users/owner/Documents/GENEActiv")
#  install.packages("GENEAclassify_1.4.3.tar.gz", repos=NULL, type="source")

## ----loading in the GENEAclassify library,eval=FALSE---------------------
#  library(GENEAclassify)

## ----installing from GitHub,eval=FALSE-----------------------------------
#  install.packages("devtools",repos = "http://cran.us.r-project.org")
#  library(devtools)
#  
#  install_github("https://github.com/Langford/GENEAclassify_1.41.git",
#                 auth_token = "7f0051aaca453eaabf0e60d49bcf752c0fea0668")
#  

## ----Run library function again GENEAclassify library,eval=FALSE---------
#  
#  library(GENEAclassify)
#  

## ----run the vignette,eval=FALSE-----------------------------------------
#  
#  vignette("GENEAclassifyDemo", package = NULL, lib.loc = NULL, all = TRUE)
#  

## ----Loading Data then Segmenting, eval=FALSE----------------------------
#   # Name of the file to analyse
#  DataFile = "DataDirectory/jl_left wrist_010094_2012-01-30 20-39-54.bin"
#  ImportedData = dataImport(DataFile, downsample = 100, start=0, end=0.1)
#  head(ImportData)

## ---- eval = FALSE-------------------------------------------------------
#  # These are the default output variables from segmentation and getGENEAsegments
#   dataCols <- c("UpDown.mean",
#                  "UpDown.var",
#                  "UpDown.sd",
#                  "Degrees.mean",
#                  "Degrees.var",
#                  "Degrees.sd",
#                  "Magnitude.mean",
#                  # Frequency Variables
#                  "Principal.Frequency.median",
#                  "Principal.Frequency.mad",
#                  "Principal.Frequency.GENEAratio",
#                  "Principal.Frequency.sumdiff",
#                  "Principal.Frequency.meandiff",
#                  "Principal.Frequency.abssumdiff",
#                  "Principal.Frequency.sddiff",
#                  # Light Variables
#                  "Light.mean",
#                  "Light.max",
#                  # Temperature Variables
#                  "Temp.mean",
#                  "Temp.sumdiff",
#                  "Temp.meandiff",
#                  "Temp.abssumdiff",
#                  "Temp.sddiff",
#                  # Step Variables
#                  "Step.GENEAcount",
#                  "Step.sd",
#                  "Step.mean")
#  
#  # Performing the segmentation now given the dataCols we want to find.
#  
#  SegDataFile = segmentation(ImportedData, dataCols)
#  # View the data from the segmentation
#  head(SegDataFile)

## ----segment a datafile,eval=FALSE---------------------------------------
#   # Name of the file to analyse
#  DataFile = "DataDirectory/jl_left wrist_010094_2012-01-30 20-39-54.bin"
#  SegDataFile = getGENEAsegments(DataFile,dataCols, start=0, end=0.1)

## ----Displaying varying step counting alogrithms,eval=FALSE--------------
#  
#  WalkingData="TrainingData/Walking/walking_jl_right wrist_024603_2015-12-12 15-36-47.bin"
#  
#  # Starting with no filter
#  W1 = getGENEAsegments(WalkingData, method="none", plot.it=TRUE)
#  # plot.it Shows the crossing points. Turn this on for all plots to see how each filter works
#  # List the step outputs here.
#  W1$Step.GENEAcount;W1$Step.sd;W1$Step.mean
#  
#  # Using the default longrun
#  W2 = getGENEAsegments(WalkingData, method="longrun")
#  W2$Step.GENEAcount;W2$Step.sd;W2$Step.mean
#  
#  # Using long run again with a different window length. The default smlen=20.
#  W2 = getGENEAsegments(WalkingData, method="longrun",smlen=30)
#  W2$Step.GENEAcount;W2$Step.sd;W2$Step.mean
#  
#  # Using the cheby filter options
#  W3 = getGENEAsegments(WalkingData, method="Chebyfilter",smlen=50)
#  W3$Step.GENEAcount;W3$Step.sd;W3$Step.mean
#  
#  # Changing the Rp value as seen in the signal package (defualt Rp = 20)
#  W3 = getGENEAsegments(WalkingData, method="Chebyfilter", smlen = 50, Rp = 0.01)
#  W3$Step.GENEAcount;W3$Step.sd;W3$Step.mean
#  
#  # Using the Butterworth filter
#  W4 = getGENEAsegments(WalkingData, method="Butterfilter",smlen=50,Rp=0.01)
#  W4$Step.GENEAcount;W4$Step.sd;W4$Step.mean
#  
#  # Using the Butterworth filter and changing the boundaries (Default: boundaries = c(0.15, 1.0))
#  W4 = getGENEAsegments(WalkingData, method="Butterfilter",boundaries = c(0.15, 0.5),
#                        smlen=50,Rp=0.01)
#  W4$Step.GENEAcount;W4$Step.sd;W4$Step.mean
#  

## ----loading TrainingData.csv,eval=FALSE---------------------------------
#  # Change the file path to the location of GENEAclassify.
#  setwd("/Users/owner/Documents/GENEActiv/GENEAclassify_1.41/Data")
#  TrainingData=read.table("TrainingData.csv",sep=",")
#  
#  # The data can also be called through from the package.
#  data(TrainingData)
#  TrainingData

## ----eval=FALSE----------------------------------------------------------
#  ClassificationModel=createGENEAmodel(TrainingData,
#                     features=c("Segment.Duration","UpDown.mean",
#                                "UpDown.sd","Degrees.mean",
#                                "Degrees.sd","Magnitude.mean","Light.mean",
#                                "Temp.mean","Step.sd",
#                                "Step.count","Step.mean",
#                                "Principal.Frequency.median"
#                               ,"Principal.Frequency.mad"))

## ----eval=FALSE----------------------------------------------------------
#  ClassificationModel=createGENEAmodel(TrainingData,
#                     features=c("UpDown.mean",
#                                "UpDown.sd","Degrees.mean",
#                                "Degrees.sd","Magnitude.mean",
#                                "Step.sd","Step.mean",
#                                "Principal.Frequency.median"
#                               ,"Principal.Frequency.mad"))

## ----classifying a File,eval=FALSE---------------------------------------
#  DataFile="jl_left wrist_010094_2012-01-30 20-39-54.bin" # Change to the file to classify
#  ClassifiedFile = classifyGENEA(DataFile,
#                                 trainingfit = ClassificationModel,
#                                 start="3:00",end="1 3:00")

## ----classifying a Directory, eval=FALSE---------------------------------
#  ClassifiedDirectory = classifyGENEA(DataDirectory,
#                                      trainingfit = ClassificationModel,
#                                      start="3:00", end="1 3:00")

## ----Segmentation RunWalk file,echo=FALSE,eval=FALSE---------------------
#  SegData=getSegmentedData("RunWalk.bin",end="9:23")
#  head(SegData)

## ----List creation,eval=FALSE--------------------------------------------
#  Activity=c("Running",
#             "Running",
#             "Walking")

## ----Attaching Activities,eval=FALSE-------------------------------------
#  SegData=cbind(SegData,ActivitiesListed)

## ----eval = FALSE--------------------------------------------------------
#  SegData$Activity[1:2]="Running"
#  SegData$Activity[3]="Walking"

## ----eval=FALSE----------------------------------------------------------
#  Cycling=getSegmentedData("TrainingData/Cycling")
#  Cycling$Activity="Cycling"
#  
#  NonWear=getSegmentedData("TrainingData/NonWear")
#  NonWear$Activity="NonWear"
#  
#  onthego=getSegmentedData("TrainingData/onthego")
#  onthego$Activity="onthego"
#  
#  Running=getSegmentedData("TrainingData/Running")
#  Running$Activity="Running"
#  
#  Sitting=getSegmentedData("TrainingData/Sitting")
#  Sitting$Activity="Sitting"
#  
#  Sleep=getSegmentedData("TrainingData/Sleep")
#  Sleep$Activity="Sleep"
#  
#  Standing=getSegmentedData("TrainingData/Standing")
#  Standing$Activity="Standing"
#  
#  Swimming=getSegmentedData("TrainingData/Swimming")
#  Swimming$Activity="Swimming"
#  
#  Transport=getSegmentedData("TrainingData/Transport")
#  Transport$Activity="Transport"
#  
#  Walking=getSegmentedData("TrainingData/Walking")
#  Walking$Activity="Walking"
#  
#  Workingout=getSegmentedData("TrainingData/Workingout")
#  Workingout$Activity="Workingout"

## ---- Combining Segments,eval=FALSE--------------------------------------
#  TrainingData=rbind(Cycling,
#                     NonWear,
#                     onthego,
#                     Running,
#                     Sitting,
#                     Sleep,
#                     Standing,
#                     Swimming,
#                     Transport,
#                     Walking,
#                     Workingout)

## ----eval=FALSE----------------------------------------------------------
#  ClassificationModel=createGENEAFit(TrainingData,
#                     features=c("UpDown.mean",
#                                "UpDown.sd","Degrees.mean",
#                                "Degrees.sd","Magnitude.mean",
#                                "Step.sd","Step.mean",
#                                "Principal.Frequency.median",
#                                "Principal.Frequency.mad"))

