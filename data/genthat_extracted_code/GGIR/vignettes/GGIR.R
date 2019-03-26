## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("GGIR", dependencies = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  library(GGIR)
#  g.shell.GGIR(#=======================================
#               # INPUT NEEDED:
#               mode=c(1,2,3,4,5),
#               datadir="C:/mystudy/mydata",
#               outputdir="D:/myresults",
#               f0=1, f1=2,
#               #-------------------------------
#               # Part 1:
#               #-------------------------------
#               # Key functions: reading file, auto-calibration, and extracting features
#               do.enmo = TRUE,             do.anglez=TRUE,
#               chunksize=1,                printsummary=TRUE,
#               #-------------------------------
#               # Part 2:
#               #-------------------------------
#               strategy = 2,               ndayswindow=7,
#               hrs.del.start = 0,          hrs.del.end = 0,
#               maxdur = 9,                 includedaycrit = 16,
#               winhr = c(5,10),
#               qlevels = c(c(1380/1440),c(1410/1440)),
#               qwindow=c(0,24),
#               ilevels = c(seq(0,400,by=50),8000),
#               mvpathreshold =c(100,120),
#               bout.metric = 4,
#               closedbout=FALSE,
#               #-------------------------------
#               # Part 3:
#               #-------------------------------
#               # Key functions: Sleep detection
#               timethreshold= c(5),        anglethreshold=5,
#               ignorenonwear = TRUE,
#               #-------------------------------
#               # Part 4:
#               #-------------------------------
#               # Key functions: Integrating sleep log (if available) with sleep detection
#               # storing day and person specific summaries of sleep
#               excludefirstlast = TRUE,
#               includenightcrit = 16,
#               def.noc.sleep = c(),
#               loglocation= "C:/mydata/sleeplog.csv",
#               outliers.only = TRUE,
#               criterror = 4,
#               relyonsleeplog = FALSE,
#               sleeplogidnum = TRUE,
#               colid=1,
#               coln1=2,
#               do.visual = TRUE,
#               nnights = 9,
#               #-------------------------------
#               # Part 5:
#               # Key functions: Merging physical activity with sleep analyses
#               #-------------------------------
#               threshold.lig = c(30), threshold.mod = c(100),  threshold.vig = c(400),
#               boutcriter = 0.8,      boutcriter.in = 0.9,     boutcriter.lig = 0.8,
#               boutcriter.mvpa = 0.8, boutdur.in = c(1,10,30), boutdur.lig = c(1,10),
#               boutdur.mvpa = c(1),   timewindow = c("WW"),
#               #-----------------------------------
#               # Report generation
#               #-------------------------------
#               # Key functions: Generating reports based on meta-data
#               do.report=c(2,4,5),
#               visualreport=TRUE,     dofirstpage = TRUE,
#               viewingwindow=1)

## ---- out.width = "700px",echo=FALSE-------------------------------------
knitr::include_graphics("sleeplogexample.jpg")

## ----eval=FALSE----------------------------------------------------------
#  options(echo=TRUE)
#  args = commandArgs(TRUE)
#  if(length(args) > 0) {
#    for (i in 1:length(args)) {
#      eval(parse(text = args[[i]]))
#    }
#  }
#  g.shell.GGIR(f0=f0,f1=f1,...)

## ---- out.width = "700px",echo=FALSE-------------------------------------
knitr::include_graphics("reportexample.jpg")

## ---- out.width = "700px",echo=FALSE-------------------------------------
knitr::include_graphics("example_dovisual.jpg")

## ---- out.width = "400px",echo=FALSE-------------------------------------
knitr::include_graphics("nonwearimage.jpg")

