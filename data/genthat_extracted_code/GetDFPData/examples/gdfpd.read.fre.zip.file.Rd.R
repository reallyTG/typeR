library(GetDFPData)


### Name: gdfpd.read.fre.zip.file
### Title: Reads a single FRE zip file downloaded from Bovespa
### Aliases: gdfpd.read.fre.zip.file

### ** Examples


my.f <- system.file('extdata/FRE_6629_HERC_2010-12-31.zip', package = 'GetDFPData')

my.l <- gdfpd.read.fre.zip.file(my.f)
print(my.l)




