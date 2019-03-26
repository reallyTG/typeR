library(Sleuth2)


### Name: case1601
### Title: Sites of Short- and Long-Term Memory
### Aliases: case1601
### Keywords: datasets

### ** Examples

str(case1601)

# short-term response
short <- with(case1601, (Week2 + Week4)/2)
# long-term response
long <- with(case1601, (Week8 + Week12 + Week16)/3)
# Multivariate analysis of variance
mfit <- manova(cbind(short,long) ~ Treatment, case1601) 
summary(mfit)



