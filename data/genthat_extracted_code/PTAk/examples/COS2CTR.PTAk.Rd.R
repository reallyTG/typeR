library(PTAk)


### Encoding: UTF-8

### Name: COS2-CTR
### Title: Interpretation summaries
### Aliases: COS2 CTR
### Keywords: models principal components analysis array algebra
###   multivariate

### ** Examples

 data(crimerate)
  cri.FCA2 <- FCA2(crimerate)
   summary(cri.FCA2)
    plot(cri.FCA2, mod = c(1,2), nb1 = 2, nb2 = 3) # unscaled
    plot(cri.FCA2, mod = c(1,2), nb1 = 2, nb2 = 3, coefi = 
    	list(c(0.130787,0.130787),c(0.104359,0.104359)) ) # symmetric-map biplot
   CTR(cri.FCA2, mod = 1, solnbs = 2:4)
   CTR(cri.FCA2, mod = 2, solnbs = 2:4)
 COS2(cri.FCA2, mod = 2, solnbs = 2:4)
 ##### useful fonctions
 ##selecting and sorting out dimensions positive and negative sides
 "ctrcos2" <-function(Ta, mod=1, dim=2, NegPos=TRUE, select=c("avg",12,"none"),nbdig=2, 
 			cos2min=333){
	dim=c(dim, dim+1)
	ctr=CTR(Ta,mod=mod,solnbs=dim);cos2=COS2(Ta,mod=mod,solnbs=dim)
	val=round(Ta[[mod]]$v[dim,][1,],digits=nbdig)
	oo=order(ctr[,1],decreasing=TRUE)
	if(NegPos)oo=order(val,decreasing=TRUE)
	out=cbind(ctr[oo,1],cos2[oo,1],val[oo])
	colnames(out)=c("ctr","cos2",paste0("dim",dim[1]))
	if(select[1]=="none") sout=0
	if(select[1]=="avg") sout= 1000/length(val)
	if(is.numeric(select[1])) sout=select[1]
return(out[ out[,1]>=sout | out[,2]>=cos2min, ])	 
}#ctrcos2

## plot ctr cos2
"plotctrcos2"<-function(sol,mod12=c(1,2),dim=2, ratio2avg=TRUE, col=c(1,2),pch=c("-","°"), 
				posi=c(2,3),reposi=TRUE, cos2min=333,select="avg",...){
	### ctrcos2 ini Ta,mod=1,dim=2, NegPos=TRUE, select=c("avg",12,"none"), nbdig=2, cos2min=333
	pre<-function(mod=1,soldim=2, ...){
	diim=length(sol[[mod]]$v[1,])
	ctrov= ctrcos2(sol,dim= soldim,mod=mod,...)	
	x=ctrov[,1]*sign(ctrov[,3])
	if(ratio2avg)x=round(x/(1000/diim),2)
	y=ctrov[,2]
	lab=rownames(ctrov)
	len=dim(ctrov)[1]
	return(list("x"=x,"y"=y,"len"=len,"lab"=lab))
	}
	if(length(col)<length(mod12))col=rep(col,length(mod12))
	if(length(pch)<length(mod12))pch=rep(pch,length(mod12))
	x=NULL;y=NULL;coul=NULL;pchl=NULL;lab=NULL;poslab=NULL
	for(m in mod12){
		prep=pre(mod=m,soldim=dim,...)
		x=c(x,prep$x);y=c(y,prep$y);
        coul=c(coul,rep(col[m],prep$len));pchl=c(pchl,rep(pch[m],prep$len))
		repos=rep(posi[m],prep$len); if(reposi)repos=sample(1:4,prep$len, replace=TRUE)
		lab=c(lab,prep$lab);poslab=c(poslab,repos)
	}
	summsol=summary(sol)
	
	if(match("FCA2" ,class(sol),nomatch=0)>0) xlabe=paste0( "Global pct ",
	round(summsol[dim,4],2), " FCA pct",round(summsol[dim,5],2)) else 
	xlabe=paste0( " local pxt",round(summsol[dim,4],2), " Global pct", round(summsol[dim,5],2))
	dimi=paste0("dim",dim)
	if(ratio2avg)ctrlab="CTR (signed ctr /(uniform ctr))" else ctrlab="CTR (signed)"
	if(!is.null(cos2min))cos2lab=paste("COS2 (> ",cos2min,")")else cos2lab= "COS2"
	plot(x,y,xlab=ctrlab, main=paste(dimi, xlabe ),ylab= cos2lab,col=coul,
	             pch=pchl,ylim=c(min(y),1050),xlim=c(min(x-0.5),max(x+0.5)))
	abline(v=0,col=4,lty=2)
	abline(v=1,col=3,lty=2)
	abline(v=-1,col=3,lty=2)
	text(x,y,lab,pos=poslab, col=coul)
return(cbind(x,y,lab,coul,pchl,poslab))
}#plotctrcos2

ctrcos2(cri.FCA2,mod=1)
ctrcos2(cri.FCA2,mod=2)
 plotctrcos2(cri.FCA2)
 



