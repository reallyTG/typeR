library(FSA)


### Name: CodNorwegian
### Title: Stock and recruitment data for Norwegian cod, 1937-1960.
### Aliases: CodNorwegian
### Keywords: datasets

### ** Examples

str(CodNorwegian)
head(CodNorwegian)
op <- par(mfrow=c(1,2),pch=19,mar=c(3,3,0.5,0.5),mgp=c(1.9,0.5,0),tcl=-0.2)
plot(recruits~year,data=CodNorwegian,type="l")
plot(recruits~stock,data=CodNorwegian)
par(op)




