library(enviPick)


### Name: enviPick-package
### Title: Peak picking for high resolution liquid chromatography - mass
###   spectrometry (LC-HRMS) data
### Aliases: enviPick-package enviPick
### Keywords: package

### ** Examples

## Not run: 
##D 
##D ##################################################
##D # (1) Define path to an LC-HRMS .mzML file (not provided with package):
##D 
##D filepath.mzML<-"C:/.../2012_07_01.mzML"
##D 
##D # (2) Initialize an MSlist object and load this .mzML file into it:
##D 
##D MSlist<-readMSdata(filepath.mzML, MSlevel=c(1))
##D 
##D # (3) Partition the measurements now available in MSlist:
##D 
##D MSlist<-mzagglom(MSlist,dmzgap=10,ppm=TRUE,drtgap=500,minpeak=4,maxint=1E7)
##D 
##D # (4) EIC clustering of the partitions now available in MSlist:
##D 
##D MSlist<-mzclust(MSlist,dmzdens=5,ppm=TRUE,drtdens=120,minpeak=4)      
##D 
##D # (5) Peak picking within the EIC clusters now available in MSlist:
##D 
##D MSlist<-mzpick(MSlist, minpeak = 4, drtsmall = 50, drtfill = 10,  drttotal = 200, recurs = 4, 
##D 	weight = 2, SB = 3, SN=2, minint = 1E4, maxint = 1e+07, ended = 2)
##D 
##D # (6) Export a peak list now available in MSlist:
##D 
##D writePeaklist(MSlist,"directory","filename")
##D 
##D # (7) View your partitioning / EIC clustering / peak picking results:
##D 
##D plotMSlist(MSlist,ppmbar=10);
##D ##################################################
##D 
##D ##################################################
##D # Do above steps (1) to (5) in one wrap, then export a peak list:
##D 
##D MSlist<-enviPickwrap( filepath.mzML,
##D                       MSlevel=c(1),
##D                       dmzgap=10,  
##D                       dmzdens=5,       
##D                       ppm=TRUE,
##D                       drtgap=1000, 
##D                       drtsmall=20,
##D                       drtdens=250,
##D                       drtfill=10,
##D                       drttotal=200,
##D                       minpeak=4,
##D                       recurs=10,
##D                       weight=2,
##D                       SB=3,
##D                       SN=2,
##D                       minint=10E4,
##D                       maxint=10E6,
##D                       ended=2,
##D                       progbar=TRUE
##D                        )
##D 					   
##D writePeaklist(MSlist,"directory","filename")
##D ##################################################
##D 
## End(Not run)



