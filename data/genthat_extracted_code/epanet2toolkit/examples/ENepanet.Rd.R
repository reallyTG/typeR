library(epanet2toolkit)


### Name: ENepanet
### Title: ENepanet
### Aliases: ENepanet

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp") 
print(inp)
ENepanet( inp, "Net1.rpt") 
# try opening Net1.rpt in a text editor or reading it back
# into R with the read.rpt() function in package epanetReader
myRpt <- epanetReader::read.rpt("Net1.rpt")
summary(myRpt)



