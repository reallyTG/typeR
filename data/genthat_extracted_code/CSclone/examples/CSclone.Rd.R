library(CSclone)


### Name: CSclone
### Title: Clustering model which contains the CNAs mutation and SNVs
###   mutation.
### Aliases: CSclone

### ** Examples

mcmc=list(nburn=200,nsave=500,nskip=1,ndisplay=1000)
p=c(0.2,0.4,0.6,0.8)
chrs=rep(c(1:2),times=rep(500,2))
pos=sort(sample(size=1000,x=1:10^7))
pc=sample(rep(p,4*c(0,0,0.5,0.5)))
ps=sample(rep(p,50*c(0.3,0.3,0.2,0.2)))
x=simu.data(n.germline=1000,pc=pc,read=200,ps=ps,dis="Negative binomial",parameter=0.75)
snv.id=x$snv.id
y=x$y
row.names(y)=paste0(chrs,"_",pos)
logR=log(y[,2],base=2)-median(log(y[,2],base=2))
data=data.frame(chr=chrs,pos=pos,logR=logR)
rownames(data)=paste0("SNP",1:nrow(data))
CNA.object=CNA(data$logR,data$chr,data$pos,data.type="logratio",sampleid="test")
smoothed.CNA.object=smooth.CNA(CNA.object)
DNAcopy.object=segment(smoothed.CNA.object, undo.splits = "sdundo",undo.SD = 3, verbose = 1)
fit=CSclone(somatic.id=snv.id,DNAcopy.object=DNAcopy.object,mcmc=mcmc,y=y)
result=fit$cluster
tf_similar(real=ps,cluster=result)




