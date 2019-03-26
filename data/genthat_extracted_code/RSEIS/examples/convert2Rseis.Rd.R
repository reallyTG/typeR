library(RSEIS)


### Name: convert2Rseis
### Title: Convert Seismic data to RSEIS
### Aliases: convert2Rseis
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D ############   example of different scenarios
##D ###  make list of the files
##D fls <- list.files(path="/home/lees/SAC", pat="sac")
##D 
##D ###  convert them to R
##D 
##D ####   was created on a little endian machine
##D ###          and is being read on a little endian
##D convert2Rseis(fls, NEWDIR = "/home/lees/MY_RDATA", kind = 2,
##D  Iendian = "little", BIGLONG = FALSE)
##D 
##D 
##D ####   was created on a little endian machine
##D ###     and is being read on a big endian
##D convert2Rseis(fls, NEWDIR = "/home/lees/MY_RDATA",
##D kind = 2, Iendian = "swap", BIGLONG = FALSE)
##D 
##D ####   was created on a little endian machine and is being read on a big
##D ####                       endian, with  the 64 bit machine used LONG=8
##D convert2Rseis(fls, NEWDIR = "/home/lees/MY_RDATA",
##D kind = 2, Iendian = "swap", BIGLONG = TRUE)
##D 
##D 
##D F90dir <- "/mnt/flash/FUEGO/2009/F900"
##D kfl <- list.files(path=F90dir, full.names=TRUE)
##D 
##D bname <- basename(kfl)
##D 
##D ###  now we want to convert the station names
##D 
##D ###  extract the STA name from the file names:
##D STA <- unlist( lapply(  strsplit(split="\.", bname), getmem , 3) )
##D ###   extract comp name - in this case needs further extraction
##D COMP1 <- unlist( lapply(  strsplit(split="\.", bname), getmem , 4) )
##D COMP <- substr(COMP1, 3, 3)
##D 
##D convert2Rseis(kfl, NEWDIR="/home/lees/Site/Fuego/2009",
##D kind <- 2, Iendian="swap" , BIGLONG=FALSE, NEWsta=STA, NEWcomp=COMP )
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)





