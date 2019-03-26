library(IPMpack)


### Name: dataIPMpackSilwood
### Title: Silwood Monocarp Dataset
### Aliases: dataIPMpackSilwood
### Keywords: datasets

### ** Examples

data(dataIPMpackSilwood)
print(head(dataIPMpackSilwood))
plot(dataIPMpackSilwood$rtcr,dataIPMpackSilwood$rtcrNext,
xlab="size now", ylab="size next", pch=19,log="xy")
## maybe str(dataIPMpackSilwood) ; plot(dataIPMpackSilwood) ...



