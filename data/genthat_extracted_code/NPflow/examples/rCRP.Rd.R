library(NPflow)


### Name: rCRP
### Title: Generating cluster data from the Chinese Restaurant Process
### Aliases: rCRP

### ** Examples


rm(list=ls())

d=2
hyperG0 <- list()
hyperG0[["NNiW"]] <- list()
hyperG0[["NNiW"]][["b_xi"]] <- rep(0,d)
hyperG0[["NNiW"]][["b_psi"]] <- rep(0,d)
hyperG0[["NNiW"]][["D_xi"]] <- 100
hyperG0[["NNiW"]][["D_psi"]] <- 8
hyperG0[["NNiW"]][["nu"]] <- d+1
hyperG0[["NNiW"]][["lambda"]] <- diag(c(1,1))

hyperG0[["scale"]] <- list()

set.seed(4321)
N <- 200
alph <- runif(n=1,0.2,2)
GvHD_sims <- rCRP(n=2*N, alpha=alph, hyperG0=hyperG0)
library(ggplot2)
q <- (ggplot(data=cbind.data.frame("D1"=GvHD_sims$data[1,],
                                  "D2"=GvHD_sims$data[2,],
                                  "Cluster"=GvHD_sims$cluster),
             aes(x=D1, y=D2))
      + geom_point(aes(colour=Cluster), alpha=0.6)
      + theme_bw()
      )
q
#q + stat_density2d(alpha=0.15, geom="polygon")

## Not run: 
##D MCMCy1 <- DPMGibbsSkewT(z=GvHD_sims$data[,1:N],
##D                         hyperG0$NNiW, a=0.0001, b=0.0001, N=5000,
##D                         doPlot=TRUE, nbclust_init=64, plotevery=500,
##D                         gg.add=list(theme_bw()), diagVar=FALSE)
##D  s1 <- summary(MCMCy1, burnin=4000, thin=5,
##D                posterior_approx=TRUE)
##D  F1 <- FmeasureC(ref=GvHD_sims$cluster[1:N], pred=s1$point_estim$c_est)
##D 
##D  # s <- summary(MCMCy1, burnin=4000, thin=5,
##D  #               posterior_approx=TRUE, K=1)
##D  # s2 <- summary(MCMCy1, burnin=4000, thin=5,
##D  #               posterior_approx=TRUE, K=2)
##D  # MCMCy2_seqPost<- DPMGibbsSkewT(z=GvHD_sims$data[,(N+1):(2*N)],
##D  #                                  hyperG0=s1$param_post$parameters,
##D  #                                  a=s1$param_post$alpha_param$shape,
##D  #                                  b=s1$param_post$alpha_param$rate,
##D  #                                  N=5000, doPlot=TRUE, nbclust_init=64, plotevery=500,
##D  #                                  gg.add=list(theme_bw()), diagVar=FALSE)
##D 
##D  MCMCy2_seqPost <- DPMGibbsSkewT_SeqPrior(z=GvHD_sims$data[,(N+1):(2*N)],
##D                                            prior=s1$param_post, hyperG0=hyperG0$NNiW, , N=1000,
##D                                            doPlot=TRUE, nbclust_init=10, plotevery=100,
##D                                            gg.add=list(theme_bw()), diagVar=FALSE)
##D  s2_seqPost <- summary(MCMCy2_seqPost, burnin=600, thin=2)
##D  F2_seqPost <- FmeasureC(ref=GvHD_sims$cluster[(N+1):(2*N)], pred=s2_seqPost$point_estim$c_est)
##D 
##D  MCMCy2 <- DPMGibbsSkewT(z=GvHD_sims$data[,(N+1):(2*N)],
##D                          hyperG0$NNiW, a=0.0001, b=0.0001, N=5000,
##D                          doPlot=TRUE, nbclust_init=64, plotevery=500,
##D                          gg.add=list(theme_bw()), diagVar=FALSE)
##D  s2 <- summary(MCMCy2, burnin=4000, thin=5)
##D  F2 <- FmeasureC(ref=GvHD_sims$cluster[(N+1):(2*N)], pred=s2$point_estim$c_est)
##D 
##D  MCMCtot <- DPMGibbsSkewT(z=GvHD_sims$data,
##D                           hyperG0$NNiW, a=0.0001, b=0.0001, N=5000,
##D                           doPlot=TRUE, nbclust_init=10, plotevery=500,
##D                           gg.add=list(theme_bw()), diagVar=FALSE)
##D  stot <- summary(MCMCtot, burnin=4000, thin=5)
##D  F2tot <- FmeasureC(ref=GvHD_sims$cluster[(N+1):(2*N)], pred=stot$point_estim$c_est[(N+1):(2*N)])
##D 
##D  c(F1, F2, F2_seqPost, F2tot)
## End(Not run)




