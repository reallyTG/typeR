library(plotrix)


### Name: sizetree
### Title: Display a hierarchical breakdown of disjunct categories
### Aliases: sizetree
### Keywords: misc

### ** Examples

 cat1<-factor(sample(c("None","Low","Medium","High","Extreme"),40,TRUE),
  levels=c("None","Low","Medium","High","Extreme"))
 cat2<-factor(sample(c("None","Low","Medium","High"),40,TRUE),
  levels=c("None","Low","Medium","High"))
 cat3<-factor(sample(c("None","Low","High"),40,TRUE),
  levels=c("None","Low","High"))
 hcats<-data.frame(cat1,cat2,cat3)
 # throw in a few NAs
 hcats$cat1[10]<-NA
 hcats$cat2[c(15,20)]<-NA
 hcats$cat3[c(11,14,25)]<-NA
 # first let sizetree work out the colors
 sizetree(hcats,main="Sizetree with automatic colors")
 # now see what happens with a list of the same colors for each level
 bhcol<-c("#ff8080","#dddd80","#80ff80","#0000ff","#80dddd")
 sizetree(hcats,col=list(bhcol,bhcol,bhcol),
  main="Sizetree with the same colors each level")
 # finally, specify different colors for categories with different labels
 sexhaireye<-data.frame(sex=factor(sample(c("Male","Female"),50,TRUE)),
  hair=factor(sample(c("Blond","Red","Brown","Black"),50,TRUE)),
  eye=factor(sample(c("Gold","Green","Blue"),50,TRUE)))
 shecol<-list(c("pink","lightblue"),c("#000000","#dddd00","#886600","#ee8800"),
  c("blue","gold","green"))
 sizetree(sexhaireye,main="Sex, hair and eye color",
  col=shecol,toplab=c("Sex","Hair color","Eye color"))
 # now expand the female part of the sizetree
 sizetree(sexhaireye[sexhaireye[,1]=="Female",],
  main="Sex, hair and eye color (Females only)",
  col=shecol,toplab=c("Sex","Hair color","Eye color"))



