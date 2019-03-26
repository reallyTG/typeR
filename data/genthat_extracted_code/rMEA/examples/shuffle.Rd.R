library(rMEA)


### Name: shuffle
### Title: Shuffle MEA data
### Aliases: shuffle

### ** Examples

## read the first 4 minutes of the normal sample
##   (intake interviews of patients that carried on therapy)
path_normal <- system.file("extdata/normal", package = "rMEA")
mea_normal <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist",
                     idOrder = c("id","session"), idSep="_", skip=1, nrow = 6000)
mea_normal <- setGroup(mea_normal, "normal")

## Create a shuffled sample
mea_rand = shuffle(mea_normal, 50)

summary(mea_rand)



