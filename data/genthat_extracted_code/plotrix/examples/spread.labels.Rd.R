library(plotrix)


### Name: spread.labels
### Title: Spread labels for irregularly spaced values
### Aliases: spread.labels
### Keywords: misc

### ** Examples

 # spread labels out in the x dimension using defaults
 x<-sort(rnorm(10))
 y<-rnorm(10)/10
 plot(x,y,ylim=c(-1,1),type="p")
 nums<-c("one","two","three","four","five","six","seven","eight","nine","ten")
 spread.labels(x,y,nums)
 # food preferences of children by sex (Cooke & Wardle, 2005)
 fpkids<-data.frame(Food=c("Fatty/sugary","Fruit","Starchy","Meat",
  "Proc.meat","Eggs","Fish","Dairy","Vegetables"),
  Female=c(4.21,4.22,3.98,3.57,3.55,3.46,3.34,3.26,3.13),
  Male=c(4.35,4.13,4.02,3.9,3.81,3.64,3.45,3.27,2.96))
 plot(rep(1,9),fpkids$Female,xlim=c(0.8,2.2),
  ylim=range(c(fpkids$Female,fpkids$Male)),xlab="Sex",xaxt="n",
  ylab="Preference rating",main="Children's food preferences by sex",
  col="red")
 axis(1,at=1:2,labels=c("Female","Male"))
 points(rep(2,9),fpkids$Male,col="blue",pch=2)
 spread.labels(rep(1:2,each=9),c(fpkids$Female,fpkids$Male),
  fpkids$Food,between=TRUE,linecol=c("red","blue"))



