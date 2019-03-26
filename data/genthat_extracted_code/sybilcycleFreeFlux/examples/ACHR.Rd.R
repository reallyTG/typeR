library(sybilcycleFreeFlux)


### Name: ACHR
### Title: Random Sampling of Solution Space
### Aliases: ACHR
### Keywords: Random Sampling loopless Sampling

### ** Examples

## Not run: 
##D ##---- Should be DIRECTLY executable !! ----
##D ##-- ==>  Define data, use random,
##D ##--	or do  help(data=index)  for the standard data sets.
##D library(sybilcycleFreeFlux)
##D data(Ec_core);
##D model=Ec_core;
##D solver="cplexAPI"
##D W=500
##D nPnts=1000
##D s1=ACHR(model,W,nPoints=nPnts,stepsPerPoint=10)
##D 
##D 
##D sFVA=fluxVar(model,solver=solver) 
##D fva_min=sFVA@lp_obj[(c(1:length(react_id(model))))];
##D fva_max=sFVA@lp_obj[(c((length(react_id(model))+1):(2*length(react_id(model)))) )];
##D table(lp_stat(sFVA))
##D 
##D pnts=s1$Points
##D fvamin=apply(pnts,1,min)
##D fvamax=apply(pnts,1,max)
##D 
##D write.csv(file="fva.csv",cbind(fva_min,fvamin,fva_max,fvamax,lb=lowbnd(model),
##D ub=uppbnd(model)))
##D #####Plot samples
##D bmrxn=which(obj_coef(model)==1)
##D bmrow=S(model)[bmrxn,]
##D 
##D objvals=NULL
##D solver="glpkAPI"
##D nRxns=react_num(model);
##D llpnts=  matrix(rep(0,nRxns*nPnts),ncol=nPnts);
##D for(i in 1:nPnts){
##D 	objvals=rbind(objvals,obj= pnts[bmrxn,i])
##D 	lrf=lrFBA(model,wtflux=pnts[,i],solver=solver,objVal= pnts[bmrxn,i])
##D 	llpnts[,i]=lrf$fluxes;
##D #Sys.time()
##D 	print(sprintf("point %d:%f",i,objvals[i]))
##D }
##D llfvamin=apply(llpnts,1,min)
##D llfvamax=apply(llpnts,1,max)
##D 
##D  write.csv(file="objv.csv",objvals)
##D write.csv(file="llfva.csv",cbind(fva_min,llmin=llfvamin,fva_max,llmax=llfvamax,fvamin,
##D fvamax,lb=lowbnd(model),ub=uppbnd(model)))
##D nloopflux=NULL
##D loopflxll=NULL
##D loopflxlp=NULL
##D 
##D for(i in (1:length(react_id(model))))
##D 	for(j in (1:nPnts)){
##D 	#print(c(i,j))
##D 		if(abs(pnts[i,j]-llpnts[i,j])<1e-7){
##D 			nloopflux=c(nloopflux,pnts[i,j])
##D 		}else{
##D 		loopflxll=c(loopflxll,llpnts[i,j])
##D 		loopflxlp=c(loopflxlp,pnts[i,j])
##D 		}
##D 	}
##D layout(matrix(c(1,2,3,1,2,3), 2, 3, byrow = TRUE))
##D hist(log10(abs(loopflxlp)),col="lightblue",main="a-loop fluxes",xlim=c(-3,3),
##D xlab="Log10(flux)")
##D hist(log10(abs(loopflxll)),col="orange",main="b-using cycleFreeFlux",
##D xlim=c(-3,3),xlab="Log10(flux)")
##D hist(log10(abs(nloopflux)),col="lightgreen",main="c-non-loop fluxes",
##D xlim=c(-3,3),xlab="Log10(flux)")
##D 
## End(Not run)



