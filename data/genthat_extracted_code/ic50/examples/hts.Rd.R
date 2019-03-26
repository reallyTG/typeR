library(ic50)


### Name: hts
### Title: Standardized high-throughput evaluation of cell-based compound
###   screens
### Aliases: ic50 hts.96 hts.384
### Keywords: hplot dplot nonlinear smooth

### ** Examples

#Example from a non-small cell lung cancer (NSCLC) cell line screen. In
#total, 84 samples were screened. The evaluation is exemplarily shown for
#the cell lines A549, Calu1, H322 and HCC2429.

data(A549_1,A549_2,Calu1_1,Calu1_2,H322_1,H322_2,HCC2429_1,HCC2429_2)
dir.create("NSCLC_screen")
write.table(A549_1,file="NSCLC_screen/A549_1.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(A549_2,file="NSCLC_screen/A549_2.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(Calu1_1,file="NSCLC_screen/Calu1_1.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(Calu1_2,file="NSCLC_screen/Calu1_2.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(H322_1,file="NSCLC_screen/H322_1.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(H322_2,file="NSCLC_screen/H322_2.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(HCC2429_1,file="NSCLC_screen/HCC2429_1.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(HCC2429_2,file="NSCLC_screen/HCC2429_2.txt",row.names=FALSE,col.names=FALSE,sep="\t")

data(mpi384_measure,mpi384_control,mpi384_dilution)
write.table(mpi384_measure,file="mpi384_measure.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(mpi384_control,file="mpi384_control.txt",row.names=FALSE,col.names=FALSE,sep="\t")
write.table(mpi384_dilution,file="mpi384_dilution.txt",row.names=FALSE,col.names=FALSE,sep="\t")

print(hts.384(indir="NSCLC_screen",
              measure="mpi384_measure.txt",control="mpi384_control.txt",dilution="mpi384_dilution.txt",
              inhib=rep(0.5,7),outdir="NSCLC_results",normalize="mean"))



