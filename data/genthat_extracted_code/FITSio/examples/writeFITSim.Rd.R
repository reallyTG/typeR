library(FITSio)


### Name: writeFITSim
### Title: Write a FITS image (multi-dimensional numeric array) to disk
### Aliases: writeFITSim writeFITSim16i
### Keywords: file

### ** Examples


## Make data array with axis information, write to disk
X <- matrix(1:15, ncol = 3)
writeFITSim(X, file = "test.fits", c1 = "Test FITS file",
            crpixn = c(1,1), crvaln = c(10, 100), cdeltn = c(8, 2),
            ctypen = c("Distance", "Time"),
            cunitn = c("Furlongs", "Fortnights"))
## Read back in, modify data offset, header, and axis data information,
## then write modified version as new file
Z <-  readFITS("test.fits")
Z$imDat <- Z$imDat + 300
Z$header <- addKwv('SCALE', 1.03, 'test header mod', header=Z$header)
# Z$axDat <- edit(Z$axDat)  # interactive edits
Z$axDat$cdelt
Z$axDat$cdelt[2] <- 20
Z$axDat$cdelt
writeFITSim(Z$imDat, file='test_modified.fits', axDat=Z$axDat, header=Z$header)
unlink("test.fits")

### 3-dimensional array example
## Write sample file
X <- array(1:210, dim = c(10, 7, 3))
writeFITSim(X, "test.fits")
## Read back in and display plane 2, no axis scale markings
Z <-  readFITS("test.fits")
dim(Z$imDat[,,2])
image(Z$imDat[,,2], xaxt = "n", yaxt = "n")
str(Z)
print(Z$axDat)
unlink("test.fits")

### Note: either of the writeFITSim() calls here could be replaced
###       with writeFITSim16i() calls with the identical argument.



