library(sybil)


### Name: modelorg-class
### Title: Structure of Class "modelorg"
### Aliases: modelorg-class modelorg allGenes<-,modelorg-method
###   allGenes,modelorg-method allGenes<- allGenes
###   comp_attr<-,modelorg-method comp_attr,modelorg-method comp_attr<-
###   comp_attr dim,modelorg-method genes<-,modelorg-method
###   genes,modelorg-method genes<- genes gpr<-,modelorg-method
###   gpr,modelorg-method gpr<- gpr gprRules<-,modelorg-method
###   gprRules,modelorg-method gprRules<- gprRules lowbnd<-,modelorg-method
###   lowbnd,modelorg-method lowbnd<- lowbnd met_attr<-,modelorg-method
###   met_attr,modelorg-method met_attr<- met_attr
###   met_comp<-,modelorg-method met_comp,modelorg-method met_comp<-
###   met_comp met_de<-,modelorg-method met_de,modelorg-method met_de<-
###   met_de met_id<-,modelorg-method met_id,modelorg-method met_id<-
###   met_id met_name<-,modelorg-method met_name,modelorg-method met_name<-
###   met_name met_num<-,modelorg-method met_num,modelorg-method met_num<-
###   met_num met_single<-,modelorg-method met_single,modelorg-method
###   met_single<- met_single mod_attr<-,modelorg-method
###   mod_attr,modelorg-method mod_attr<- mod_attr
###   mod_compart<-,modelorg-method mod_compart,modelorg-method
###   mod_compart<- mod_compart mod_desc<-,modelorg-method
###   mod_desc,modelorg-method mod_desc<- mod_desc mod_id<-,modelorg-method
###   mod_id,modelorg-method mod_id<- mod_id mod_key<-,modelorg-method
###   mod_key,modelorg-method mod_key<- mod_key mod_name<-,modelorg-method
###   mod_name,modelorg-method mod_name<- mod_name
###   obj_coef<-,modelorg-method obj_coef,modelorg-method obj_coef<-
###   obj_coef printObjFunc,modelorg-method printObjFunc
###   react_attr<-,modelorg-method react_attr,modelorg-method react_attr<-
###   react_attr react_de<-,modelorg-method react_de,modelorg-method
###   react_de<- react_de react_id<-,modelorg-method
###   react_id,modelorg-method react_id<- react_id
###   react_name<-,modelorg-method react_name,modelorg-method react_name<-
###   react_name react_num<-,modelorg-method react_num,modelorg-method
###   react_num<- react_num react_rev<-,modelorg-method
###   react_rev,modelorg-method react_rev<- react_rev
###   react_single<-,modelorg-method react_single,modelorg-method
###   react_single<- react_single rxnGeneMat<-,modelorg-method
###   rxnGeneMat,modelorg-method rxnGeneMat<- rxnGeneMat
###   show,modelorg-method S<-,modelorg-method S,modelorg-method S<- S
###   Snnz,modelorg-method Snnz subSys<-,modelorg-method
###   subSys,modelorg-method subSys<- subSys uppbnd<-,modelorg-method
###   uppbnd,modelorg-method uppbnd<- uppbnd version<-,modelorg-method
###   version,modelorg-method version<- version react-class react
###   comp_attr,react-method comp_attr comp_attr<-,react-method comp_attr<-
###   genes,react-method genes genes<-,react-method genes<-
###   gpr,react-method gpr gpr<-,react-method gpr<- gprRule,react-method
###   gprRule gprRule<-,react-method gprRule<- lowbnd,react-method lowbnd
###   lowbnd<-,react-method lowbnd<- met_attr,react-method met_attr
###   met_attr<-,react-method met_attr<- met_comp,react-method met_comp
###   met_comp<-,react-method met_comp<- met_id,react-method met_id
###   met_id<-,react-method met_id<- met_name,react-method met_name
###   met_name<-,react-method met_name<- mod_attr,react-method mod_attr
###   mod_attr<-,react-method mod_attr<- obj_coef,react-method obj_coef
###   obj_coef<-,react-method obj_coef<- react_attr,react-method react_attr
###   react_attr<-,react-method react_attr<- react_de,react-method react_de
###   react_de<-,react-method react_de<- react_id,react-method react_id
###   react_id<-,react-method react_id<- react_name,react-method react_name
###   react_name<-,react-method react_name<- react_rev,react-method
###   react_rev react_rev<-,react-method react_rev<-
###   react_single,react-method react_single react_single<-,react-method
###   react_single<- s,react-method s s<-,react-method s<-
###   subSys,react-method subSys subSys<-,react-method subSys<-
###   uppbnd,react-method uppbnd uppbnd<-,react-method uppbnd<-
### Keywords: classes

### ** Examples

  showClass("modelorg")

  ## print human readable version of the objective function
  data(Ec_core)
  printObjFunc(Ec_core)

  ## change objective function and print
  Ec_objf <- changeObjFunc(Ec_core, c("EX_etoh(e)", "ETOHt2r"), c(1, 2))
  printObjFunc(Ec_objf)



