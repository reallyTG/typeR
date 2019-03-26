library(rMEA)


### Name: setGroup
### Title: Sets the group of MEA objects
### Aliases: setGroup

### ** Examples

## read a sample
path_normal <- system.file("extdata/normal", package = "rMEA")
mea_normal <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist",
                     idOrder = c("id","session"), idSep = "_",  skip = 1)
mea_normal <- setGroup(mea_normal, "normal")



