library(rMEA)


### Name: readMEA
### Title: Import MEA raw data
### Aliases: readMEA

### ** Examples

## read the first sample (intake interviews of patients that carried on therapy)
path_normal <- system.file("extdata/normal", package = "rMEA")
mea_normal <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist", skip=1,
                     idOrder = c("id","session"), idSep="_")
mea_normal <- setGroup(mea_normal, "normal")

## read the second sample (intake interviews of patients that dropped out)
path_dropout <- system.file("extdata/dropout", package = "rMEA")
mea_dropout <- readMEA(path_dropout, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist", skip=1,
                     idOrder = c("id","session"), idSep="_")
mea_dropout <- setGroup(mea_dropout, "dropout")

## Combine into a single object
mea_all = c(mea_normal, mea_dropout)

summary(mea_all)






