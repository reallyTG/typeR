library(phenoCDM)


### Name: plotPOGibbs
### Title: Plot Observed vs Predicted
### Aliases: plotPOGibbs
### Keywords: Observed Plot Predicted vs

### ** Examples


ssSim <- phenoSim(nSites = 2, #number of sites
                  nTSet = 30, #number of Time steps
                  beta = c(1, 2), #beta coefficients
                  sig = .01, #process error
                  tau = .1, #observation error
                  plotFlag = TRUE, #whether plot the data or not
                  miss = 0.05, #fraction of missing data
                  ymax = c(6, 3) #maximum of saturation trajectory
)

ssOut <- fitCDM(x = ssSim$x, #predictors
                nGibbs = 200,
                nBurnin = 100,
                z = ssSim$z,#response
                connect = ssSim$connect, #connectivity of time data
                quiet=TRUE)

summ <- getGibbsSummary(ssOut, burnin = 100, sigmaPerSeason = FALSE)

colMeans(summ$ymax)
colMeans(summ$betas)
colMeans(summ$tau)
colMeans(summ$sigma)

par(mfrow = c(1,3), oma = c(1,1,3,1), mar=c(2,2,0,1), font.axis=2)

plotPost(chains = ssOut$chains[,c("beta.1", "beta.2")], trueValues = ssSim$beta)
plotPost(chains = ssOut$chains[,c("ymax.1", "ymax.2")], trueValues = ssSim$ymax)
plotPost(chains = ssOut$chains[,c("sigma", "tau")], trueValues = c(ssSim$sig, ssSim$tau))

mtext('Posterior distributions of the parameters', side = 3, outer = TRUE, line = 1, font = 2)
legend('topleft', legend = c('posterior', 'true value'),
     col = c('black', 'red'), lty = 1, bty = 'n', cex=1.5, lwd =2)


yGibbs <- ssOut$latentGibbs
zGibbs <- ssOut$zpred
o <- ssOut$data$z
p <- apply(ssOut$rawsamples$y, 1, mean)
R2 <- cor(na.omit(cbind(o, p)))[1,2]^2
#Plot Observed vs Predicted
par( mar=c(4,4,1,1), font.axis=2)
plotPOGibbs(o = o , p = zGibbs,
            xlim = c(0,10), ylim=c(0,10),
            cex = .7, nburnin = 1000)
            points(o, p, pch = 3)

mtext(paste0('R² = ', signif(R2, 3)), line = -1, cex = 2, font = 2, side = 1, adj = .9)
legend('topleft', legend = c('mean', '95th percentile', '1:1 line', 'latent states'),
      col = c('#fb8072','#80b1d3','black', 'black'),
      bty = 'n', cex=1.5,
      lty = c(NA, 1, 2, NA), lwd =c(NA, 2, 2, 2), pch = c(16, NA, NA, 3))




