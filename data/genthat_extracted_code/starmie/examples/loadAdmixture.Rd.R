library(starmie)


### Name: loadAdmixture
### Title: Read Admixture Output
### Aliases: loadAdmixture

### ** Examples

qfin <- system.file("extdata/hapmap3_files", "hapmap3.2.Q", package = "starmie")
pfin <- system.file("extdata/hapmap3_files", "hapmap3.2.P", package = "starmie")
my_admix <- loadAdmixture(qfin, pfin)
# add log file
logfin <- system.file("extdata/hapmap3_files", "log2.out", package = "starmie")
my_admix <- loadAdmixture(qfin, pfin, logfin)




