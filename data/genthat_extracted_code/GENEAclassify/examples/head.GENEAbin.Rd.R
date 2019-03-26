library(GENEAclassify)


### Name: head.GENEAbin
### Title: Get features of a GENEActiv bin data object.
### Aliases: head.GENEAbin
### Keywords: internal

### ** Examples

temp <- list(Data = matrix(rnorm(40), ncol = 4), 
    UpDown = rnorm(10), 
    Degrees = sample(-90:90, 10),
    Time = 1:10, 
    Light = runif(10),
    Temp = rep(20, 10),
    Magnitude = runif(10), 
    Serial = "012345",
    RawData = matrix(rnorm(700), ncol = 7),
    Freq = 100)
class(temp) <- c("list", "GENEAbin")
head(x = temp)



