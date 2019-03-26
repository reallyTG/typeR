library(ACSWR)


### Name: hearing
### Title: Hearing Loss Data
### Aliases: hearing
### Keywords: principal component analysis

### ** Examples

data(hearing)
round(cor(hearing[,-1]),2)
round(cov(hearing[,-1]),2)
hearing.pc <- princomp(hearing[,-1])
screeplot(hearing.pc,main="B: Scree Plot for Hearing Loss Data")



