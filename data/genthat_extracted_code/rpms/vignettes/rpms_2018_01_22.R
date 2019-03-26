### R code from vignette source 'rpms_2018_01_22.Rnw'

###################################################
### code chunk number 1: R_options
###################################################
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: load_pckg
###################################################
library(rpms)



###################################################
### code chunk number 3: simulate_data
###################################################
set.seed(28)

getpop <- function(N, m){
csig <- 4
esig <- 1
xsig <- .3
id <- nu <- eps <- vc <- x <- rep(0, N)
for(i in 0:(floor(N/m)-1)){
  nu_i <- rnorm(1, 0, csig)
  vc_i <- rbinom(1, 6, .35)
   x_i <- log(runif(1, 1, 10000), base=2)-2
  for(j in 1:m){
     id[i*m + j] <- i
     nu[i*m + j] <- nu_i
     vc[i*m + j] <- vc_i
      x[i*m + j] <- x_i+rnorm(1, 0, xsig)
    eps[i*m + j] <- rnorm(1, 0, esig)
  }
}
va<-as.factor(rbinom(N, 3, .5))
vb<-as.factor(rbinom(N, 3, .5))
vc<-as.factor(vc)
vd<-as.factor(ceiling(14*runif(N, 0, 1)))
ve<-as.factor(rbinom(N, 1, .2))
vf<-as.factor(rbinom(N, 1, .5))

b <- ifelse(va ==1, .5, .06)+ ifelse(va ==1 & ve==1, .1, -.2) + 
     ifelse(va %in% c(2,3) & ve ==0, -.3, .07)+
     ifelse(va %in% c(2,3) & ve ==1, -.05, -.1)+
     ifelse(va==0 & ve==1, .2, -.1)

b1 <-  ifelse(va %in% c(2,3), -2, 3)
y <- b1*(x-9) + nu + eps


return(cbind.data.frame(id, y, x, va, vb, vc, vd, ve, vf, b1))
}

N <- 10000 #pop size
n<- 400 #sample size
m <- 20 #cluster size

simd <- getpop(N, m)
simd_p <- (ncol(simd)-1)

gsamp<-sample(nrow(simd), 1000)


###################################################
### code chunk number 4: plot_sim_data
###################################################
cluscols<-rep("grey", length(gsamp))
cluspch<-rep(19, length(gsamp))
cluscols[which(simd[gsamp, "id"]==59)] <- "dark blue"
cluscols[which(simd[gsamp, "id"]==478)] <- "brown"
cluspch[which(cluscols=="grey")] <- 1
plot(y~x, simd[gsamp,], col=cluscols,  pch=cluspch)
#points(y~x, simd[which(simd[gsamp, "id"]==305),], col="dark blue")
#points(y~x, simd[which(simd[gsamp, "id"]==147),], col="brown")


###################################################
### code chunk number 5: get_va_colors
###################################################
cl <- match(simd$b1, unique(simd$b1))


blin<-lm(y~x, simd[gsamp[which(cl[gsamp]==1)], ])
olin<-lm(y~x, simd[gsamp[which(cl[gsamp]==2)], ])



###################################################
### code chunk number 6: va_plot
###################################################
plot(y~x, simd[gsamp,], col=c("blue", "orange")[cl[gsamp]])
abline(blin, col="dark blue")
abline(olin, col="dark orange")


###################################################
### code chunk number 7: iid_tree
###################################################

s0<-sample(N, n)

iid_tree <- rpms(rp_equ = y~va+vb+vc+ve+vf, data = simd[s0,])



###################################################
### code chunk number 8: tree_stats
###################################################
ybar01 <- round(iid_tree$coef[[1]], 2)
ybar23 <- round(iid_tree$coef[[2]], 2)

mu01 <- round(mean(simd[which(simd$va %in% c(0,1)), "y"]), 2)
mu23 <- round(mean(simd[which(simd$va %in% c(2,3)), "y"]), 2)

lnc1 <- round(iid_tree$ln_coef[1], 2)
lnc2 <-round(iid_tree$ln_coef[2], 2)

nnames <- length(names(iid_tree))


###################################################
### code chunk number 9: qtree_plot
###################################################
qtree(iid_tree, title="iid tree", label="iidtree",
      caption="This is the tree fit from the simple random sample.")


###################################################
### code chunk number 10: print_iid_tree
###################################################
iid_tree


###################################################
### code chunk number 11: iid_reg
###################################################
iid_reg <- rpms(rp_equ = y~va+vb+vc+ve+vf, e_equ = y~x, data = simd[s0,])

iid_reg


###################################################
### code chunk number 12: get_new_data
###################################################
pre1 <- sample(N, 8)
new <- as.data.frame.array(simd[pre1, c("x", "va", "vb", "vc", "vd", "ve", "vf")], row.names=1:8)
new[,"x"] <- round(new[,"x"], 2)


###################################################
### code chunk number 13: new_data
###################################################
new


###################################################
### code chunk number 14: predict
###################################################
predict(iid_reg, newdata=new)

simd$y[pre1]



###################################################
### code chunk number 15: cluster_sample
###################################################
cs0 <- which(simd$id %in% sample(unique(simd$id), 20))


###################################################
### code chunk number 16: cluster_tree1
###################################################
ctree1 <- rpms(rp_equ = y~va+vb+vc+ve+vf, data = simd[cs0,])

ctree1


###################################################
### code chunk number 17: cluster_tree2
###################################################
ctree2 <- rpms(rp_equ = y~va+vb+vc+ve+vf, data = simd[cs0,], clusters = ~id)

ctree2


###################################################
### code chunk number 18: qtree_ex_hid
###################################################
qtree(iid_tree, title="iid tree", label="iidtree",
      caption="This is the tree fit from the simple random sample.")


###################################################
### code chunk number 19: qtree_ex_res
###################################################
qtree(iid_tree, title="iid tree", label="iidtree",
      caption="This is the tree fit from the simple random sample.")


###################################################
### code chunk number 20: nodeplot1
###################################################
node_plot(iid_reg, node = 2, data = simd[s0,])


###################################################
### code chunk number 21: CE_data
###################################################
 ce_n <- nrow(CE)
 ce_p <- ncol(CE)
# 
# workers <- which(CE$FSALARYX>0)
# workers_n <-length(workers)
# 
clus_n <- length(unique(CE$CID))



###################################################
### code chunk number 22: ce_tree
###################################################

# CE$saver <- ifelse(CE$FINDRETX>0, 1, 0)
# 
# rate_tree0 <- 
#   rpms(rp_equ = saver~FAM_SIZE+FINCBTAX+NO_EARNR+PERSOT64+CUTENURE+VEHQ+REGION, 
#                 weights = ~FINLWT21, data = CE[workers,], pval=.01) 
# 
# rate_tree1 <- 
#   rpms(rp_equ = saver~FAM_SIZE+FINCBTAX+NO_EARNR+PERSOT64+CUTENURE+VEHQ+REGION, 
#                 weights = ~FINLWT21, clusters = ~CID, data = CE[workers,], pval=.01) 



###################################################
### code chunk number 23: ce_tree_result
###################################################

# rate_tree0     
# 
# rate_tree1


