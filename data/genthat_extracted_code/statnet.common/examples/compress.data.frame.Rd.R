library(statnet.common)


### Name: compress.data.frame
### Title: "Compress" a data frame.
### Aliases: compress.data.frame decompress.data.frame
### Keywords: manip

### ** Examples


(x <- data.frame(V1=sample.int(3,30,replace=TRUE),
                 V2=sample.int(2,30,replace=TRUE),
                 V3=sample.int(4,30,replace=TRUE)))

(c <- compress.data.frame(x))

stopifnot(all(decompress.data.frame(c)==x))



