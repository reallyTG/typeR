library(GGIR)


### Name: g.shell.GGIR
### Title: Shell function for analysing an accelerometer dataset.
### Aliases: g.shell.GGIR

### ** Examples

## Not run: 
##D mode= c(1,2,3,4)
##D datadir= "C:/myfolder/mydata"
##D outputdir= "C:/myresults"
##D studyname="test"
##D f0 = 1 
##D f1 = 2
##D g.shell.GGIR(#-------------------------------
##D              # General parameters
##D              #-------------------------------
##D              mode=mode, 
##D              datadir=datadir, 
##D              outputdir=outputdir, 
##D              studyname=studyname, 
##D              f0=f0, 
##D              f1=f1,
##D              overwrite = FALSE, 
##D              do.imp=TRUE,
##D              idloc=1, 
##D              print.filename=FALSE,
##D              storefolderstructure = FALSE,
##D              #-------------------------------
##D              # Part 1 parameters:
##D              #-------------------------------
##D              windowsizes = c(5,900,3600),
##D              do.cal=TRUE, 
##D              do.enmo = TRUE,
##D              do.anglez=TRUE,
##D              chunksize=1,
##D              printsummary=TRUE,
##D              #-------------------------------
##D              # Part 2 parameters:
##D              #-------------------------------
##D              strategy = 1,
##D              ndayswindow=7,
##D              hrs.del.start = 1,
##D              hrs.del.end = 1, 
##D              maxdur = 9,
##D              includedaycrit = 16, 
##D              L5M5window = c(0,24),
##D              M5L5res = 10,
##D              winhr = c(5,10),
##D              qlevels = c(c(1380/1440),c(1410/1440)),
##D              qwindow=c(0,24), 
##D              ilevels = c(seq(0,400,by=50),8000), 
##D              mvpathreshold =c(100,120),
##D              #-------------------------------
##D              # Part 3 parameters:
##D              #-------------------------------
##D              timethreshold= c(5,10),
##D              anglethreshold=5,
##D              ignorenonwear = TRUE,
##D              #-------------------------------
##D              # Part 4 parameters:
##D              #-------------------------------
##D              excludefirstlast = FALSE,
##D              includenightcrit = 16,
##D              def.noc.sleep = c(),
##D              loglocation= "D:/sleeplog.csv",
##D              outliers.only = FALSE,
##D              criterror = 4,
##D              relyonsleeplog = FALSE,
##D              sleeplogidnum = TRUE,
##D              colid=1, 
##D              coln1=2, 
##D              do.visual = TRUE,
##D              nnights = 9,
##D              #-------------------------------
##D              # Part 5 parameters:
##D              #-------------------------------
##D              # Key functions: Merging physical activity with sleep analyses
##D              threshold.lig = c(30,40,50),
##D              threshold.mod = c(100,120),
##D              threshold.vig = c(400,500),
##D              excludefirstlast = FALSE,
##D              boutcriter = 0.8,
##D              boutcriter.in = 0.9,
##D              boutcriter.lig = 0.8,
##D              boutcriter.mvpa = 0.8,
##D              boutdur.in = c(10,20,30),
##D              boutdur.lig = c(1,5,10),
##D              boutdur.mvpa = c(1,5,10),
##D              timewindow = c("WW"),
##D              #-----------------------------------
##D              # Report generation
##D              #-------------------------------
##D              do.report=c(2,4,5))
## End(Not run)



