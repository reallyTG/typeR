library(GetITRData)


### Name: gitrd.read.fre.zip.file
### Title: Reads a single zip file downloaded from Bovespa
### Aliases: gitrd.read.fre.zip.file

### ** Examples


my.f <- system.file('extdata/434_ARAC_2008-09-30.zip', package = 'GetITRData')

my.l <- gitrd.read.zip.file(my.f, id.type = 'before 2011', type.fin.report = 'itr')
print(my.l)




