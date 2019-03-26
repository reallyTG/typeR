library(metaSEM)


### Name: Roorda11
### Title: Studies on Students' School Engagement and Achievement Reported
###   by Roorda et al. (2011)
### Aliases: Roorda11
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D ## Random-effects model: First stage analysis
##D random1 <- tssem1(Cov = Roorda11$data, n = Roorda11$n, method = "REM",
##D                   RE.type = "Diag")
##D summary(random1)
##D 
##D varnames <- c("pos", "neg", "enga", "achiev")
##D 
##D ## Prepare a regression model using create.mxMatrix()
##D A <- create.mxMatrix(c(0,0,0,0,
##D                        0,0,0,0,
##D                        "0.1*b31","0.1*b32",0,0,
##D                        0,0,"0.1*b43",0),
##D                      type = "Full", nrow = 4, ncol = 4, byrow = TRUE,
##D                      name = "A", as.mxMatrix = FALSE)
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(A) <- list(varnames, varnames)
##D A
##D 
##D S <- create.mxMatrix(c(1,
##D                        ".5*p21",1,
##D                        0,0,"0.6*p33",
##D                        0,0,0,"0.6*p44"), 
##D                      type="Symm", byrow = TRUE,
##D                      name="S", as.mxMatrix = FALSE)
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(S) <- list(varnames, varnames)
##D S
##D 
##D ## Random-effects model: Second stage analysis
##D random2 <- tssem2(random1, Amatrix=A, Smatrix=S, diag.constraints=TRUE, 
##D                   intervals="LB")
##D summary(random2)
##D 
##D ## Display the model with the parameter estimates    
##D plot(random2)
## End(Not run)



