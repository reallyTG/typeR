library(nCal)


### Name: read.luminex.xls
### Title: Read a Luminex File
### Aliases: read.luminex.xls
### Keywords: ~kwd1 ~kwd2

### ** Examples


#begin=Sys.time()

# example from https://www.labkey.org/wiki/home/Documentation/page.view?name=luminexFileFormats
dat = read.luminex.xls(paste(system.file(package="nCal")[1],
    '/misc/02-14A22-IgA-Biotin-tiny.xls', sep=""), verbose=TRUE)
out = ncal(log(fi)~expected_conc, dat, return.fits = TRUE, plot.se.profile=FALSE)
out

#end=Sys.time();print(end-begin)





