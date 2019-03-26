library(dina)


### Name: DINA_Gibbs
### Title: Generate Posterior Distribution with Gibbs sampler
### Aliases: DINA_Gibbs

### ** Examples

## Not run: 
##D ###################################
##D #Tatsuoka Fraction Subtraction Data
##D ###################################
##D require(CDM)
##D data(fraction.subtraction.data)
##D Y_1984 = as.matrix(fraction.subtraction.data)
##D Q_1984 = as.matrix(fraction.subtraction.qmatrix)
##D K_1984 = ncol(fraction.subtraction.qmatrix)
##D J_1984 = ncol(Y_1984)
##D     
##D # Creating matrix of possible attribute profiles
##D As_1984 = rep(0,K_1984)
##D for(j in 1:K_1984){
##D     temp = combn(1:K_1984,m=j)
##D     tempmat = matrix(0,ncol(temp),K_1984)
##D     for(j in 1:ncol(temp)) tempmat[j,temp[,j]] = 1
##D     As_1984 = rbind(As_1984,tempmat)
##D }
##D As_1984 = as.matrix(As_1984)
##D             
##D # Generate samples from posterior distribution
##D # May take 8 minutes
##D chainLength <- 5000
##D burnin <- 1000
##D outchain_1984 <- DINA_Gibbs(Y = Y_1984, Amat = As_1984,
##D                             Q_1984, chain_length = chainLength)
##D                 
##D # Summarize posterior samples for g and 1-s
##D mgs_1984 = apply(outchain_1984$GamS[,burnin:chainLength],1,mean)
##D sgs_1984 = apply(outchain_1984$GamS[,burnin:chainLength],1,sd)
##D mss_1984 = 1-apply(outchain_1984$SigS[,burnin:chainLength],1,mean)
##D sss_1984 = apply(outchain_1984$SigS[,burnin:chainLength],1,sd)
##D output_1984=cbind(mgs_1984,sgs_1984,mss_1984,sss_1984)
##D colnames(output_1984) = c('g Est','g SE','1-s Est','1-s SE')
##D rownames(output_1984) = colnames(Y_1984)
##D print(output_1984,digits=3)
##D                     
##D # Summarize marginal skill distribution using posterior samples for latent class proportions
##D marg_PIs = t(As_1984)%*%outchain_1984$PIs
##D PI_Est = apply(marg_PIs[,burnin:chainLength],1,mean)
##D PI_Sd = apply(marg_PIs[,burnin:chainLength],1,sd)
##D PIoutput = cbind(PI_Est,PI_Sd)
##D colnames(PIoutput) = c('EST','SE')
##D rownames(PIoutput) = paste0('Skill ',1:K_1984)
##D print(PIoutput,digits=3)
##D 
##D #####################################################
##D #de la Torre (2009) Simulation Replication w/ N = 200
##D #####################################################
##D N = 200
##D K = 5
##D J = 30
##D delta0 = rep(1,2^K)
##D 
##D #Creating Q matrix
##D Q = matrix(rep(diag(K),2),2*K,K,byrow=TRUE)
##D for(mm in 2:K){
##D     temp = combn(1:K,m=mm)
##D     tempmat = matrix(0,ncol(temp),K)
##D     for(j in 1:ncol(temp)) tempmat[j,temp[,j]] = 1
##D     Q = rbind(Q,tempmat)
##D }
##D Q = Q[1:J,]
##D     
##D # Setting item parameters and generating attribute profiles
##D ss = gs = rep(.2,J)
##D PIs = rep(1/(2^K),2^K)
##D CLs = c((1:(2^K))%*%rmultinom(n=N,size=1,prob=PIs) )
##D         
##D # Defining matrix of possible attribute profiles
##D As = rep(0,K)
##D for(j in 1:K){
##D     temp = combn(1:K,m=j)
##D     tempmat = matrix(0,ncol(temp),K)
##D     for(j in 1:ncol(temp)) tempmat[j,temp[,j]] = 1
##D     As = rbind(As,tempmat)
##D }
##D As = as.matrix(As)
##D                 
##D # Sample true attribute profiles
##D Alphas = As[CLs,]
##D                 
##D # Simulate data under DINA model 
##D gen = DINAsim(Alphas,Q,ss,gs)
##D Y_sim = gen$Y
##D                     
##D # Execute MCMC
##D # NOTE small chain length used to reduce computation time for pedagogical example.
##D chainLength = 200
##D burnin = 100
##D                     
##D outchain <- DINA_Gibbs(Y_sim,Amat=As,Q,chain_length=chainLength)
##D                         
##D # Summarize posterior samples for g and 1-s  
##D mGs = apply(outchain$GamS[,burnin:chainLength],1,mean)
##D sGs = apply(outchain$GamS[,burnin:chainLength],1,sd)
##D m1mSS = 1 - apply(outchain$SigS[,burnin:chainLength],1,mean)
##D s1mSS = apply(outchain$SigS[,burnin:chainLength],1,sd)
##D output = cbind(mGs,sGs,m1mSS,s1mSS)
##D colnames(output) = c('g Est','g SE','1-s Est','1-s SE')
##D rownames(output) = paste0('Item ',1:J)
##D print(output, digits=3)
##D                             
##D # Summarize marginal skill distribution using posterior samples for latent class proportions
##D PIoutput = cbind(apply(outchain$PIs,1,mean),apply(outchain$PIs,1,sd))
##D colnames(PIoutput) = c('EST','SE')
##D rownames(PIoutput) = apply(As,1,paste0,collapse='')
##D print(PIoutput,digits=3)
## End(Not run)



