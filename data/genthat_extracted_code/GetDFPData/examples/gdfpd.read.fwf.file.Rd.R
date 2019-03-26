library(GetDFPData)


### Name: gdfpd.read.fwf.file
### Title: Reads FWF file from bovespa (internal)
### Aliases: gdfpd.read.fwf.file

### ** Examples


my.f <- system.file('extdata/DFPBPAE.001', package = 'GetDFPData')

df.assets <- gdfpd.read.fwf.file(my.f, flag.thousands = FALSE)



