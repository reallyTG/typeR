library(catspec)


### Name: ctab
### Title: Percentage tables
### Aliases: ctab print.ctab summary.ctab
### Keywords: category

### ** Examples

ftable(Titanic)
ctab(Titanic) # same output
ctab(Titanic,type="r")
ctab(Titanic,type=c("n","r"),addmargins=TRUE)
ctab(Titanic,type=c("n","c","t","r"),style="w")
mytab<-ftable(Titanic,row.vars=c(1,3),type="r")
mytab
ctab(mytab)
newtab<-ctab(mytab,type="r")
newtab
summary(newtab)

#second example using a data frame rather than table data
library(survival)
data(logan)
attach(logan)
class(logan) #"data.frame"
ctab(occupation)
ctab(occupation,addmargins=TRUE)
ctab(occupation,style="w",type="c")
ctab(occupation,style="l",type="n")
z<-ctab(occupation,addmargins=TRUE,style="l")
z
print(z,addmargins=FALSE,dec.places=5)
summary(z)

t<-ctab(focc,occupation,type=c("n","r","c"))
t
summary(t)



