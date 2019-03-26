library(intubate)


### Name: strucchange
### Title: Interfaces for strucchange package for data science pipelines.
### Aliases: ntbt_breakpoints ntbt_efp ntbt_Fstats ntbt_mefp ntbt_recresid
###   ntbt_sctest
### Keywords: intubate magrittr strucchange ntbt_breakpoints ntbt_efp
###   ntbt_Fstats ntbt_mefp ntbt_recresid ntbt_sctest

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(strucchange)
##D 
##D ## ntbt_breakpoints: Dating Breaks
##D data("Nile")
##D d <- list(Nl = Nile)
##D 
##D ## Original function to interface
##D breakpoints(Nl ~ 1, data = d)
##D 
##D ## The interface puts data as first parameter
##D ntbt_breakpoints(d, Nl ~ 1)
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_breakpoints(Nl ~ 1)
##D 
##D 
##D ## ntbt_efp: Empirical Fluctuation Processes
##D ## Original function to interface
##D ocus.nile <- efp(Nl ~ 1, d, type = "OLS-CUSUM")
##D plot(ocus.nile)
##D 
##D ## The interface puts data as first parameter
##D ocus.nile <- ntbt_efp(d, Nl ~ 1, type = "OLS-CUSUM")
##D plot(ocus.nile)
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_efp(Nl ~ 1, type = "OLS-CUSUM") %>%
##D   plot()
##D 
##D 
##D ## ntbt_Fstats: F Statistics
##D ## Original function to interface
##D fs.nile <- Fstats(Nl ~ 1, data = d)
##D plot(fs.nile)
##D 
##D ## The interface puts data as first parameter
##D fs.nile <- ntbt_Fstats(d, Nl ~ 1)
##D plot(fs.nile)
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_Fstats(Nl ~ 1) %>%
##D   plot()
##D 
##D 
##D ## ntbt_mefp: Monitoring of Empirical Fluctuation Processes
##D df1 <- data.frame(y = rnorm(300))
##D df1[150:300, "y"] <- df1[150:300, "y"] + 1
##D 
##D ## Original function to interface
##D mefp(y ~ 1, data = df1[1:50,, drop = FALSE], type = "ME", h = 1, alpha = 0.05)
##D 
##D ## The interface puts data as first parameter
##D ntbt_mefp(df1[1:50,, drop = FALSE], y ~ 1, type = "ME", h = 1, alpha = 0.05)
##D 
##D ## so it can be used easily in a pipeline.
##D df1[1:50,, drop = FALSE] %>%
##D   ntbt_mefp(y ~ 1, type = "ME", h = 1, alpha = 0.05)
##D 
##D 
##D ## ntbt_recresid: Recursive Residuals
##D d1 <- list(x = rnorm(100) + rep(c(0, 2), each = 50))
##D 
##D ## Original function to interface
##D recresid(x ~ 1, d1)
##D 
##D ## The interface puts data as first parameter
##D ntbt_recresid(d1, x ~ 1)
##D 
##D ## so it can be used easily in a pipeline.
##D d1 %>%
##D   ntbt_recresid(x ~ 1)
##D 
##D 
##D ## ntbt_sctest: Structural Change Tests in Linear Regression Models
##D data("longley")
##D ## Original function to interface
##D sctest(Employed ~ Year + GNP.deflator + GNP + Armed.Forces, data = longley,
##D        type = "Chow", point = 7)
##D 
##D ## The interface puts data as first parameter
##D ntbt_sctest(longley, Employed ~ Year + GNP.deflator + GNP + Armed.Forces,
##D             type = "Chow", point = 7)
##D 
##D ## so it can be used easily in a pipeline.
##D longley %>%
##D   ntbt_sctest(Employed ~ Year + GNP.deflator + GNP + Armed.Forces,
##D               type = "Chow", point = 7)
## End(Not run)



