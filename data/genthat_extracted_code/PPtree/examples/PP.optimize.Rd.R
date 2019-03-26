library(PPtree)


### Name: PP.optimize
### Title: Find optimal projection by maximizing selected PP index
### Aliases: PP.optimize PP.optimize.random PP.optimize.anneal
###   PP.optimize.Huber PP.optimize.plot
### Keywords: optimize

### ** Examples

data(iris)

PP.opt<-PP.optimize.random("LDA",1,iris[,1:4],iris[,5],cooling=0.999,temp=1)

PP.opt$index.best
PP.optimize.plot(PP.opt,iris[,1:4],iris[,5])


PP.opt<-PP.optimize.anneal("LDA",1,iris[,1:4],iris[,5],cooling=0.999,temp=1,energy=0.01)
PP.opt$index.best

PP.optimize.plot(PP.opt,iris[,1:4],iris[,5])


PP.opt<-PP.optimize.Huber("LDA",2,iris[,1:4],iris[,5],cooling=0.999,r=1)
PP.opt$index.best
PP.optimize.plot(PP.opt,iris[,1:4],iris[,5])





