library(gap)


### Name: pedtodot
### Title: Converting pedigree(s) to dot file(s)
### Aliases: pedtodot
### Keywords: dplot

### ** Examples
## Not run: 
##D # example as in R News and Bioinformatics (see also plot.pedigree in package kinship)
##D # it works from screen paste only
##D p1 <- scan(nlines=16,what=list(0,0,0,0,0,"",""))
##D  1   2   3  2  2  7/7  7/10 
##D  2   0   0  1  1  -/-  -/-  
##D  3   0   0  2  2  7/9  3/10 
##D  4   2   3  2  2  7/9  3/7  
##D  5   2   3  2  1  7/7  7/10 
##D  6   2   3  1  1  7/7  7/10 
##D  7   2   3  2  1  7/7  7/10 
##D  8   0   0  1  1  -/-  -/-  
##D  9   8   4  1  1  7/9  3/10 
##D 10   0   0  2  1  -/-  -/- 
##D 11   2  10  2  1  7/7  7/7 
##D 12   2  10  2  2  6/7  7/7 
##D 13   0   0  1  1  -/-  -/- 
##D 14  13  11  1  1  7/8  7/8 
##D 15   0   0  1  1  -/-  -/- 
##D 16  15  12  2  1  6/6  7/7 
##D 
##D p2 <- as.data.frame(p1)
##D names(p2) <-c("id","fid","mid","sex","aff","GABRB1","D4S1645")
##D p3 <- data.frame(pid=10081,p2)
##D attach(p3)
##D pedtodot(p3)
##D #
##D # Three examples of pedigree-drawing
##D # assuming pre-MakePed LINKAGE file in which IDs are characters
##D pre<-read.table("pheno.pre",as.is=TRUE)[,1:6]
##D pedtodot(pre)
##D dir()      
##D # for post-MakePed LINKAGE file in which IDs are integers
##D ped <-read.table("pheno.ped")[,1:10]
##D pedtodot(ped,makeped=TRUE)
##D dir()
##D # for a single file with a list of pedigrees ordered data
##D sink("gaw14.dot")
##D pedtodot(ped,sink=FALSE)
##D sink()
##D file.show("gaw14.dot")
##D # more details
##D pedtodot(ped,sink=FALSE,page="B5",url="http://www.mrc-epid.cam.ac.uk/")
##D 
##D # An example from Richard Mott and in the demo
##D filespec <- system.file("tests/ped.1.3.pre")
##D pre <- read.table(filespec,as.is=TRUE)
##D pre
##D pedtodot(pre,dir="forward")
## End(Not run)



