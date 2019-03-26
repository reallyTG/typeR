library(ezsim)


### Name: generate.parameterDef
### Title: Generate Parameter
### Aliases: generate.parameterDef

### ** Examples

par_def1<-createParDef(selection=list(mean=1,sd=2,n=seq(10,50,10)))
generate(par_def1)
par_def2<-createParDef(selection=list(sd=2,mean=1:3,n=seq(10,50,10)))
generate(par_def2)



