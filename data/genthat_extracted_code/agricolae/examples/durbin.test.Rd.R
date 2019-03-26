library(agricolae)


### Name: durbin.test
### Title: Durbin test and multiple comparison of treatments
### Aliases: durbin.test
### Keywords: nonparametric

### ** Examples

library(agricolae)
# Example 1. Conover, pag 391
person<-gl(7,3)
variety<-c(1,2,4,2,3,5,3,4,6,4,5,7,1,5,6,2,6,7,1,3,7)
preference<-c(2,3,1,3,1,2,2,1,3,1,2,3,3,1,2,3,1,2,3,1,2)
out<-durbin.test(person,variety,preference,group=TRUE,console=TRUE,
main="Seven varieties of ice cream manufacturer")
#startgraph
bar.group(out$groups,horiz=TRUE,xlim=c(0,10),density=4,las=1)
#endgraph
# Example 2. Myles Hollander, pag 311
# Source: W. Moore and C.I. Bliss. 1942
day<-gl(7,3)
chemical<-c("A","B","D","A","C","E","C","D","G","A","F","G","B","C","F",
 "B","E","G","D","E","F")
toxic<-c(0.465,0.343,0.396,0.602,0.873,0.634,0.875,0.325,0.330,0.423,0.987,
0.426,0.652,1.142,0.989,0.536,0.409,0.309,0.609,0.417,0.931)
out<-durbin.test(day,chemical,toxic,group=TRUE,console=TRUE,
main="Logarithm of Toxic Dosages")
plot(out)



