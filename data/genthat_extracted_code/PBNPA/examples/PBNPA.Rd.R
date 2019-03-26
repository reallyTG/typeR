library(PBNPA)


### Name: PBNPA
### Title: Permutation Based Non-Parametric Analysis of CRISPR Screen Data
### Aliases: PBNPA

### ** Examples

dat11 = system.file('extdata','simdata_20per_off50.csv', package='PBNPA')
dat22 = system.file('extdata','simdata_20per_off49.csv', package='PBNPA')
dat33 = system.file('extdata','simdata_20per_off48.csv', package='PBNPA')
dat1 = read.csv(dat11, header = TRUE)
dat2 = read.csv(dat22, header = TRUE)
dat3 = read.csv(dat33, header = TRUE)
datlist = list(dat1, dat2, dat3)
result = PBNPA(datlist)



