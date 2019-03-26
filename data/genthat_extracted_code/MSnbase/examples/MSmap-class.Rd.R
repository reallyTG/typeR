library(MSnbase)


### Name: MSmap-class
### Title: Class 'MSmap'
### Aliases: MSmap-class MSmap MSmap-method MSmap,OnDiskMSnExp-method
###   MSmap,mzRpwiz-method MSmap,mzRramp-method MSmap,mzRraw-method
###   coerce,MSmap,data.frame-method dim,MSmap-method fileName,MSmap-method
###   fileNames,MSmap-method msLevel,MSmap-method msMap,MSmap-method msMap
###   mz,MSmap-method mzRes mzRes,MSmap-method ncol,MSmap-method
###   nrow,MSmap-method plot3D,MSmap-method plot3D
###   plot,MSmap,missing-method rtime,MSmap-method show,MSmap-method
###   t,MSmap-method
### Keywords: classes

### ** Examples


## Not run: 
##D     ## downloads the data
##D     library("rpx")
##D     px1 <- PXDataset("PXD000001")
##D     (i <- grep("TMT.+mzML", pxfiles(px1), value = TRUE))
##D     mzf <- pxget(px1, i)
##D 
##D     ## Using an mzRpwiz object
##D     ## reads the data 
##D     ms <- openMSfile(mzf)
##D     hd <- header(ms)
##D 
##D     ## a set of spectra of interest: MS1 spectra eluted
##D     ## between 30 and 35 minutes retention time
##D     ms1 <- which(hd$msLevel == 1)
##D     rtsel <- hd$retentionTime[ms1] / 60 > 30 &
##D         hd$retentionTime[ms1] / 60 < 35
##D 
##D     ## the map
##D     M <- MSmap(ms, ms1[rtsel], 521, 523, .005, hd)
##D 
##D     plot(M, aspect = 1, allTicks = FALSE)
##D     plot3D(M)
##D     if (require("rgl") & interactive())
##D         plot3D(M, rgl = TRUE)
##D 
##D     ## With some MS2 spectra
##D     i <- ms1[which(rtsel)][1]
##D     j <- ms1[which(rtsel)][2]
##D     M2 <- MSmap(ms, i:j, 100, 1000, 1, hd)
##D     plot3D(M2)
##D 
##D     ## Using an OnDiskMSnExp object and accessors
##D     msn <- readMSData(mzf, mode = "onDisk")
##D     
##D     ## a set of spectra of interest: MS1 spectra eluted
##D     ## between 30 and 35 minutes retention time
##D     ms1 <- which(msLevel(msn) == 1)
##D     rtsel <- rtime(msn)[ms1] / 60 > 30 &
##D         rtime(msn)[ms1] / 60 < 35
##D 
##D     ## the map
##D     M3 <- MSmap(msn, ms1[rtsel], 521, 523, .005)
##D     plot(M3, aspect = 1, allTicks = FALSE)
##D 
##D     ## With some MS2 spectra
##D     i <- ms1[which(rtsel)][1]
##D     j <- ms1[which(rtsel)][2]
##D     M4 <- MSmap(msn, i:j, 100, 1000, 1)
##D     plot3D(M4)    
## End(Not run)



