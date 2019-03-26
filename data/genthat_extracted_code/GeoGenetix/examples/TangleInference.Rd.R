library(GeoGenetix)


### Name: TangleInference
### Title: Inference and model selection for analysis of geographical
###   genetic variation
### Aliases: TangleInference
### Keywords: MCMC inference Model selection

### ** Examples

## Not run: 
##D data(toydata,package='GeoGenetix')
##D 
##D #### Computing options
##D nit <- 10^2
##D run  <- c(1,1,1)
##D thinning  <- max(nit/10^3,1);
##D ud   <- c(0,1,1,0,0) 
##D theta.init <- c(1,2,1,1,0.01)
##D set  <- dim(gen)[1]*dim(gen)[2]/10 
##D theta.max  <- c(10,10*max(D_G),10*max(D_E),1,0.01)
##D 
##D plot  <- TRUE
##D trace <- FALSE
##D 
##D #### Call Tangle ####
##D output <- TangleInference(gen,D_G,D_E,
##D                            nit,thinning,
##D                            theta.max,
##D                            theta.init,
##D                            run,ud,set)
##D 
##D mod.lik <- output$mod.lik
##D tvt <- output$tvt
##D 
##D 
##D ## plotting outputs
##D upd=matrix(nrow=sum(run), ncol=length(theta.init), data=1)
##D upd[2,3]=upd[3,2]=0
##D 
##D plot(as.vector(D_G),as.vector(cor(t(gen[,,1]))),
##D      bg=colorRampPalette(c("blue", "red"))(dim(D_E)[1]^2)[order(order(as.vector(D_E)))],
##D      pch=21,
##D      xlab='Geographic distance',
##D      ylab='Empirical covariance genotypes')
##D 
##D 
##D kol=c(4,2,3) 
##D xseq=seq(thinning,nit,thinning)
##D ylab=c(expression(paste(alpha)),
##D        expression(paste(beta[D])),
##D        expression(paste(beta[E])),
##D        expression(paste(gamma)),
##D        expression(paste(delta)))
##D 
##D par(mfrow=c(sum(run),length(theta.init)))
##D for (j in 1:sum(run))
##D {
##D   for(k in 1:length(theta.init))
##D   {
##D     if (sum(upd[,k]==1)>0)
##D     {
##D       if(upd[j, k]==1)
##D       {
##D         if(exists("theta"))
##D           ylim=c(min(tvt[k,,j],theta[k]),max(tvt[k,,j],theta[k])) else
##D             ylim=c(min(tvt[k,,j]),max(tvt[k,,j]))
##D         plot(0, type="n",xlab="",ylab="", xlim=c(0,nit), ylim=ylim)
##D         lines(xseq,tvt[k,,j],col=kol[j],xlab="",ylab="")
##D         if(exists("theta")) abline(h=theta[k],lty=2)
##D         title(xlab="iterations")        
##D         mtext(ylab[k], side=2, line=2.3,las=1)} else plot.new()
##D     }
##D   }
##D }
## End(Not run)



