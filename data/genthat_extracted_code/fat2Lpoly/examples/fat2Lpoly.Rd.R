library(fat2Lpoly)


### Name: fat2Lpoly
### Title: Two-locus Family-based Association Test with Polytomous Outcome
### Aliases: fat2Lpoly

### ** Examples

path.data=paste(.libPaths()[which(unlist(lapply(.libPaths(),
function(x) length(grep("fat2Lpoly",dir(x)))))>0)],"/fat2Lpoly/extdata/",sep="")
if(length(path.data)>1) path.data=path.data[length(path.data)]

snps.anal=c("snp3.loc2","snp4.loc2")
microsat.names.loc2=c("2_3_mrk:","2_4_mrk:")

############ design.endo2disease with conditioning on locus 1 ################
## Not run: 
##D joint.tests=list(c(2,5))
##D snp.names.mat=cbind(rep("snp4.loc1",length(snps.anal)),snps.anal)
##D microsat.names.mat=cbind(rep("1_4_mrk:",length(snps.anal)),microsat.names.loc2)
##D test=fat2Lpoly(pedfilenames=paste(path.data,c("loc1.ped","loc2.ped"),sep=""),
##D                datfilenames=paste(path.data,c("loc1.dat","loc2.dat"),sep=""),
##D 			   freq.data=paste(path.data,c("loc1.freq","loc2.freq"),sep=""),
##D                ibdfilenames=paste(path.data,c("loc1.ibd","loc2.ibd"),sep=""),
##D 		       snp.names.mat=snp.names.mat,ibd.loci=microsat.names.mat,
##D 		       joint.tests=joint.tests,contingency.file=TRUE,
##D 		       design.constraint=design.endo2disease,lc=1)
##D 
##D test$p.values.scores
## End(Not run)		   
###############################################################################

################### design.endo2disease without conditioning ##################
joint.tests=list(c(2,5))
snp.names.mat=cbind(rep("snp4.loc1",length(snps.anal)),snps.anal)
microsat.names.mat=cbind(rep("1_4_mrk:",length(snps.anal)),microsat.names.loc2)
test=fat2Lpoly(pedfilenames=paste(path.data,c("loc1.ped","loc2.ped"),sep=""),
               datfilenames=paste(path.data,c("loc1.dat","loc2.dat"),sep=""),
			   freq.data=paste(path.data,c("loc1.freq","loc2.freq"),sep=""),
               ibdfilenames=paste(path.data,c("loc1.ibd","loc2.ibd"),sep=""),
		       snp.names.mat=snp.names.mat,ibd.loci=microsat.names.mat,
		       joint.tests=joint.tests,contingency.file=TRUE,
		       design.constraint=design.endo2disease)

test$p.values.scores   
###############################################################################

################# design.full with conditioning on locus 1 ##################
## Not run: 
##D joint.tests=list(c(2,3),c(5,6),c(8,9),c(2,3,5,6,8,9))
##D snp.names.mat=cbind(rep("snp4.loc1",length(snps.anal)),snps.anal)
##D microsat.names.mat=cbind(rep("1_4_mrk:",length(snps.anal)),microsat.names.loc2)
##D test=fat2Lpoly(pedfilenames=paste(path.data,c("loc1.ped","loc2.ped"),sep=""),
##D                datfilenames=paste(path.data,c("loc1.dat","loc2.dat"),sep=""),
##D 			   freq.data=paste(path.data,c("loc1.freq","loc2.freq"),sep=""),
##D                ibdfilenames=paste(path.data,c("loc1.ibd","loc2.ibd"),sep=""),
##D 		       snp.names.mat=snp.names.mat,ibd.loci=microsat.names.mat,
##D 		       joint.tests=joint.tests,
##D                design.constraint=design.full,lc=1)
##D 
##D test$p.values.scores
## End(Not run)
##############################################################################

############################# design.1locus #################################
snp.names.mat=as.matrix(snps.anal)
microsat.names.mat=as.matrix(microsat.names.loc2)
test=fat2Lpoly(pedfilenames=paste(path.data,"loc2.ped",sep=""),
               datfilenames=paste(path.data,"loc2.dat",sep=""),
               freq.data=paste(path.data,"loc2.freq",sep=""),
			   ibdfilenames=paste(path.data,"loc2.ibd",sep=""),
		       snp.names.mat=snp.names.mat,ibd.loci=microsat.names.mat,
			   design.constraint=design.1locus)

test$p.values.scores			   
##############################################################################

############# design.dichotomous with conditioning on locus 1 ##############
## Not run: 
##D joint.tests=list(c(2,3))
##D snp.names.mat=cbind(rep("snp4.loc1",length(snps.anal)),snps.anal)
##D microsat.names.mat=cbind(rep("1_4_mrk:",length(snps.anal)),microsat.names.loc2)
##D test=fat2Lpoly(pedfilenames=paste(path.data,c("loc1.ped","loc2.ped"),sep=""),
##D                datfilenames=paste(path.data,c("loc1.dat","loc2.dat"),sep=""),
##D 			   freq.data=paste(path.data,c("loc1.freq","loc2.freq"),sep=""),
##D                ibdfilenames=paste(path.data,c("loc1.ibd","loc2.ibd"),sep=""),
##D 		       snp.names.mat=snp.names.mat,ibd.loci=microsat.names.mat,
##D 		       joint.tests=joint.tests,
##D                design.constraint=design.dichotomous,lc=1)
##D 
##D test$p.values.scores
## End(Not run)			   
##############################################################################



