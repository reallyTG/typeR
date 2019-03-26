library(GlobalFit)


### Name: GlobalFit-package
### Title: Bi-Level Optimization of Metabolic Network Models
### Aliases: GlobalFit-package GlobalFit

### ** Examples

## Not run: 
##D library(sybil)
##D library(GlobalFit)
##D library("cplexAPI")
##D SYBIL_SETTINGS("SOLVER", "cplexAPI")
##D #SYBIL_SETTINGS("SOLVER", "sybilGUROBI")
##D ###################
##D ##EXAMPLE1: RECONCILATION OF TWO FALSE PREDICTIONS
##D 
##D 
##D data(example_net1)
##D 
##D # names of reactions, which are not allowed to be removed
##D not_delete_for=c(react_id(findExchReact(example_net1)),"Biomass")
##D not_delete_back=c(react_id(findExchReact(example_net1)),"Biomass")
##D 
##D #set biomass object function
##D obj_coef(example_net1)[which(react_id(example_net1)=="Biomass")]=1
##D 
##D #create list of influxes
##D influxes=list()
##D influxes[[1]]=list(exRea="A[e]_import",value=-10)
##D 
##D #set influxes
##D lowbnd(example_net1)[pos=which(react_id(example_net1)=="A[e]_import")]=-10
##D 
##D #growth cases
##D on=list()
##D on[[1]]=list(on=influxes,name="LIVE!",ko_react=c("AtoB"),forced=TRUE,viability_threshold=1,
##D  gene_copy_number=1)
##D on[[2]]=list(on=influxes,name="LIVE!",ko_react=c("AtoB"),forced=TRUE,viability_threshold=1,
##D  gene_copy_number=1)
##D #non-growth cases
##D off=list()
##D off[[1]]=list(on=influxes,name="DIE!",ko_react=c("AtoR"),forced=FALSE,viability_threshold=1,
##D  gene_copy_number=1)
##D off[[2]]=list(on=influxes,name="DIE!",ko_react=c("AtoR"),forced=FALSE,viability_threshold=1,
##D  gene_copy_number=1)
##D #optional parameter list for solver, in this example for cplex
##D p_list=list(CPX_PARAM_THREADS=as.integer(1),CPX_PARAM_EPRHS=as.double(1e-9),
##D CPX_PARAM_NETEPRHS=as.double(1e-11),CPX_PARAM_EPINT=as.double(1e-09),
##D CPX_PARAM_TILIM=1e5,CPX_PARAM_PARALLELMODE=CPX_PARALLEL_OPPORTUNISTIC)
##D 
##D 
##D #create list of reactions, that are allowed to be reversed
##D reverse_reaction_list=list()
##D reverse_reaction_list[[1]]=list(reaction="AtoC",pen=1)
##D reverse_reaction_list[[2]]=list(reaction="TtoB",pen=1)
##D 
##D #create list of additional reactions
##D additional_reactions_list=list()
##D additional_reactions_list[[1]]=list(id="KtoB",name="KtoB reaction",eq="(2.1) K[e] => B[e]",pen=7)
##D additional_reactions_list[[2]]=list(id="TtoR",name="TtoR reaction",eq="T[e] <=> R[e] + Q[e]",pen=3)
##D additional_reactions_list[[3]]=list(id="CtoB",name="TtoQ reaction",eq="C[e] => B[e]",pen=5)
##D 
##D #create list of additional biomass metabolites
##D additional_biomass_mets=list()
##D additional_biomass_mets[[1]]=list(met="Q[e]",pen=0.1,factor=-1)
##D additional_biomass_mets[[2]]=list(met="R[e]",pen=0.1,factor=-1)
##D additional_biomass_mets[[3]]=list(met="B[e]",pen=0.1,factor=-1)
##D 
##D #create list of biomass metabolites, that are allowed to be removed
##D remove_biomass_mets=list()
##D remove_biomass_mets[[1]]=list(met="S[e]",pen=40.1)
##D remove_biomass_mets[[2]]=list(met="T[e]",pen=0.1)
##D remove_biomass_mets[[3]]=list(met="Z[e]",pen=0.1)
##D 
##D #set penalties for removing reactions (network contains nine reactions, so we have to set 9 values)
##D remove_penalties_hin=c(1,2.5,3,4,5,6,7,8,9)
##D remove_penalties_back=c(1,2.5,3,4,5,6,7,8,9)
##D 
##D opt_net=bilevel_optimize(network=example_net1,on=on,off=off,algorithm=1,
##D additional_reactions=additional_reactions_list,not_delete_for=not_delete_for,
##D not_delete_back=not_delete_back,minimize=FALSE,simple=FALSE,verboseMode=1,
##D param_list=p_list,cancel_case_penalty=NULL,use_indicator_constraints=FALSE,
##D stat_file=NULL,react_file=NULL,remove_penalties_hin=remove_penalties_hin,
##D remove_penalties_back=remove_penalties_back,reverse_reaction_list=reverse_reaction_list,
##D alternatives=0,MaxPenalty=NULL,additional_biomass_metabolites=additional_biomass_mets,
##D remove_biomass_metabolites=remove_biomass_mets,variable_lower_bound=NULL,forced_modifications=0)
##D 
##D 
##D 
##D ##############
##D ##EXAMPLE2: NETWORK CONTAINS THERMODYNAMIC INFEASIBLE CYCLES
##D # (CYC1 AND CYC2 CAN CARRY FLUX WITHOUT ANY INFLUX); 
##D # WE USE GLOBALFIT AND DIFFERENT BIOMASS OBEJCTIVE FUNCTIONS 
##D # FOR THE GROWTH AND NON-GROWTH CASE
##D 
##D data(example_net2)
##D 
##D 
##D #set wild type biomass object function
##D obj_coef(example_net2)[which(react_id(example_net2)=="Biomass")]=1
##D 
##D #create 2 lists of influxes (one list is empty)
##D influxes=list()
##D influxes[[1]]=list(exRea="T[e]_import",value=-10)
##D 
##D influxes2=list()
##D 
##D #set influxes for wild type
##D lowbnd(example_net2)[pos=which(react_id(example_net2)=="T[e]_import")]=-10
##D 
##D #growth cases with wild type biomass
##D on=list()
##D on[[1]]=list(on=influxes,name="LIVE!",ko_react=c(),forced=TRUE,viability_threshold=1,
##D  gene_copy_number=1,biomass="Biomass")
##D 
##D #non-growth cases with different biomass ("CYC1","CYC2")
##D off=list()
##D off[[1]]=list(on=influxes,name="DIE!",ko_react=c(),forced=FALSE,viability_threshold=1,
##D  gene_copy_number=1,biomass=c("CYC1","CYC2"))
##D  
##D # no alternative modifications allowed
##D reverse_reaction_list=list()
##D additional_reactions_list=list()
##D additional_biomass_mets=list()
##D remove_biomass_mets=list()
##D  
##D # names of reactions, which are not allowed to be removed, including the cycle reactions
##D not_delete_for=c(react_id(findExchReact(example_net2)),"Biomass","CYC1","CYC2")
##D not_delete_back=c(react_id(findExchReact(example_net2)),"Biomass","CYC1","CYC2")
##D 
##D 
##D 
##D 
##D opt_net=bilevel_optimize(network=example_net2,on=on,off=off,algorithm=3,
##D additional_reactions=additional_reactions_list,not_delete_for=not_delete_for,
##D not_delete_back=not_delete_back,minimize=FALSE,simple=FALSE,verboseMode=1,
##D param_list=p_list,cancel_case_penalty=NULL,use_indicator_constraints=FALSE,
##D stat_file=NULL,react_file=NULL,reverse_reaction_list=reverse_reaction_list,
##D alternatives=0,MaxPenalty=NULL,additional_biomass_metabolites=additional_biomass_mets,
##D remove_biomass_metabolites=remove_biomass_mets,
##D variable_lower_bound=NULL,forced_modifications=0)
##D 
##D 
##D 
##D 
##D 
##D ##########################
##D ##EXAMPLE3: NON-GROWTH CASE CAN ONLY BE RESOLVED BY CHANGING THE LOWER BOUND OF AN INFLUX 
##D #(ONLY WORKS WITH THE SLOWER IMPLEMENTATION OF GLOBALFIT; ALGORITHM=2). 
##D #THIS CAN BE USED TO FIND SUITABLE QUALITATIVE MEDIA COMPOSITIONS. 
##D #NOTE IN THIS SIMPLE EXAMPLE THE VIABILITY THRESHOLD 
##D #OF THE NON-GROWTH CASE IS HIGHER THAN THE GROWTH CASE
##D 
##D data(example_net3)
##D 
##D 
##D # names of reactions, which are not allowed to be removed
##D not_delete_for=c(react_id(findExchReact(example_net3)),"Biomass")
##D not_delete_back=c(react_id(findExchReact(example_net3)),"Biomass")
##D 
##D #set wild type biomass object function
##D obj_coef(example_net3)[which(react_id(example_net3)=="Biomass")]=1
##D 
##D #create 2 lists of influxes (one list is empty)
##D influxes=list()
##D influxes[[1]]=list(exRea="T[e]_import",value=-100)
##D 
##D influxes2=list()
##D 
##D #set influxes for wild type
##D lowbnd(example_net3)[pos=which(react_id(example_net3)=="T[e]_import")]=-100
##D 
##D #growth cases with wild type biomass
##D on=list()
##D on[[1]]=list(on=influxes,name="LIVE!",ko_react=c(),forced=TRUE,viability_threshold=1,
##D  gene_copy_number=1)
##D 
##D #non-growth cases with different biomass(A[e]_imoprt)
##D off=list()
##D off[[1]]=list(on=influxes,name="DIE!",ko_react=c(),forced=FALSE,viability_threshold=2,
##D  gene_copy_number=1)
##D 
##D ## set varying_lower_bound; T[e]_import is allowed to vary between 0 and -20. 
##D # Because the viability threshold of the non-growth case is 2 
##D # and the viability threshold of the growth case is 1; 
##D # the optimized value should be between -2 and -1 
##D 
##D varying_lower_bound_list=list()
##D varying_lower_bound_list[[1]]=list(reaction="T[e]_import",min=-20,max=-0,penalty=0.1)
##D 
##D  
##D # no alternative modifications allowed
##D reverse_reaction_list=list()
##D additional_reactions_list=list()
##D additional_biomass_mets=list()
##D remove_biomass_mets=list()
##D  
##D opt_net=bilevel_optimize(network=example_net3,on=on,off=off,algorithm=2,
##D additional_reactions=additional_reactions_list,not_delete_for=not_delete_for,
##D not_delete_back=not_delete_back,minimize=FALSE,simple=FALSE,verboseMode=1,
##D param_list=p_list,cancel_case_penalty=NULL,use_indicator_constraints=FALSE,
##D stat_file=NULL,react_file=NULL,reverse_reaction_list=reverse_reaction_list,
##D alternatives=0,MaxPenalty=NULL,additional_biomass_metabolites=additional_biomass_mets,
##D remove_biomass_metabolites=remove_biomass_mets,variable_lower_bound=varying_lower_bound_list,
##D forced_modifications=0)
## End(Not run)



