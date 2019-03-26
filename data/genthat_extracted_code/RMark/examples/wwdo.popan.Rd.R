library(RMark)


### Name: wwdo.popan
### Title: White-winged dove Jolly-Seber POPAN Analysis Details
### Aliases: wwdo.popan wwdo.09 wwdo.10
### Keywords: datasets

### ** Examples


## No test: 
# This example is excluded from testing to reduce package check time
data(wwdo.09)
wwdo=wwdo.09
wwdo.popan=function(){
wwdo.proc=process.data(wwdo, model="POPAN", groups="Age")
wwdo.ddl=make.design.data(wwdo.proc)

#Fixing Phi Parameters for sampling periods where HY WWDO were not available in population
	hy.phi1=as.numeric(row.names(wwdo.ddl$Phi[wwdo.ddl$Phi$group=="HY" & 
                      wwdo.ddl$Phi$time==1,]))
	hy.phi2=as.numeric(row.names(wwdo.ddl$Phi[wwdo.ddl$Phi$group=="HY" &
                      wwdo.ddl$Phi$time==2,]))
	hy.phi3=as.numeric(row.names(wwdo.ddl$Phi[wwdo.ddl$Phi$group=="HY" & 
                      wwdo.ddl$Phi$time==3,]))
	hy.phi4=as.numeric(row.names(wwdo.ddl$Phi[wwdo.ddl$Phi$group=="HY" & 
                      wwdo.ddl$Phi$time==4,]))
	hy.phi5=as.numeric(row.names(wwdo.ddl$Phi[wwdo.ddl$Phi$group=="HY" & 
                      wwdo.ddl$Phi$time==5,]))
	hy.phi6=as.numeric(row.names(wwdo.ddl$Phi[wwdo.ddl$Phi$group=="HY" & 
                      wwdo.ddl$Phi$time==6,]))
	hy.phi7=as.numeric(row.names(wwdo.ddl$Phi[wwdo.ddl$Phi$group=="HY" & 
                      wwdo.ddl$Phi$time==7,]))
	hy.phi.fix=c(hy.phi1, hy.phi2, hy.phi3, hy.phi4, hy.phi5, hy.phi6, hy.phi7)
	
#Fixing PENT Parameters for sampling period where HY WWDO were not available in population
	hy.pent2=as.numeric(row.names(wwdo.ddl$pent[wwdo.ddl$pent$group=="HY" & 
                       wwdo.ddl$pent$time==2,]))
	hy.pent3=as.numeric(row.names(wwdo.ddl$pent[wwdo.ddl$pent$group=="HY" & 
                       wwdo.ddl$pent$time==3,]))
	hy.pent4=as.numeric(row.names(wwdo.ddl$pent[wwdo.ddl$pent$group=="HY" & 
                       wwdo.ddl$pent$time==4,]))
	hy.pent5=as.numeric(row.names(wwdo.ddl$pent[wwdo.ddl$pent$group=="HY" & 
                       wwdo.ddl$pent$time==5,]))
	hy.pent6=as.numeric(row.names(wwdo.ddl$pent[wwdo.ddl$pent$group=="HY" & 
                       wwdo.ddl$pent$time==6,]))
	hy.pent7=as.numeric(row.names(wwdo.ddl$pent[wwdo.ddl$pent$group=="HY" & 
                       wwdo.ddl$pent$time==7,]))
	hy.pent.fix=c(hy.pent2, hy.pent3, hy.pent4, hy.pent5, hy.pent6, hy.pent7)
	
#####
#Real Parameter Definitions
#####
#Detection process
	p.dot=list(formula=~1)
	p.time=list(formula=~time)
	p.group=list(formula=~group)
	p.g.time=list(formula=~group:time)
	
#Survival process
	Phi.dot.fix=list(formula=~1, fixed=list(index=hy.phi.fix, value=c(0,0,0,0,0,0,0)))
	Phi.time.fix=list(formula=~time, fixed=list(index=hy.phi.fix, value=c(0,0,0,0,0,0,0)))
	Phi.age.fix=list(formula=~group, fixed=list(index=hy.phi.fix, value=c(0,0,0,0,0,0,0)))
	Phi.timeage.fix=list(formula=~time:group, 
     fixed=list(index=hy.phi.fix, value=c(0,0,0,0,0,0,0)))
	
#Entry Process-always time dependent, otherwise makes no sense in my situation
	pent.time.fix=list(formula=~time, fixed=list(index=hy.pent.fix, value=c(0,0,0,0,0,0)))
	
	Model.1=mark(wwdo.proc, wwdo.ddl, 
   model.parameters=list(Phi=Phi.dot.fix, p=p.dot, pent=pent.time.fix, N=list(formula=~group)),
   invisible=FALSE)
	Model.2=mark(wwdo.proc, wwdo.ddl, 
  model.parameters=list(Phi=Phi.time.fix, p=p.dot, pent=pent.time.fix, N=list(formula=~group)),
   invisible=FALSE)
	Model.3=mark(wwdo.proc, wwdo.ddl, 
  model.parameters=list(Phi=Phi.age.fix, p=p.dot, pent=pent.time.fix, N=list(formula=~group)), 
    invisible=FALSE)
	Model.4=mark(wwdo.proc, wwdo.ddl, 
  model.parameters=list(Phi=Phi.timeage.fix, p=p.dot, pent=pent.time.fix, N=list(formula=~group)), 
    invisible=FALSE)
	Model.5=mark(wwdo.proc, wwdo.ddl,  
  model.parameters=list(Phi=Phi.timeage.fix, p=p.time, pent=pent.time.fix, N=list(formula=~group)), 
   invisible=FALSE)
	Model.6=mark(wwdo.proc, wwdo.ddl, 
   model.parameters=list(Phi=Phi.timeage.fix,p=p.g.time, pent=pent.time.fix,
              N=list(formula=~group)), 
   invisible=FALSE)
	collect.models()
}
wwdo.out=wwdo.popan()
wwdo.out
## End(No test)



