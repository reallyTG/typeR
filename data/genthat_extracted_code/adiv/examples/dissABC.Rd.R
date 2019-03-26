library(adiv)


### Name: dissABC
### Title: Phylogenetic and Functional Similarity between Communities
### Aliases: dissABC
### Keywords: models

### ** Examples

data(RP15JVS)
dissABC(RP15JVS$ab, RP15JVS$D1, method="J", option=1)
J <- as.matrix(dissABC(RP15JVS$ab, RP15JVS$D1, method="J", option=1))[, 1]
SS <- as.matrix(dissABC(RP15JVS$ab, RP15JVS$D1, method="SS", option=1))[, 1]
S <- as.matrix(dissABC(RP15JVS$ab, RP15JVS$D1, method="S", option=1))[, 1]
O <- as.matrix(dissABC(RP15JVS$ab, RP15JVS$D1, method="O", option=1))[, 1]
K <- as.matrix(dissABC(RP15JVS$ab, RP15JVS$D1, method="K", option=1))[, 1]
plot(1:9, J, 
xlab="Number of the plots which plot 1 is compared to",
 ylab="Similarity", type="b", ylim=c(0,1), pch=18)
lines(1:9, SS, type="b", pch=15)
lines(1:9, S, type="b", pch=17)
lines(1:9, O, type="b", pch=12)
lines(1:9, K, type="b", pch=1)
legend("bottomleft", 
c("Jaccard","Sokal-Sneath","Sorensen","Ochiai","Kulczynski"), 
pch=c(18,15,17,12,1), lty=1)



