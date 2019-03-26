library(xROI)


### Name: writeROI
### Title: Write ROI list file
### Aliases: writeROI
### Keywords: ROI ROIList Write

### ** Examples


#loading the ROI files from the example directory
f <- system.file(package = 'xROI', 'example/ROI/example_DB_0001_roi.csv')

#parsing the example ROI file and store in roi
roi <- parseROI(f)

#write the loaded ROI in the temporary path
tempPath <- file.path(tempdir(), 'roi.csv')
writeROI(roi, tempPath)




