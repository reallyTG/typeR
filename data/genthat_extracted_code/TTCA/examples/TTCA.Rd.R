library(TTCA)


### Name: TTCA
### Title: TTCA: Transcript Time Course Analysis
### Aliases: TTCA

### ** Examples

## Not run: 
##D 
##D ##########################################
##D #### Gene-ANALYSE
##D ##########################################
##D require(quantreg);require(VennDiagram);require(tcltk2); require(tcltk);
##D require(RISmed);require(Matrix)
##D data(EGF,Control,annot,annotation)
##D 
##D S="gene"
##D Control.time <-  c(0,0,0.5,1,4,6,24,24,48,48,48)
##D EGF.time     <-  c(0,0,0.5,0.5,1,2,4,6,8,12,18,24,24,48,48,48)
##D file         =   paste0(getwd(),"/TTCA_Gene")
##D dir.create(file)
##D ######
##D TTCAresult<-TTCA(grp1=EGF, grp1.time=EGF.time, grp2=Control, grp2.time=Control.time,S="gene",
##D                  lambda=0.6, annot=annot, annotation=annotation,pVal=0.05,codetest=FALSE,
##D                  file=file, Stimulus1="epidermal+growth+factor", timeInt=c(4,12), MaxPics =10000)
## End(Not run)




## Not run: 
##D ##########################################
##D #### GO-ANALYSE
##D ##########################################
##D require(quantreg);require(VennDiagram);require(tcltk2); require(tcltk);
##D require(RISmed);require(Matrix)
##D #source("https://bioconductor.org/biocLite.R")
##D #biocLite("biomaRt")
##D library(biomaRt)
##D data(EGF,Control,annot,annotation)
##D 
##D require(biomaRt)
##D ensembl <-  useMart("ENSEMBL_MART_ENSEMBL",dataset="hsapiens_gene_ensembl")
##D mapGO <- getBM(attributes=c("go_id","name_1006",'affy_hugene_2_0_st_v1'),
##D                filters = 'affy_hugene_2_0_st_v1', values=rownames(annot), mart =ensembl)
##D colnames(mapGO)<-c("go_id","GO_name","probeset_id")
##D 
##D S="GO"
##D Control.time <-  c(0,0,0.5,1,4,6,24,24,48,48,48)
##D EGF.time     <-  c(0,0,0.5,0.5,1,2,4,6,8,12,18,24,24,48,48,48)
##D file         =   paste0(getwd(),"/TTCA_GO")
##D dir.create(file)
##D 
##D TTCAresult<-TTCA(grp1=EGF, grp1.time=EGF.time, grp2=Control, grp2.time=Control.time,
##D                  S="GO", pVal=0.05,lambda=0.6,codetest=FALSE, file=file,
##D                  Stimulus1="epidermal+growth+factor", timeInt=c(4,12),
##D                  MaxPics=10000, mapGO=mapGO)
## End(Not run)




