library(MSnbase)


### Name: readMzTabData
### Title: Read an 'mzTab' file
### Aliases: readMzTabData

### ** Examples

testfile <- "https://raw.githubusercontent.com/HUPO-PSI/mzTab/master/examples/1_0-Proteomics-Release/PRIDE_Exp_Complete_Ac_16649.xml-mztab.txt"
prot <- readMzTabData(testfile, "PRT")
prot
head(fData(prot))
head(exprs(prot))
psms <- readMzTabData(testfile, "PSM")
psms
head(fData(psms))



