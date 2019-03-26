library(GetDFPData)


### Name: gdfpd.read.fca.zip.file
### Title: Reads a single FCA zip file downloaded from Bovespa
### Aliases: gdfpd.read.fca.zip.file

### ** Examples


my.f <- system.file('extdata/FCA_9512_PETR_2015-12-31.zip', package = 'GetDFPData')

my.l <- gdfpd.read.fca.zip.file(my.f)
print(my.l)




