library(archdata)


### Name: DartPoints
### Title: Five dart point types from Fort Hood, Texas, U.S.A.
### Aliases: DartPoints
### Keywords: datasets

### ** Examples

data(DartPoints)
boxplot(Length~Name, DartPoints)
plot(Width~Length, DartPoints, pch=as.numeric(Name), main="FOrt Hood Dart Points")
legend("topleft", levels(DartPoints$Name), pch=1:5)



