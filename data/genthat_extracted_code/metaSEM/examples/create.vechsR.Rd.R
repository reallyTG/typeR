library(metaSEM)


### Name: create.vechsR
### Title: Create implicit diagonal constraints on the model implied
###   correlation matrix
### Aliases: create.vechsR
### Keywords: osmasem

### ** Examples

## Not run: 
##D ## Proposed model
##D model1 <- 'W2 ~ w2w*W1 + s2w*S1
##D            S2 ~ w2s*W1 + s2s*S1
##D            W1 ~~ w1WITHs1*S1
##D            W2 ~~ w2WITHs2*S2
##D            W1 ~~ 1*W1
##D            S1 ~~ 1*S1
##D            W2 ~~ Errw2*W2
##D            S2 ~~ Errs2*S2'
##D 
##D ## Convert into RAM    
##D RAM1 <- lavaan2RAM(model1, obs.variables=c("W1", "S1", "W2", "S2"))
##D 
##D ## No moderator    
##D M0 <- create.vechsR(A0=RAM1$A, S0=RAM1$S, F0=NULL, Ax=NULL, Sx=NULL)
##D 
##D ## Lag (definition variable) as a moderator on the paths in the Amatrix    
##D Ax <- matrix(c(0,0,0,0,
##D                0,0,0,0,
##D                "0*data.Lag","0*data.Lag",0,0,
##D                "0*data.Lag","0*data.Lag",0,0),
##D              nrow=4, ncol=4, byrow=TRUE)
##D                 
##D M1 <- create.vechsR(A0=RAM1$A, S0=RAM1$S, F0=NULL, Ax=Ax, Sx=NULL)    
##D 
##D ## Lag (definition variable) as a moderator on the correlation in the Smatrix
##D Sx <- matrix(c(0,"0*data.Lag",0,0,
##D                "0*data.Lag",0,0,0,
##D                0,0,0,"0*data.Lag",
##D                0,0,"0*data.Lag",0),
##D              nrow=4, ncol=4, byrow=TRUE)
##D 
##D M2 <- create.vechsR(A0=RAM1$A, S0=RAM1$S, F0=NULL, Ax=NULL, Sx=Sx)
## End(Not run)



