library(plotrix)


### Name: legendg
### Title: Legend with grouped bars, lines or symbols
### Aliases: legendg
### Keywords: misc

### ** Examples

 plot(0.5,0.5,xlim=c(0,1),ylim=c(0,1),type="n",
  main="Test of grouped legend function")
 legendg(0.5,0.8,c("one","two","three"),pch=list(1,2:3,4:6),
  col=list(1,2:3,4:6),pt.space=1.5)
 legendg(0.5,0.5,c("one","two","three"),fill=list(1,2:3,4:6))
 # fake a line/point with text points
 legendg(0.2,0.25,c("letter","number"),
  pch=list(c("-","A","-"),c("-","1","-")),
  col=list(rep(2,3),rep(3,3)))



