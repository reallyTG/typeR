### R code from vignette source 'Canopy_vignettes.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Installation1 (eval = FALSE)
###################################################
## install.packages('Canopy')  # updated every 3-4 months


###################################################
### code chunk number 2: Installation2 (eval = FALSE)
###################################################
## install.packages("devtools")
## library(devtools)
## install_github("yuchaojiang/Canopy/package")  # STRONGLY recommended


###################################################
### code chunk number 3: Input
###################################################
library(Canopy)
data("MDA231")

projectname = MDA231$projectname ## name of project
R = MDA231$R; R ## mutant allele read depth (for SNAs)
X = MDA231$X; X ## total depth (for SNAs)
WM = MDA231$WM; WM ## observed major copy number (for CNA regions)
Wm = MDA231$Wm; Wm ## observed minor copy number (for CNA regions)
epsilonM = MDA231$epsilonM ## standard deviation of WM, pre-fixed here
epsilonm = MDA231$epsilonm ## standard deviation of Wm, pre-fixed here
## Matrix C specifices whether CNA regions harbor specific CNAs 
## only needed if overlapping CNAs are observed, specifying which CNAs overlap
C = MDA231$C; C
Y = MDA231$Y; Y ## whether SNAs are affected by CNAs


###################################################
### code chunk number 4: SNA_clustering
###################################################
library(Canopy)
data(toy3)
R=toy3$R; X=toy3$X # 200 mutations across 3 samples
num_cluster=2:9 # Range of number of clusters to run
num_run=10 # How many EM runs per clustering step for each mutation cluster wave
canopy.cluster=canopy.cluster(R = R,
                              X = X,
                              num_cluster = num_cluster,
                              num_run = num_run)
bic_output=canopy.cluster$bic_output # BIC for model selection (# of clusters)
Mu=canopy.cluster$Mu # VAF centroid for each cluster
Tau=canopy.cluster$Tau  # Prior for mutation cluster, with a K+1 component
sna_cluster=canopy.cluster$sna_cluster # cluster identity for each mutation


###################################################
### code chunk number 5: fig1
###################################################
par(mfrow=c(1,2))
plot(num_cluster,bic_output,xlab='Number of mutation clusters',ylab='BIC',type='b',main='BIC for model selection')
abline(v=num_cluster[which.max(bic_output)],lty=2)
colc=c('green4','red3','royalblue1','darkorange1','royalblue4',
       'mediumvioletred','seagreen4','olivedrab4','steelblue4','lavenderblush4')
pchc=c(17,0,1,15,3,16,4,8,2,16)
library(scatterplot3d)
scatterplot3d((R/X)[,1],(R/X)[,2],(R/X)[,3],xlim=c(0,max(R/X)),ylim=c(0,max(R/X)),zlim=c(0,max(R/X)),color=colc[sna_cluster],pch=pchc[sna_cluster],
              xlab='Sample1 VAF',ylab='Sample2 VAF',zlab='Sample3 VAF',
              main='VAF clustering across 3 samples')
par(mfrow=c(1,1))


###################################################
### code chunk number 6: SNA_clustering_AML43
###################################################
library(Canopy)
data(AML43)
R=AML43$R; X=AML43$X
num_cluster=4 # Range of number of clusters to run
num_run=6 # How many EM runs per clustering step for each mutation cluster wave
Tau_Kplus1=0.05 # Pre-specified proportion of noise component
Mu.init=cbind(c(0.01,0.15,0.25,0.45),
              c(0.2,0.2,0.01,0.2)) # Initial value for centroid
canopy.cluster=canopy.cluster(R = R,
                              X = X,
                              num_cluster = num_cluster,
                              num_run = num_run,
                              Mu.init = Mu.init,
                              Tau_Kplus1=Tau_Kplus1)
Mu=canopy.cluster$Mu # VAF centroid for each cluster
Tau=canopy.cluster$Tau  # Prior for mutation cluster, with a K+1 component
sna_cluster=canopy.cluster$sna_cluster # cluster identity for each mutation

R.qc=R[sna_cluster<=4,] # exclude mutations in the noise cluster
X.qc=X[sna_cluster<=4,]
sna_cluster.qc=sna_cluster[sna_cluster<=4]

R.cluster=round(Mu*100)  # Generate pseudo-SNAs correponding to each cluster. 
X.cluster=pmax(R.cluster,100)   # Total depth is set at 100 but can be obtained as median instead 
rownames(R.cluster)=rownames(X.cluster)=paste('SNA.cluster',1:4,sep='')


