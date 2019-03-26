library(GetITRData)


### Name: gitrd.read.fwf.file
### Title: Reads FWF file from bovespa (internal)
### Aliases: gitrd.read.fwf.file

### ** Examples


my.f <- system.file('extdata/ITRBPAE.001', package = 'GetITRData')

df.assets <- gitrd.read.fwf.file(my.f, type.fin.report = 'itr')



