library(GlobalDeviance)


### Name: Rossi
### Title: Dataset 'Rossi'
### Aliases: Rossi
### Keywords: datasets

### ** Examples

## Not run: 
##D ### prepares the dataset 'Rossi' for the package 'GlobalDeviance'
##D setwd(...)
##D 
##D Rossi<-read.table("Rossi.txt", header=TRUE)
##D 
##D Rossi$n.work.weeks<-rowSums(Rossi[, grepl("emp[0-90-9]", names(Rossi))], na.rm=TRUE)
##D 
##D save(Rossi, file="Rossi.rda")
##D 
##D 
##D 
##D ### load dataset 'Rossi'
##D data(Rossi)
##D 
##D str(Rossi)
##D 
##D names(Rossi)
##D 
##D # Covariables (patients x covariables)
##D model.dat<-Rossi[, c("arrest", "fin", "wexp")]
##D str(model.dat)
##D 
##D # data (variables/genes x patients)
##D xx<-rbind(t(t(t(Rossi[, c("prio", "n.work.weeks")]))), rpois(432, 1))
##D rownames(xx)<-c("prio", "n.work.weeks", "random")
##D 
##D formula.full<- ~ arrest + fin + wexp
##D formula.red<- ~ arrest + fin
##D 
##D test.vars<-list("prio", "n.work.weeks", "random", c("prio", "n.work.weeks"), 
##D 	c("prio", "n.work.weeks", "random"))
##D names(test.vars)<-c("prio", "n.work.weeks", "random", "prio+n.work.weeks", 
##D 	"prio+n.work.weeks+random")
##D 
##D set.seed(54321)
##D 
##D t.rossi1<-expr.dev.test(xx=xx, formula.full=formula.full, formula.red=formula.red, 
##D 	model.dat=model.dat, test.vars=test.vars, glm.family=poisson(link="log"), 
##D 	perm=100, method="permutation", cf="fisher")
##D 
##D t.rossi2<-expr.dev.test(xx=xx, formula.full=formula.full, formula.red=formula.red, 
##D 	 model.dat=model.dat, test.vars=test.vars, glm.family=poisson(link="log"), 
##D 	perm=100, method="chisqstat", cf="fisher")
##D 
##D summary(t.rossi1, digits=2)
##D 
##D summary(t.rossi2, digits=3)
## End(Not run)



