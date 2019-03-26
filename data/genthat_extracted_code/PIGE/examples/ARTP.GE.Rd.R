library(PIGE)


### Name: ARTP.GE
### Title: Gene and pathway p-values using ARTP method
### Aliases: ARTP.GE

### ** Examples

data(data.pathway)
data(list.gene.snp)
## Not run: 
##D data(data.pige)
##D 
##D ###First example: compute observed p-value (orignal data) and permuted p-value
##D res <-data.to.PIGE(data=data.pige,data.pathway=data.pathway,
##D list.gene.snp=list.gene.snp,choice.pathway=c(1,2))
##D formul <- formula(y~factor(cov1)+factor(cov2)+factor(cov3)+factor(cov4)
##D +var_int)
##D p.snp.obs.ex <-  compute.p.snp.obs(data=data.pige,model=formul,
##D indice.snp=res$snp.selected,var.inter="var_int",class.inter=NULL) 
##D p.snp.permut.ex <-  permutation.snp(model=formul,data=data.pige,
##D indice.snp=res$snp.selected,var.inter="var_int",class.inter=NULL,
##D nbcpu=3,Npermut=9,file.out="res-permut") 
##D set.seed(10)
##D result.1 <- ARTP.GE(data.gene.pathway=data.pathway,
##D list.gene.snp=list.gene.snp,p.snp.permut=p.snp.permut.ex,
##D p.snp.obs=p.snp.obs.ex,inspect.snp.n=5,inspect.snp.percent=0.05
##D ,inspect.gene.n=10,inspect.gene.percent=0.05,temp.dir="TEMP/"
##D ,nperm=9)
##D result.1
##D    
##D ##Second example: observed and permuted p-values have already been computed
##D path.data <- paste(system.file("sampleData", package="PIGE"),"/",sep="")
##D res.permut <- read.table(file=paste(path.data,"res-permut.txt",sep="")
##D ,header=TRUE,sep=" ") 
##D res.obs   <- read.table(file=paste(path.data,"res-obs.txt",sep="")
##D ,header=TRUE,sep=" ") 
##D result.2 <- ARTP.GE(data.gene.pathway=data.pathway,
##D list.gene.snp=list.gene.snp, p.snp.permut=res.permut,
##D p.snp.obs=res.obs,inspect.snp.n=5,inspect.snp.percent=0.05,
##D inspect.gene.n=10,inspect.gene.percent=0.05,temp.dir="TEMP/",nperm=90)
##D result.2
##D 
##D ##Third example: Survival data 
##D ##observed and permuted p-values have already been computed
##D 
##D data(data.surv)
##D data(data.pathway.surv)
##D data(list.gene.snp.surv)
##D path.data <- paste(system.file("sampleData", package="PIGE"),"/",sep="")
##D res.permut <- read.table(file=paste(path.data,"res-permut-surv.txt",sep="")
##D ,header=TRUE,sep=" ") 
##D res.obs   <- read.table(file=paste(path.data,"res-obs-surv.txt",sep="")
##D ,header=TRUE,sep=" ") 
##D result.3 <- ARTP.GE(data.gene.pathway=data.pathway.surv,
##D list.gene.snp=list.gene.snp.surv, p.snp.permut=res.permut,
##D p.snp.obs=res.obs,inspect.snp.n=5,inspect.snp.percent=0.05,
##D inspect.gene.n=10,inspect.gene.percent=0.05,temp.dir="TEMP/",nperm=90)
##D result.3
## End(Not run)


