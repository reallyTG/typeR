library(mets)


### Name: dsort
### Title: Sort data frame
### Aliases: dsort dsort<-

### ** Examples

data(data="hubble",package="lava")
dsort(hubble, "sigma")
dsort(hubble, hubble$sigma,"v")
dsort(hubble,~sigma+v)
dsort(hubble,~sigma-v)

## with direct asignment
dsort(hubble) <- ~sigma-v



