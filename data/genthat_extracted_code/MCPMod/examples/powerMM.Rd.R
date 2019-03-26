library(MCPMod)


### Name: powerMM
### Title: Calculate power for different sample sizes
### Aliases: powerMM
### Keywords: design

### ** Examples

## Not run: 
##D doses <- c(0,10,25,50,100,150)                                         
##D models <- list(linear = NULL, emax = 25,                               
##D                logistic = c(50, 10.88111), exponential= 85,            
##D                betaMod=matrix(c(0.33,2.31,1.39,1.39), byrow=TRUE, nrow=2))
##D pM <- powerMM(models, doses, base = 0, maxEff = 0.4, sigma = 1,
##D             alpha = 0.05, lower = 10, upper = 100, step = 20, scal = 200)         
##D pM
##D # a graphical display provides plot method
##D plot(pM)                                
##D # reproduces plot in JBS 16, p.651      
##D plot(pM, line.at = 0.8, models = "none")
##D 
##D 
##D # the same with fullMod object and default alpha
##D fMod <- fullMod(models, doses, base = 0, maxEff = 0.4, scal=200) 
##D pM <- powerMM(fMod, sigma = 1, lower = 10, upper = 100, 
##D               step = 20, scal = 200)         
##D pM
##D 
##D # using unbalanced (but fixed) allocations
##D pM <- powerMM(models, doses, base = 0, maxEff = 0.4, sigma = 1,       
##D                lower = 10, upper = 100, step = 20, scal = 200,
##D                alRatio = c(3, 2, 2, 1, 1, 1), typeN = "arm") 
##D plot(pM, summ = "mean")
##D 
##D # example, where means are directly specified
##D # doses   
##D dvec <- c(0, 10, 50, 100)
##D # mean vectors
##D mu1 <- c(1, 2, 2, 2)
##D mu2 <- c(1, 1, 2, 2)
##D mu3 <- c(1, 1, 1, 2)
##D mMat <- cbind(mu1, mu2, mu3)
##D dimnames(mMat)[[1]] <- dvec
##D pM <- powerMM(muMat = mMat, doses = dvec, sigma = 2, lower = 10,
##D               upper = 100, step = 20)         
##D pM
## End(Not run)



