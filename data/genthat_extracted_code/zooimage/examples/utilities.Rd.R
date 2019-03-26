library(zooimage)


### Name: utilities
### Title: Various utility functions used by ZooImage
### Aliases: sampleInfo underscoreToSpace trimString listSamples makeId
###   addClass calcVars dropVars ecd parseIni calibrate getDec zipNoteAdd
###   zipNoteGet makeZIVignettes
### Keywords: utilities

### ** Examples

# Given a correct ZooImage name for a sample, return parts of it
smp__ <- "MTLG.2010-03-15.H1+A1.03_dat1.zim"
sampleInfo(smp__, "sample")
sampleInfo(smp__, "fraction")
sampleInfo(smp__, "image")
sampleInfo(smp__, "scs")
sampleInfo(smp__, "date")
sampleInfo(smp__, "id")
sampleInfo(smp__, "frac")
sampleInfo(smp__, "imgnbr")
rm(smp__)
sampleInfo(c("ScanG16.2004-10-20+A1.tif", "ScanG16.2004-10-20+B1.tif"),
    type = "sample", ext = extensionPattern("tif"))

# Character strings manipulation functions
underscoreToSpace("Some_string_to_convert")
trimString("    \tString with\textra spaces  \t")

# Variables calculation utilities
df__ <- data.frame(Label = c("Alabel", "AnotherLabel"), Item = c("01", "02"))
makeId(df__)
rm(df__)
ecd(1:10)
ecd(1:10, cells = 2)
ecd(1:10, cells = 1:10)

### TODO: addClass(), calibrate(), calcVars(), parseIni(), zipNoteAdd() and zipNoteGet() examples



