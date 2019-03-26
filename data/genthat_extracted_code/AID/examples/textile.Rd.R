library(AID)


### Name: textile
### Title: Textile Data
### Aliases: textile
### Keywords: datasets

### ** Examples


library(AID)

data(textile)
hist(textile[,1])
out <- boxcoxnc(textile[,1])
confInt(out)



