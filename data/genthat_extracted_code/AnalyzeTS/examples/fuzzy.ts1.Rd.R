library(AnalyzeTS)


### Name: fuzzy.ts1
### Title: Chen, Sing, Heuristic and Chen-Hsu models
### Aliases: fuzzy.ts1

### ** Examples

#Print all of calculation results out to creen.
#par(mfrow=c(2,2))
#data(enrollment)
#fuzzy.ts1(enrollment,n=7,type="Chen",plot=TRUE,grid=TRUE)
#fuzzy.ts1(enrollment,n=7,type="Singh",plot=TRUE)
#fuzzy.ts1(enrollment,n=7,type="Heuristic",plot=TRUE,grid=TRUE)

#Only print fuzzy series out to creen.
#chen10<-fuzzy.ts1(lh,n=10,type="Chen")
#singh10<-fuzzy.ts1(lh,n=10,type="Singh")
#heuristic10<-fuzzy.ts1(lh,n=10,type="Heuristic")

#Useing ChenHsu.bin function to find divide point fuzzy set values.
#a<-fuzzy.ts1(lh,n=5,type="Chen-Hsu",plot=1)
#b<-ChenHsu.bin(a$table1,n.subset=c(1,2,1,1,1))
#chenhsu6<-fuzzy.ts1(lh,type="Chen-Hsu",bin=b,plot=1,trace=1)



