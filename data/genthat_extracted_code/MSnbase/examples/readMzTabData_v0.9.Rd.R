library(MSnbase)


### Name: readMzTabData_v0.9
### Title: Read an 'mzTab' file
### Aliases: readMzTabData_v0.9

### ** Examples

testfile <- "https://raw.githubusercontent.com/HUPO-PSI/mzTab/master/legacy/jmztab-1.0/examples/mztab_itraq_example.txt"
prot <- readMzTabData_v0.9(testfile, "PRT")
prot
pep <- readMzTabData_v0.9(testfile, "PEP")
pep



