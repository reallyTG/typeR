library(processR)


### Name: makeIndirectEquation
### Title: Make indirect equation
### Aliases: makeIndirectEquation

### ** Examples

X="negemot";M="ideology"
temp1=c("a1*negemot","a2*sex","a4*negemot*sex","a5*negemot*age","a6*sex*age")
temp2="b1*ideology"
temp3="c1*negemot"
moderatorNames=c("age","sex")
X= "hp";M= "am"
temp1= c("a1*hp","a2*wt","a3*hp:wt")
temp2= "b1*am"
temp3= c("c1*hp","c2*wt","c3*hp:wt")
moderatorNames=c("wt")
X= c("d1","d2");M="am"
temp1=c("a1*d1","a2*d2","a3*wt","a4*d1:wt","a5*d2:wt")
temp2="b1*am"
temp3=c("c1*d1","c2*d2","c3*wt","c4*d1:wt","c5*d2:wt")
cat(makeIndirectEquation(X,M,temp1,temp2,temp3,moderatorNames))
cat(makeIndirectEquation(X,M,temp1,temp2,temp3,moderatorNames,range=TRUE))



