library(MCPMod)


### Name: MCPMod-package
### Title: Design and Analysis of Dose-Finding Studies
### Aliases: MCPMod-package
### Keywords: package

### ** Examples

# detailed information regarding MCP-Mod methodology
# and R-package available via vignette("MCPMod")
## Not run: 
##D # planning a trial for MCPMod
##D doses <- c(0,10,25,50,100,150)                                             
##D models <- list(linear = NULL, emax = c(25),                                
##D                logistic = c(50, 10.88111), exponential = c(85),            
##D                betaMod = matrix(c(0.33, 2.31, 1.39, 1.39), byrow=TRUE,nrow=2))
##D plotModels(models, doses, base = 0, maxEff = 0.4, scal = 200) 
##D sSize <- sampSize(models, doses, base = 0, maxEff = 0.4, sigma = 1,             
##D            upperN = 80, scal = 200, alpha = 0.05)
##D sSize
##D plM <- planMM(models, doses, n = rep(sSize$samp.size,6), scal=200, alpha = 0.05)
##D plM
##D plot(plM)
##D 
##D # analysing a trial
##D data(biom)
##D models <- list(linear = NULL, linlog = NULL, emax = 0.2,
##D             exponential = c(0.279,0.15), quadratic = c(-0.854,-1))
##D 
##D dfe <- MCPMod(biom, models, alpha = 0.05, dePar = 0.05, pVal = TRUE,
##D            selModel = "maxT", doseEst = "MED2", clinRel = 0.4, off = 1)
##D # detailed information is available via summary
##D summary(dfe)
##D # plots data with selected model function
##D plot(dfe, complData = TRUE, cR = TRUE)
## End(Not run)



