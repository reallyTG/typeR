library(ff)


### Name: write.table.ffdf
### Title: Exporting csv files from ff data.frames
### Aliases: write.table.ffdf write.csv.ffdf write.csv2.ffdf write.csv
###   write.csv2
### Keywords: IO file connection

### ** Examples

   x <- data.frame(log=rep(c(FALSE, TRUE), length.out=26), int=1:26, dbl=1:26 + 0.1
, fac=factor(letters), ord=ordered(LETTERS), dct=Sys.time()+1:26
, dat=seq(as.Date("1910/1/1"), length.out=26, by=1))
   ffx <- as.ffdf(x)

   csvfile <- tempPathFile(path=getOption("fftempdir"), extension="csv")

   write.csv.ffdf(ffx, file=csvfile)
   write.csv.ffdf(ffx, file=csvfile, append=TRUE)

   ffy <- read.csv.ffdf(file=csvfile, header=TRUE
, colClasses=c(ord="ordered", dct="POSIXct", dat="Date"))

   rm(ffx, ffy); gc()
   unlink(csvfile)

 ## Not run: 
##D   # Attention, this takes very long
##D   vmodes <- c(log="boolean", int="byte", dbl="single"
##D , fac="short", ord="short", dct="single", dat="single")
##D 
##D   message("create a ffdf with 7 columns and 78 mio rows")
##D   system.time({
##D     x <- data.frame(log=rep(c(FALSE, TRUE), length.out=26), int=1:26, dbl=1:26 + 0.1
##D , fac=factor(letters), ord=ordered(LETTERS), dct=Sys.time()+1:26
##D , dat=seq(as.Date("1910/1/1"), length.out=26, by=1))
##D     x <- do.call("rbind", rep(list(x), 10))
##D     x <- do.call("rbind", rep(list(x), 10))
##D     x <- do.call("rbind", rep(list(x), 10))
##D     x <- do.call("rbind", rep(list(x), 10))
##D     ffx <- as.ffdf(x, vmode = vmodes)
##D     for (i in 2:300){
##D       message(i, "\n")
##D       last <- nrow(ffx) + nrow(x)
##D       first <- last - nrow(x) + 1L
##D       nrow(ffx) <- last
##D       ffx[first:last,] <- x
##D     }
##D   })
##D 
##D 
##D   csvfile <- tempPathFile(path=getOption("fftempdir"), extension="csv")
##D 
##D   write.csv.ffdf(ffx, file=csvfile, VERBOSE=TRUE)
##D   ffy <- read.csv.ffdf(file=csvfile, header=TRUE
##D , colClasses=c(ord="ordered", dct="POSIXct", dat="Date")
##D , asffdf_args=list(vmode = vmodes), VERBOSE=TRUE)
##D 
##D   rm(ffx, ffy); gc()
##D   unlink(csvfile)
##D  
## End(Not run)



