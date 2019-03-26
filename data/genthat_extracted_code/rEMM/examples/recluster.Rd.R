library(rEMM)


### Name: recluster
### Title: Reclustering EMM states
### Aliases: recluster recluster_hclust recluster_hclust,EMM-method
###   recluster_kmeans recluster_kmeans,EMM-method recluster_pam
###   recluster_pam,EMM-method recluster_tNN recluster_tNN,EMM-method
###   recluster_reachability recluster_reachability,EMM-method
###   recluster_transitions recluster_transitions,EMM-method
### Keywords: manip models cluster

### ** Examples

data(EMMsim)
emm <- EMM(threshold = .2)
build(emm, EMMsim_train)

## do reclustering on a copy of the emm and plot dendrogram
emm_hc <- recluster_hclust(emm, h = 0.6)

attr(emm_hc, "cluster_info")

## compare original and clustered EMM
op <- par(mfrow = c(2, 2), pty = "m")   
plot(emm, method= "MDS", main ="original EMM", data = EMMsim_train) 
plot(attr(emm_hc, "cluster_info")$dendrogram)
abline(h=0.6, col="red")
plot(emm_hc, method="MDS", main ="clustered EMM", data = EMMsim_train) 
plot(emm_hc, method="MDS", main ="clustered EMM") 
par(op)



