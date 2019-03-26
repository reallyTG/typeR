library(MBC)


### Name: MBC-package
### Title: Multivariate Bias Correction of Climate Model Outputs
### Aliases: MBC-package MBC
### Keywords: package

### ** Examples

## Not run: 
##D data(cccma)
##D set.seed(1)
##D 
##D # Univariate quantile mapping
##D qdm.c <- cccma$gcm.c*0
##D qdm.p <- cccma$gcm.p*0
##D for(i in seq(ncol(cccma$gcm.c))){
##D     fit.qdm <- QDM(o.c=cccma$rcm.c[,i], m.c=cccma$gcm.c[,i],
##D                    m.p=cccma$gcm.p[,i], ratio=cccma$ratio.seq[i],
##D                    trace=cccma$trace[i])
##D     qdm.c[,i] <- fit.qdm$mhat.c
##D     qdm.p[,i] <- fit.qdm$mhat.p
##D }
##D 
##D # Multivariate MBCp bias correction
##D fit.mbcp <- MBCp(o.c=cccma$rcm.c, m.c=cccma$gcm.c,
##D                  m.p=cccma$gcm.p, ratio.seq=cccma$ratio.seq,
##D                  trace=cccma$trace)
##D mbcp.c <- fit.mbcp$mhat.c
##D mbcp.p <- fit.mbcp$mhat.p
##D 
##D # Multivariate MBCr bias correction
##D fit.mbcr <- MBCr(o.c=cccma$rcm.c, m.c=cccma$gcm.c,
##D                  m.p=cccma$gcm.p, ratio.seq=cccma$ratio.seq,
##D                  trace=cccma$trace)
##D mbcr.c <- fit.mbcr$mhat.c
##D mbcr.p <- fit.mbcr$mhat.p
##D 
##D # Multivariate MBCn bias correction
##D fit.mbcn <- MBCn(o.c=cccma$rcm.c, m.c=cccma$gcm.c,
##D                  m.p=cccma$gcm.p, ratio.seq=cccma$ratio.seq,
##D                  trace=cccma$trace)
##D mbcn.c <- fit.mbcn$mhat.c
##D mbcn.p <- fit.mbcn$mhat.p
##D colnames(mbcn.c) <- colnames(mbcn.p) <-
##D     colnames(cccma$rcm.c)
##D 
##D # Correlation matrices (Pearson and Spearman)
##D # MBCp
##D dev.new()
##D par(mfrow=c(2, 2))
##D plot(c(cor(cccma$rcm.c)), c(cor(qdm.c)), col='black',
##D      pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCp',
##D      main='Pearson correlation\nMBCp calibration')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.c)), c(cor(mbcp.c)), col='red')
##D plot(c(cor(cccma$rcm.p)), c(cor(qdm.p)),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCp',
##D      main='Pearson correlation\nMBCp evaluation')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.p)), c(cor(mbcp.p)), col='red')
##D plot(c(cor(cccma$rcm.c, m='s')), c(cor(qdm.c, m='s')),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCp',
##D      main='Spearman correlation\nMBCp calibration')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.c, m='s')), c(cor(mbcp.c, m='s')),
##D        col='red')
##D plot(c(cor(cccma$rcm.p, m='s')), c(cor(qdm.p, m='s')),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCp',
##D      main='Spearman correlation\nMBCp evaluation')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.p, m='s')), c(cor(mbcp.p, m='s')),
##D        col='red')
##D 
##D # MBCr
##D dev.new()
##D par(mfrow=c(2, 2))
##D plot(c(cor(cccma$rcm.c)), c(cor(qdm.c)), col='black',
##D      pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCr',
##D      main='Pearson correlation\nMBCr calibration')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.c)), c(cor(mbcr.c)), col='blue')
##D plot(c(cor(cccma$rcm.p)), c(cor(qdm.p)),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCr',
##D      main='Pearson correlation\nMBCr evaluation')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.p)), c(cor(mbcr.p)), col='blue')
##D plot(c(cor(cccma$rcm.c, m='s')), c(cor(qdm.c, m='s')),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCr',
##D      main='Spearman correlation\nMBCr calibration')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.c, m='s')), c(cor(mbcr.c, m='s')),
##D        col='blue')
##D plot(c(cor(cccma$rcm.p, m='s')), c(cor(qdm.p, m='s')),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCr',
##D      main='Spearman correlation\nMBCr evaluation')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.p, m='s')), c(cor(mbcr.p, m='s')),
##D        col='blue')
##D 
##D # MBCn
##D dev.new()
##D par(mfrow=c(2, 2))
##D plot(c(cor(cccma$rcm.c)), c(cor(qdm.c)), col='black',
##D      pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCn',
##D      main='Pearson correlation\nMBCn calibration')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.c)), c(cor(mbcn.c)), col='orange')
##D plot(c(cor(cccma$rcm.p)), c(cor(qdm.p)),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCn',
##D      main='Pearson correlation\nMBCn evaluation')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.p)), c(cor(mbcn.p)), col='orange')
##D plot(c(cor(cccma$rcm.c, m='s')), c(cor(qdm.c, m='s')),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCn',
##D      main='Spearman correlation\nMBCn calibration')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.c, m='s')), c(cor(mbcn.c, m='s')),
##D        col='orange')
##D plot(c(cor(cccma$rcm.p, m='s')), c(cor(qdm.p, m='s')),
##D      col='black', pch=19, xlim=c(-1, 1), ylim=c(-1, 1),
##D      xlab='CanRCM4', ylab='CanESM2 MBCn',
##D      main='Spearman correlation\nMBCn evaluation')
##D abline(0, 1)
##D grid()
##D points(c(cor(cccma$rcm.p, m='s')), c(cor(mbcn.p, m='s')),
##D        col='orange')
##D 
##D # Pairwise scatterplots
##D dev.new()
##D pairs(cccma$gcm.c, main='CanESM2 calibration', col='#0000001A')
##D dev.new()
##D pairs(cccma$rcm.c, main='CanRCM4 calibration', col='#0000001A')
##D dev.new()
##D pairs(qdm.c, main='QDM calibration', col='#0000001A')
##D dev.new()
##D pairs(mbcp.c, main='MBCp calibration', col='#FF00001A')
##D dev.new()
##D pairs(mbcr.c, main='MBCr calibration', col='#0000FF1A')
##D dev.new()
##D pairs(mbcn.c, main='MBCn calibration', col='#FFA5001A')
##D 
##D # Energy distance skill score relative to univariate QDM
##D escore.qdm <- escore(cccma$rcm.p, qdm.p, scale.x=TRUE)
##D escore.mbcp <- escore(cccma$rcm.p, mbcp.p, scale.x=TRUE)
##D escore.mbcr <- escore(cccma$rcm.p, mbcr.p, scale.x=TRUE)
##D escore.mbcn <- escore(cccma$rcm.p, mbcn.p, scale.x=TRUE)
##D 
##D cat('ESS (MBCp):', 1-escore.mbcp/escore.qdm, '\n')
##D cat('ESS (MBCr):', 1-escore.mbcr/escore.qdm, '\n')
##D cat('ESS (MBCn):', 1-escore.mbcn/escore.qdm, '\n')
## End(Not run)



