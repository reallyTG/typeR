library(TAM)


### Name: IRT.threshold
### Title: Thurstonian Thresholds and Wright Map for Item Response Models
### Aliases: IRT.threshold IRT.WrightMap IRT.WrightMap.IRT.threshold
###   print.IRT.threshold
### Keywords: Thurstonian thresholds

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Fitted unidimensional model with gdm
##D #############################################################################
##D 
##D data(data.Students)
##D dat <- data.Students
##D 
##D # select part of the dataset
##D resp <- dat[, paste0("sc",1:4) ]
##D resp[ paste(resp[,1])==3,1] <-  2
##D psych::describe(resp)
##D 
##D # Model 1: Partial credit model in gdm
##D theta.k <- seq( -5, 5, len=21 )   # discretized ability
##D mod1 <- CDM::gdm( dat=resp, irtmodel="1PL", theta.k=theta.k, skillspace="normal",
##D               centered.latent=TRUE)
##D 
##D # compute thresholds
##D thresh1 <- TAM::IRT.threshold(mod1)
##D print(thresh1)
##D IRT.WrightMap(thresh1)
##D 
##D #############################################################################
##D # EXAMPLE 2: Fitted mutidimensional model with gdm
##D #############################################################################
##D 
##D data( data.fraction2 )
##D dat <- data.fraction2$data
##D Qmatrix <- data.fraction2$q.matrix3
##D 
##D # Model 1: 3-dimensional Rasch Model (normal distribution)
##D theta.k <- seq( -4, 4, len=11 )   # discretized ability
##D mod1 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, Qmatrix=Qmatrix,
##D               centered.latent=TRUE, maxiter=10 )
##D summary(mod1)
##D 
##D # compute thresholds
##D thresh1 <- TAM::IRT.threshold(mod1)
##D print(thresh1)
##D 
##D #############################################################################
##D # EXAMPLE 3: Item-wise thresholds
##D #############################################################################
##D 
##D data(data.timssAusTwn.scored)
##D dat <- data.timssAusTwn.scored
##D dat <- dat[, grep("M03", colnames(dat) ) ]
##D summary(dat)
##D 
##D # fit partial credit model
##D mod <- TAM::tam.mml( dat )
##D # compute thresholds with tam.threshold function
##D t1mod <- TAM::tam.threshold( mod )
##D t1mod
##D # compute thresholds with IRT.threshold function
##D t2mod <- TAM::IRT.threshold( mod )
##D t2mod
##D # compute item-wise thresholds
##D t3mod <- TAM::IRT.threshold( mod, type="item")
##D t3mod
## End(Not run)



