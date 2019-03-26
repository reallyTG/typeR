library(fluoSurv)


### Name: when.threshold
### Title: Computes when fluorescence exceeds a given threshold value
### Aliases: when.threshold

### ** Examples


data(galleria)
d <- subset(galleria,!is.na(value))
l  <- lapply(split(d,d$well),extract.well)   #complete kinetics for each well

with(l[["A3"]],plot(t_2_485_535,log(value_2_485_535,10),type="l"))
with(l[["A3"]],abline(v=when.threshold(t_2_485_535,value_2_485_535)))




