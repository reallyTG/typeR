library(PP)


### Name: findmodel
### Title: Create a model-type vector template
### Aliases: findmodel
### Keywords: Parameters Person

### ** Examples

################# GPCM  and 4PL mixed #########################################

# some threshold parameters
THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
# slopes
sl     <- c(0.5,1,1.5,1.1,1,0.98)

THRESx <- THRES
THRESx[2,1:3] <- NA

# for the 4PL item the estimated parameters are submitted, 
# for the GPCM items the lower asymptote = 0 
# and the upper asymptote = 1.
la     <- c(0.02,0.1,0,0,0,0)
ua     <- c(0.97,0.91,1,1,1,1)

awmatrix <- matrix(c(1,0,1,0,1,1,1,0,0,1
                     ,2,0,0,0,0,0,0,0,0,1
                     ,1,2,2,1,1,1,1,0,0,1),byrow=TRUE,nrow=5)

# create model2est
# this function tries to help finding the appropriate 
# model by inspecting the THRESx.
model2est <- findmodel(THRESx)


# MLE
respmixed_mle <- PPall(respm = awmatrix,thres = THRESx, 
                     slopes = sl,lowerA = la, upperA=ua,type = "mle",
                     model2est=model2est)
# WLE
respmixed_wle <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua,type = "wle",
                    model2est=model2est)
# MAP estimation
respmixed_map <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua, type = "map",
                    model2est=model2est)

# EAP estimation
respmixed_eap <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua, type = "eap",
                    model2est=model2est)

# Robust estimation
respmixed_rob <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua, type = "robust",
                    model2est=model2est)


# summary to summarize the results
summary(respmixed_mle)
summary(respmixed_wle)
summary(respmixed_map)
summary(respmixed_eap)
summary(respmixed_rob)




