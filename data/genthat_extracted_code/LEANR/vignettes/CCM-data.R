## ---- eval=FALSE---------------------------------------------------------
#  library(LEANR)
#  set.seed(123456)
#  # load network and CCM p-values
#  data(g2)
#  data(CCM.pvals)
#  data(gene.annots)

## ---- echo=FALSE,include=FALSE-------------------------------------------
library(LEANR)
set.seed(123456)
# load network and CCM p-values
data(g2)
data(CCM.pvals)
data(gene.annots)
LEAN_results<-LEANR:::LEAN_results

## ---- eval=FALSE---------------------------------------------------------
#  LEAN_results<-lapply(names(CCM.pvals),function(ccm){
#    run.lean(CCM.pvals[[ccm]], g2, n_reps = 10000, ncores = 3)
#  })
#  names(LEAN_results)<-names(CCM.pvals)

## ------------------------------------------------------------------------
# Extract significant local subnetworks
sign.genes<-lapply(LEAN_results,function(LEANres){
  rownames(LEANres$restab[LEANres$restab[,'PLEAN']<=0.05,])
})
names(sign.genes)<-names(CCM.pvals)

# Show local subnetworks detected as significant in all three knock-outs
all.sign<-intersect(intersect(sign.genes[[1]],sign.genes[[2]]),sign.genes[[3]])
print(gene.annots[all.sign,])

## ---- eval=FALSE---------------------------------------------------------
#  # Extract information on the detected local subnetwork (around VWF)
#  vwf.ls.info<-get.ls.info(all.sign[1],LEAN_results$CCM2)
#  print(head(vwf.ls.info))
#  write.table(vwf.ls.info,'./VWF_subnetwork_info_CCM2.txt',sep='\t',quote=F,row.names=F)
#  
#  # Create sif file representing the local subnetwork around VWF
#  write.ls.to.sif(all.sign[1],LEAN_results$CCM2,'./VWF_subnetwork.sif')