###################################################
### code chunk number 7: fig2
###################################################
Mu=canopy.cluster$Mu # VAF centroid for each cluster
Tau=canopy.cluster$Tau  # Prior for mutation cluster, with a K+1 component
sna_cluster=canopy.cluster$sna_cluster # cluster identity for each mutation
colc=c('green4','red3','royalblue1','darkorange1','royalblue4',
       'mediumvioletred','seagreen4','olivedrab4','steelblue4','lavenderblush4')
pchc=c(17,0,1,15,3,16,4,8,2,16)
plot((R/X)[,1],(R/X)[,2],xlab='Sample1 VAF',ylab='Sample2 VAF',col=colc[sna_cluster],pch=pchc[sna_cluster],ylim=c(0,max(R/X)),xlim=c(0,max(R/X)))


###################################################
### code chunk number 8: Tree_elements1
###################################################
data('MDA231_tree')
MDA231_tree$Z # Z matrix specifies the position of the SNAs along the tree branch
MDA231_tree$cna.copy # major and minor copy number (interger values) for each CNA
MDA231_tree$CM # Major copy per clone for each CNA
MDA231_tree$Cm # Minor copy per clone for each CNA
MDA231_tree$Q # whether an SNA precedes a CNA


###################################################
### code chunk number 9: Tree_elements2
###################################################
MDA231_tree$H # if an SNA precedes a CNA, whether it resides in the major copy
MDA231_tree$P # clonal compostion for each sample
MDA231_tree$VAF # VAF based on current tree structure


###################################################
### code chunk number 10: Sampling1 (eval = FALSE)
###################################################
## K = 3:6 # number of subclones
## numchain = 20 # number of chains with random initiations
## sampchain = canopy.sample(R = R, X = X, WM = WM, Wm = Wm, epsilonM = epsilonM, 
##             epsilonm = epsilonm, C = C, Y = Y, K = K, numchain = numchain, 
##             max.simrun = 50000, min.simrun = 10000, 
##             writeskip = 200, projectname = projectname, cell.line = TRUE, 
##             plot.likelihood = TRUE)
## save.image(file = paste(projectname, '_postmcmc_image.rda',sep=''),
##            compress = 'xz')


###################################################
### code chunk number 11: Sampling2
###################################################
data("MDA231_sampchain")
sampchain = MDA231_sampchain
k = 3; K = 3:6
sampchaink = MDA231_sampchain[[which(K==k)]]


###################################################
### code chunk number 12: Sampling3
###################################################
length(sampchain) ## number of subtree spaces (K=3:6)
length(sampchain[[which(K==4)]]) ## number of chains for subtree space with 4 subclones
length(sampchain[[which(K==4)]][[1]]) ## number of posterior trees in each chain


###################################################
### code chunk number 13: BIC
###################################################
burnin = 100
thin = 5 # If there is error in the bic and canopy.post step below, make sure
         # burnin and thinning parameters are wisely selected so that there are
         # posterior trees left.
bic = canopy.BIC(sampchain = sampchain, projectname = projectname, K = K,
               numchain = numchain, burnin = burnin, thin = thin, pdf = FALSE)
optK = K[which.max(bic)]


###################################################
### code chunk number 14: fig3
###################################################
# Note: this segment is soley for generating BIC plot in the vignettes.
# Use Canopy.BIC() with pdf = TRUE to generate this plot directly.
par(mfrow=c(1,2))
projectname = 'MDA231'
numchain = 20
clikelihood = matrix(nrow = numchain, ncol = length(sampchaink[[1]]), data = NA)
for(numi in 1:numchain){
  for(i in 1:ncol(clikelihood)){
    clikelihood[numi,i] = sampchaink[[numi]][[i]]$likelihood
  }
}
plot(1:ncol(clikelihood), clikelihood[1,], type='l', xlab = 'Iteration',
     ylab = 'Log-likelihood', col = 1, ylim = c(min(clikelihood), 
                                                max(clikelihood)))
for(numi in 2:numchain){
  points(1:ncol(clikelihood), clikelihood[numi,], type = 'l', col = numi)
}
title(main=paste('Posterior likelihood', k, 'clones', numchain,
            'chains'),cex=0.6)
plot(K, bic, xlab = 'Number of subclones', ylab = 'BIC', type = 'b', xaxt = "n")
axis(1, at = K)
abline(v = (3:6)[which.max(bic)], lty = 2)
title('BIC for model selection')


###################################################
### code chunk number 15: Post
###################################################
post = canopy.post(sampchain = sampchain, projectname = projectname, K = K,
                 numchain = numchain, burnin = burnin, thin = thin, optK = optK,
                 C = C, post.config.cutoff = 0.05)
