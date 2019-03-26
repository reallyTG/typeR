library(CATkit)


### Name: CATpmc
### Title: Population-mean Cosinor (PMC)
### Aliases: CATpmc
### Keywords: ~Population-mean Cosinor ~pmc ~cosinor

### ** Examples

                # Data is from east Indian subjects:  lipids, smoking, diet, gender, age group
                #        every 6 hours.
                #---------------------  Vignette4    Population-Mean Cosinor  
                # PMC according to behavioral factors and lipids for a population of subjects
                
                #  Normally you would use these lines to read a file for use in CATkit 
                #        (use filePath format for your OS)
                # filePath<-"~/file/path/Installing CAT/Vignette4"          # use for mac
                # filePath<-"c:\file\path\Installing CAT\Vignette4"     # use for PC
                # fileName<-file.path(filePath,'cos02x03.csv')
                
                # this line is used instead of the above since it is part of a package.
                file.copy(system.file("extdata", "cos02x03.csv", package = "CATkit"), 
                    tempdir(), overwrite = TRUE, recursive = FALSE, copy.mode = TRUE, 
                    copy.date = FALSE)
                filePath<-tempdir()
                fileName<-file.path(filePath,'cos02x03.csv')

                #fileName<-system.file("extdata", "cos02x03.csv", package = "CATkit")
                CATpmc(fileName=fileName, VarID=8, GrpID=c(5,10),header=TRUE,
                sep=",",functionName="V8,G5,10", title="Vignette3 V8,G5,10")
                


