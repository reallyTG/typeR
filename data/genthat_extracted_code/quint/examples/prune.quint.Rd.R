library(quint)


### Name: prune.quint
### Title: Pruning of a Qualitative Interaction Tree
### Aliases: prune.quint
### Keywords: tree

### ** Examples

data(bcrp)
formula2 <- I(cesdt1-cesdt3)~cond |age+trext++uncomt1+ disopt1+negsoct1
#Adjust the control parameters only to save computation time in the example;
#The default control parameters are preferred
control2 <- quint.control(maxl=5,B=2)
set.seed(2) #this enables you to repeat the results of the bootstrap procedure
quint2 <- quint(formula2, data= subset(bcrp,cond<3),control=control2)
quint2pr <- prune(quint2)
summary(quint2pr)




