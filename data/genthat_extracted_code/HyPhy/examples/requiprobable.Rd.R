library(HyPhy)


### Name: requiprobable
### Title: Sample trees from an equiprobable labeled, semi-labeled or
###   unlabeled distribution
### Aliases: requiprobable

### ** Examples

##We are going to sample 10 labeled 10 unlabeled and 10 semi labeled 10 tip trees
labeled<-requiprobable(10,c("A1","A2","B1","B2","B3","C1","C2","C3","C4","C5"))
plot(labeled)

unlabeled<-requiprobable(10,"?",10)
plot(unlabeled)
##If you want to add tip labels to these trees
for (i in 1:10) unlabeled[[i]]$tip.label<-sample(c("A1","A2","B1","B2","B3","C1","C2","C3","C4","C5"))

semilabeled<-requiprobable(10,c("A","B","C"),c(2,3,5))
plot(semilabeled)



