library(simLife)


### Name: simFracture
### Title: Fatigue lifetime simulation
### Aliases: simFracture

### ** Examples

## Not run: 
##D 
##D ## Simulate a defect accumulation of a particle system
##D 
##D ## primary particles (as prolate spheroids)
##D ## and secondary phase (as spheres)
##D data(AL2MC_20p_k10_F2p_S)
##D 
##D ## which is clustered and densified according to CL 
##D ## additional predefined clustered regions
##D data(AL2MC_20p_k10_F2p_CL)
##D 
##D ## the box is stored together with the geometry system 
##D box <- attr(S,"box")
##D 
##D ## distTol=0.25, so use 25% of accumulation distance
##D opt <- list("vickers"=107, "distTol"=0.25, "Tmax"=10^12,
##D 		"inAreafactor"=1.56, "outAreafactor"=1.43, 
##D 		"pointsConvHull"=10, "scale"=1e+06,"pl"=101)
##D 
##D ## constants 'const' are set to the following internally
##D ## and can partially be overwritten if needed
##D # const <- list("Em"=68.9,"Ef"=400,"nc"=28.2,"nu"=0.33,
##D #		    "pf"=0.138,"nE"=NULL,"sigref"=276,"Vref"=5891)
##D 
##D par <- list("P"=c(0.01,5,0.5,50,-11,3),
##D 		"F"=c(0,0,0,105,-12,1),"const"=NULL)
##D 
##D # stress amplitude applied	
##D stress <- 110
##D ## generate individual (particles') failure times
##D CLT <- simTimes(S,par,vickers=opt$vickers,stress=stress,cores=1L)
##D 
##D ## generated random failure times
##D T <- unlist(sapply(CLT,`[[`,"T"))
##D V <- unlist(sapply(CLT,`[[`,"V"))
##D U <- unlist(sapply(CLT,`[[`,"U"))
##D 
##D dev.new()
##D showDensity(list("Debonding"=log10(V),"Fracture"=log10(U),"Failure time"=log10(T)),xlim=c(-2,15))
##D 
##D # Area max
##D (inA <- areaCrit(opt$vickers, stress=stress, factor=opt$inAreafactor, scale=opt$scale))
##D (outA <- areaCrit(opt$vickers, stress=stress, factor=opt$outAreafactor, scale=opt$scale))
##D 
##D ## run accumulation
##D RET <- simDefect(stress,S,CLT,opt)
##D length(RET)
##D 
##D #### alternatively, includes simulating times by 'simTimes'
##D # SIM <- simFracture(stress,S,opt,par,last.defect=FALSE,CL=CL)	
##D # SIM$cl_info
##D 
##D ## some simple analysis of accumulation paths until failure,
##D ## that is, while the critical area is exceeded
##D LR <- RET[[length(RET)]]
##D isInCluster <- any(unlist(lapply(CL,function(x,y)
##D 					any(y$id %in% x$id) , y=LR)))
##D cat("Broken cluster: ", isInCluster,"\t Ferrit: ",
##D 	any("F" %in% LR$label),"\t Acc.size",length(LR$id),"\n")
##D 	
##D ## select only clusters of size larger than 'msize'	
##D msize <- 1
##D id <- sapply(RET,function(x) ifelse(length(x$id)>msize,TRUE,FALSE))
##D cat("Number of defect projections in last cluster: ",length(RET[[length(RET)]]$id),"\n")
##D 
##D ## draw all accumulation paths until failure
##D dev.new()
##D L <- plotDefectAcc(RET,last.path=FALSE)
##D ## draw last accumulation path until failure
##D dev.new()
##D L <- plotDefectAcc(RET,last.path=TRUE)
##D 
##D ## 3D visualization of final defect projection area
##D #library(rgl)
##D #library(unfoldr)
##D #qid <- LR$id
##D #open3d()
##D #spheroids3d(S[qid],box=box, col=c("#0000FF","#00FF00","#FF0000","#FF00FF"))
##D #
##D ### drawing only last cluster leading to failure
##D #drawDefectProjections(S,list(LR))
## End(Not run)