samptreethin = post[[1]]   # list of all post-burnin and thinning trees
samptreethin.lik = post[[2]]   # likelihoods of trees in samptree
config = post[[3]] # configuration for each posterior tree
config.summary = post[[4]] # configuration summary
print(config.summary)
# first column: tree configuration
# second column: posterior configuration probability in the entire tree space
# third column: posterior configuration likelihood in the subtree space


###################################################
### code chunk number 16: Plot
###################################################
config.i = config.summary[which.max(config.summary[,3]),1]
cat('Configuration', config.i, 'has the highest posterior likelihood!\n')
# plot the most likely tree in the posterior tree space
output.tree = canopy.output(post, config.i, C)
canopy.plottree(output.tree)

# plot the tree with configuration 1 in the posterior tree space
output.tree = canopy.output(post, 1, C)
canopy.plottree(output.tree, pdf=TRUE, pdf.name = 
                    paste(projectname,'_first_config.pdf',sep=''))


###################################################
### code chunk number 17: fig4
###################################################
canopy.plottree(output.tree)


###################################################
### code chunk number 18: Try it your self (eval = FALSE)
###################################################
## library(Canopy)
## data(toy)
## projectname = 'toy'
## R = toy$R; X = toy$X; WM = toy$WM; Wm = toy$Wm
## epsilonM = toy$epsilonM; epsilonm = toy$epsilonm; Y = toy$Y
## 
## K = 3:6; numchain = 10
## sampchain = canopy.sample(R = R, X = X, WM = WM, Wm = Wm, epsilonM = epsilonM, 
##                           epsilonm = epsilonm, C = NULL, Y = Y, K = K, 
##                           numchain = numchain, simrun = 50000, writeskip = 200,
##                           projectname = projectname, cell.line = FALSE,
##                           plot.likelihood = TRUE)


###################################################
### code chunk number 19: fig5
###################################################
data(toy)
canopy.plottree(toy$besttree, txt = FALSE, pdf = FALSE)


###################################################
### code chunk number 20: Try it your self2 (eval = FALSE)
###################################################
## library(Canopy)
## data(toy2)
## projectname = 'toy2'
## R = toy2$R; X = toy2$X; WM = toy2$WM; Wm = toy2$Wm
## epsilonM = toy2$epsilonM; epsilonm = toy2$epsilonm; Y = toy2$Y
## true.tree = toy2$true.tree  # true underlying tree
## K = 3:6; numchain = 15
## sampchain = canopy.sample(R = R, X = X, WM = WM, Wm = Wm, epsilonM = epsilonM, 
##                           epsilonm = epsilonm, C = NULL, Y = Y, K = K, 
##                           numchain = numchain, max.simrun = 100000,
##                           min.simrun = 10000, writeskip = 200,
##                           projectname = projectname, cell.line = FALSE,
##                           plot.likelihood = TRUE)


###################################################
### code chunk number 21: fig6
###################################################
data(toy2)
canopy.plottree(toy2$true.tree, txt = FALSE, pdf = FALSE)


###################################################
### code chunk number 22: Try it your self3 (eval = FALSE)
###################################################
## library(Canopy)
## data(toy3)
## R=toy3$R; X=toy3$X
## num_cluster=2:9 # Range of number of clusters to run
## num_run=10 # How many EM runs per clustering step for each mutation cluster wave
## canopy.cluster=canopy.cluster(R = R,
##                               X = X,
##                               num_cluster = num_cluster,
##                               num_run = num_run)
## 
## bic_output=canopy.cluster$bic_output # BIC for model selection (# of clusters)
## Mu=canopy.cluster$Mu # VAF centroid for each cluster
## Tau=canopy.cluster$Tau  # Prior for mutation cluster, with a K+1 component
## sna_cluster=canopy.cluster$sna_cluster # cluster identity for each mutation
## 
## projectname='toy3'
## K = 3:5 # number of subclones
## numchain = 15 # number of chains with random initiations
## sampchain = canopy.sample.cluster.nocna(R = R, X = X, sna_cluster = sna_cluster,
##                                         K = K, numchain = numchain, 
##                                         max.simrun = 100000, min.simrun = 20000,
##                                         writeskip = 200, projectname = projectname,
##                                         cell.line = FALSE, plot.likelihood = TRUE)
## save.image(file = paste(projectname, '_postmcmc_image.rda',sep=''),
##            compress = 'xz')


###################################################
### code chunk number 23: sessionInfo
###################################################
toLatex(sessionInfo())


