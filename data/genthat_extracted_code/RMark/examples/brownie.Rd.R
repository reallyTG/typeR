library(RMark)


### Name: brownie
### Title: San Luis Valley mallard data
### Aliases: brownie
### Keywords: datasets

### ** Examples

# brownie=import.chdata("brownie.inp",field.types=c("n","f"))
## No test: 
# This example is excluded from testing to reduce package check time
 data(brownie)
# default ordering of ReleaseAge is alphabetic so it is 
# Adult, Young which is why initial.ages=c(1,0)
# Seber Recovery
br=process.data(brownie,model="Recovery",groups="ReleaseAge",age.var=1,initial.ages=c(1,0))
br.ddl=make.design.data(br,parameters=list(S=list(age.bins=c(0,1,10)),
                                           r=list(age.bins=c(0,1,10))),right=FALSE)
mod=mark(br,br.ddl,model.parameters=list(S=list(formula=~-1+age:time,link="sin"),
                                           r=list(formula=~-1+age:time,link="sin")))
# Brownie Recovery
br=process.data(brownie,model="Brownie",groups="ReleaseAge",age.var=1,initial.ages=c(1,0))
br.ddl=make.design.data(br,parameters=list(S=list(age.bins=c(0,1,10)),
                               f=list(age.bins=c(0,1,10))),right=FALSE)
mod=mark(br,br.ddl,model.parameters=list(S=list(formula=~-1+age:time,link="sin"),
                               f=list(formula=~-1+age:time,link="sin")))
mod=mark(br,br.ddl,model.parameters=list(S=list(formula=~-1+age,link="sin"),
                               f=list(formula=~-1+age,link="sin")))
#Random effects Seber recovery
br=process.data(brownie,model="REDead",groups="ReleaseAge",age.var=1,initial.ages=c(1,0))
br.ddl=make.design.data(br,parameters=list(S=list(age.bins=c(0,1,10)),
                                       r=list(age.bins=c(0,1,10))),right=FALSE)
mod=mark(br,br.ddl,model.parameters=list(S=list(formula=~age),r=list(formula=~age)))
#Pledger Mixture Seber recovery
br=process.data(brownie,model="PMDead",groups="ReleaseAge",
                           mixtures=3,age.var=1,initial.ages=c(1,0))
br.ddl=make.design.data(br,parameters=list(S=list(age.bins=c(0,1,10)),
                            r=list(age.bins=c(0,1,10))),right=FALSE)
mod=mark(br,br.ddl,model.parameters=list(pi=list(formula=~mixture),
                     S=list(formula=~age+mixture),r=list(formula=~age)))
br=process.data(brownie,model="PMDead",groups="ReleaseAge",
                     mixtures=2,age.var=1,initial.ages=c(1,0))
br.ddl=make.design.data(br,parameters=list(S=list(age.bins=c(0,1,10)),
                      r=list(age.bins=c(0,1,10))),right=FALSE)
mod=mark(br,br.ddl,model.parameters=list(pi=list(formula=~age),
                      S=list(formula=~age+mixture),r=list(formula=~age)))
## End(No test)



