library(sybilccFBA)


### Name: cfba_moment_pw
### Title: Function: cfba_moment_pw: implement MOMENT method
### Aliases: cfba_moment_pw
### Keywords: FBA gene expression EFBA reaction

### ** Examples

## Not run: 
##D 	library(sybilccFBA)
##D 	data(iAF1260)
##D 	model= iAF1260
##D  	data(mw)
##D  	data(kcat)
##D  	 mod2=mod2irrev(model)
##D   
##D 	uppbnd(mod2)[react_id(mod2)=="R_EX_glc_e__b"]=1000
##D 	uppbnd(mod2)[react_id(mod2)=="R_EX_glyc_e__b"]=0
##D 	uppbnd(mod2)[react_id(mod2)=="R_EX_ac_e__b"]=0
##D 	uppbnd(mod2)[react_id(mod2)=="R_EX_o2_e__b"]=1000
##D 	lowbnd(mod2)[react_id(mod2)=="R_ATPM"]=0
##D 
##D   sol=cfba_moment(model,mod2,kcat,MW=mw,verbose=3,RHS=0.27,solver="glpkAPI",medval=3600*22.6) 
##D 
## End(Not run)



