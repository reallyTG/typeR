library(GlobalDeviance)


### Name: expr.dev.test
### Title: Deviance Test
### Aliases: expr.dev.test

### ** Examples

## Not run: 
##D ### Example 1: poisson random data 
##D set.seed(6666)
##D n<-100
##D Y1<-c(rpois(n, 1))
##D Y2<-c(rpois(n/2, 1), rpois(n/2, 10))
##D A<-rnorm(n)
##D B<-c(rep(1, n/2), rep(0, n/2))       # group variable
##D C<-rpois(n, 1)
##D 
##D test.variables<-list("Y1", "Y2", c("Y1", "Y2"))
##D names(test.variables)<-c("Y1", "Y2", "Y1, Y2")
##D 
##D t.random<-expr.dev.test(xx=t(data.frame(Y1, Y2)), formula.full=~ A + B + C, 
##D 	formula.red=~ A + C, model.dat=data.frame(A, B, C), test.vars=test.variables, 
##D 	glm.family=poisson(link="log"), perm=1000, method="permutation", cf="fisher", 
##D 	snowfall.args=list(parallel=TRUE), snowfall.seed=54321)
##D 
##D summary(t.random, digits=3)
##D 
##D 
##D 
##D ### Example 2:  data set Rossi
##D data(Rossi)
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
##D 	D.red=NULL, model.dat, test.vars=test.vars, glm.family=poisson(link="log"), 
##D 	perm=100, method="permutation", cf="fisher")
##D 
##D t.rossi2<-expr.dev.test(xx=xx, formula.full=formula.full, formula.red=formula.red, 
##D 	D.red=NULL, model.dat, test.vars=test.vars, glm.family=poisson(link="log"), 
##D 	perm=100, method="chisqstat", cf="fisher")
##D 
##D summary(t.rossi1, digits=2)
##D 
##D summary(t.rossi2, digits=3)
##D 
## End(Not run)



