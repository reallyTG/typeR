library(CATkit)


### Name: CatCall
### Title: Visual Analysis of Period and Phase
### Aliases: CatCall
### Keywords: ~ Actogram ~ Smoothing ~ Autocorrelation ~ Crosscorrelation ~
###   cosinor ~ chronomics

### ** Examples

                  #---------------------   Vignette3      visualization
                  
                  #   
                  #  Normally you would use these lines to read a file for use in CATkit 
                  #   (use filePath format for your OS)
                  # filePath<-"~/file/path/Installing CAT/Vignette3"          # use for mac
                  # filePath<-"c:\file\path\Installing CAT\Vignette3"     # use for PC
                  # fileName<-file.path(filePath,'activity-stress-c57-2-part.txt')
                  # file2Name<-file.path(filePath,'good-6d-2m-part.txt')
                  #
                  # these lines are used instead of the above since it is part of a package.
                  file.copy(system.file("extdata", "activity-stress-c57-2-part.txt", 
                    package = "CATkit"), tempdir(), overwrite = TRUE, recursive = FALSE, 
                    copy.mode = TRUE, copy.date = FALSE)
                  file.copy(system.file("extdata", "good-6d-2m-part.txt", package = "CATkit"), 
                    tempdir(), overwrite = TRUE, recursive = FALSE, copy.mode = TRUE, 
                    copy.date = FALSE)
                  filePath<-tempdir()
                  fileName<-file.path(filePath,'activity-stress-c57-2-part.txt')
                  file2Name<-file.path(filePath,'good-6d-2m-part.txt')

                  #fileName<-system.file("extdata", "activity-stress-c57-2-part.txt", 
                    #package = "CATkit")
                  #file2Name<-system.file("extdata", "good-6d-2m-part.txt", package = "CATkit")
                  # 
                  CatCall(TimeCol=c(1,2), timeFormat="%d/%m/%y %H:%M:%S",lum=NA, 
                    valCols=5, sumCols=c(), Avg=FALSE, export=TRUE, sizePts=2, binPts=30, 
                    Interval = 0, Increment=0, k=5, yLab=NA, modulo=1440, Rverbose=0, RmaxGap=3000, 
                    Skip=0, header=TRUE, Smoothing=TRUE, Actogram=TRUE,AutoCorr=TRUE, 
                    CrossCorr=TRUE,Console=FALSE,Graphics="pdf", Darkness=0, LagPcnt=1,
                    fileName=fileName, file2=list(Name=file2Name,TimeCol=c(1,2), 
                      timeFormat="%d/%m/%y %H:%M:%S", lum=NA, valCols=5, sumCols=c(),
                      sizePts=2, binPts=30,Darkness=0))
                  


