library(ic50)


### Name: ic50
### Title: Standardized evaluation of cell-based compound screens
### Aliases: ic50.96 ic50.384
### Keywords: hplot dplot nonlinear smooth

### ** Examples

#Example from a cell line screen (2007). IC50 values are determined for
#the lung cancer cell line HCC2429 and 7 selected compounds.

data(HCC2429_1,HCC2429_2)
write.table(HCC2429_1,file="HCC2429_1.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(HCC2429_2,file="HCC2429_2.txt",row.names=FALSE,col.names=FALSE,sep="\t")

data(mpi384_measure,mpi384_control,mpi384_dilution)
write.table(mpi384_measure,file="mpi384_measure.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(mpi384_control,file="mpi384_control.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(mpi384_dilution,file="mpi384_dilution.txt",row.names=FALSE,col.names=FALSE,sep="\t")

print(ic50.384(files=c("HCC2429_1.txt","HCC2429_2.txt"),
               measure="mpi384_measure.txt",control="mpi384_control.txt",dilution="mpi384_dilution.txt",
               inhib=rep(0.5,7),outdir="./HCC2429_results",normalize="mean"))




