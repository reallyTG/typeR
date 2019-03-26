library(BSDA)


### Name: Degree
### Title: Percent of bachelor's degrees awarded women in 1970 versus 1990
### Aliases: Degree
### Keywords: datasets

### ** Examples


T1 <- xtabs(~field + awarded, data = Degree)
T1
barplot(t(T1), beside = TRUE, col = c("red", "skyblue"), legend = colnames(T1))
rm(T1)




