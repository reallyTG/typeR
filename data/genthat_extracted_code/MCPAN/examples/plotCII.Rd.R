library(MCPAN)


### Name: plotCII
### Title: Plot confidence intervals
### Aliases: plotCII
### Keywords: hplot

### ** Examples



est<-c(1,2,3)
names(est)<-c("A", "B", "C")
lw=c(0,1,2)
up=c(2,3,4)

plotCII(estimate=est, lower=lw, upper=up)


plotCII(estimate=est, lower=lw, upper=up,
lines=c(-1,0,1),
lineslty=c(3,1,3),
lineslwd=c(1,2,1))

###########

names(est)<-c("very long names",
 "e v e n  l o n g e r  n a m e s", "C")

plotCII(estimate=est, lower=lw, upper=up,
 CIcol=c("black","green","red"),
 HL=TRUE
)

###########


names(est)<-c("very long names", 
 "e v e n  l o n g e r  n a m e s", "C")

plotCII(estimate=est, lower=lw, upper=up,
 CIcol=c("black","green","red"),
 HL=TRUE
)

op<-par(no.readonly = TRUE)

layout(matrix(1:2, ncol=1))

par(mar=c(5,14,3,1))

plotCII(estimate=est, lower=lw, upper=up,
 main="Lala 1",
 CIcol=c("black","green","red"),
 lines=-1,
 HL=FALSE
)


plotCII(estimate=est, lower=lw, upper=up,
 main="Lala 2",
 CIcol=c("black","green","red"),
 lines=c(0,1),
 HL=FALSE
)

par(op)





