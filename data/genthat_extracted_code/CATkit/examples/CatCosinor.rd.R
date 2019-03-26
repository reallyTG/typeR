library(CATkit)


### Name: CATCosinor
### Title: Cosinor Analysis
### Aliases: CATCosinor
### Keywords: ~ Cosinor ~ multi-component ~ single-component ~ regression ~
###   least squares ~ spectrum ~ chronomics

### ** Examples

                #Data is systolic and dialstolic blood pressure; and heart rate at 
                #        30 minute intervals.
                #---------------------  Vignette0    multi-component cosinor.  
                # multiple-components cosinor analysis of 24, 12 and 8 hours.  Columns 
                #       4,6,7 are processed.

                #  Normally you would use these lines to read a file for use in CATkit 
                #        (use filePath format for your OS)
                # filePath<-"~/file/path/Installing CAT/Vignette0"          # use for mac
                # filePath<-"c:\file\path\Installing CAT\Vignette0"     # use for PC
                # fileName<-file.path(filePath,'CLGi001.dat')
                
                # this line is used instead of the above since it is part of a package.
                file.copy(system.file("extdata", "CLGi001.dat", package = "CATkit"), 
                    tempdir(), overwrite = TRUE, recursive = FALSE, copy.mode = TRUE, 
                    copy.date = FALSE)
                filePath<-tempdir()
                fileName<-file.path(filePath,'CLGi001.dat')

                #fileName<-system.file("extdata", "CLGi001.dat", package = "CATkit")
                #  
                CATCosinor(TimeCol=2,Y=c(4,6,7), Components=3, window="noTaper", RefDateTime
                  ="201302030000",  timeFormat="%Y%m%d%H%M",RangeDateTime =list(Start=0, 
                  End=0), Units='hours', dt=0, Progressive=list(Interval=0, Increment=0),
                  Period=list(Set=c(24,12,8),Start=0,Increment=1,End=0),header=FALSE, 
                  Skip=0,Colors="BW",Graphics="pdf",Output=list(Txt=FALSE,Dat=TRUE,
                  Doc=TRUE,Graphs=TRUE),Console=FALSE,Debug=FALSE,IDcol="fileName", 
                  fileName=fileName,functionName='Vignette0')
                
                #---------------------   Vignette1     Least Square spectrum
                # 
                #  Normally you would use these lines to read a file for use in CATkit 
                #     (use filePath format for your OS)
                # filePath<-"~/file/path/Installing CAT/Vignette1"          # use for mac
                # filePath<-"c:\file\path\Installing CAT\Vignette1"     # use for PC
                # fileName<-file.path(filePath,'Signal10-20.txt')
                
                # this line is used instead of the above since it is part of a package.
                file.copy(system.file("extdata", "Signal10-20.txt", package = "CATkit"), 
                    tempdir(), overwrite = TRUE, recursive = FALSE, copy.mode = TRUE, 
                    copy.date = FALSE)
                filePath<-tempdir()
                fileName<-file.path(filePath,'Signal10-20.txt')

                #fileName<-system.file("extdata", "Signal10-20.txt", package = "CATkit")
                #
                CATCosinor(TimeCol=1,Y=2, Components=1, window="noTaper", RefDateTime="0",
                timeFormat="%Y%m%d%H%M", RangeDateTime=list(Start=0, End=0), 
                Units='hours', dt=0, Progressive=list(Interval=0, Increment=0), Period=
                list(Set=0,Start=144,Increment=1,End=4),header=FALSE, Skip=0, Colors="BW",
                Graphics="pdf",Output=list(Txt=FALSE,Dat=TRUE,Doc=TRUE,Graphs=TRUE),
                Console=FALSE,Debug=FALSE,fileName=fileName,functionName='Vignette1') 
                
                # ---------------------   Vignette2     progressive least squares spectrum
                #
                #  Normally you would use these lines to read a file for use in CATkit 
                #       (use filePath format for your OS)
                # filePath<-"~/file/path/Installing CAT/Vignette2"          # use for mac
                # filePath<-"c:\file\path\Installing CAT\Vignette2"     # use for PC
                # fileName<-file.path(filePath,'FWedited.txt')
                #
                # this line is used instead of the above since it is part of a package.
                file.copy(system.file("extdata", "FWedited.txt", package = "CATkit"), 
                    tempdir(), overwrite = TRUE, recursive = FALSE, copy.mode = TRUE, 
                    copy.date = FALSE)
                filePath<-tempdir()
                fileName<-file.path(filePath,'FWedited.txt')

                #fileName<-system.file("extdata", "FWedited.txt", package = "CATkit")
                #
                CATCosinor(TimeCol=1,Y=2, Components=1, window="noTaper",RefDateTime 
                ="199210192152",  timeFormat="%Y%m%d%H%M", RangeDateTime= list(Start
                ="199210200000", End="199211300000"), Units='hours', dt=0, Progressive=list
                (Interval=168, Increment=24), Period=list(Set=0, Start=168,Increment=.5,
                End=9.5),header=FALSE, Skip=0, Colors="BW", Graphics="pdf",Output=list
                (Txt=FALSE,Dat=TRUE,Doc=FALSE,Graphs=TRUE),Console=FALSE,Debug=FALSE,
                fileName=fileName,functionName='Vignette2')
                


