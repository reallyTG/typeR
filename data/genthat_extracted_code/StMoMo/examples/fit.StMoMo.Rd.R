library(StMoMo)


### Name: fit.StMoMo
### Title: Fit a Stochastic Mortality Model
### Aliases: fit.StMoMo

### ** Examples

   

# Lee-Carter model only for older ages
LCfit <- fit(lc(), data = EWMaleData, ages.fit = 55:89)
plot(LCfit)

# Use arguments Dxt, Ext, ages, years to pass fitting data
LCfit <- fit(lc(), Dxt = EWMaleData$Dxt, Ext = EWMaleData$Ext, 
             ages = EWMaleData$ages, years = EWMaleData$years, 
             ages.fit = 55:89)
plot(LCfit)

# APC model weigthing out the 3 first and last cohorts
wxt <- genWeightMat(EWMaleData$ages,  EWMaleData$years, clip = 3)
APCfit <- fit(apc(), data = EWMaleData, wxt = wxt)
plot(APCfit, parametricbx = FALSE, nCol = 3)

# Set verbose = FALSE for silent fitting
APCfit <- fit(apc(), data = EWMaleData,  wxt = wxt, 
              verbose = FALSE)
## Not run: 
##D   # Poisson Lee-Carter model with the static age function set to  
##D   # the mean over time of the log-death rates
##D   constLCfix_ax <- function(ax, bx, kt, b0x, gc, wxt, ages){  
##D     c1 <- sum(bx, na.rm = TRUE)
##D     bx <- bx / c1
##D     kt <- kt * c1  
##D     list(ax = ax, bx = bx, kt = kt, b0x = b0x, gc = gc)  
##D   }  
##D   LCfix_ax <- StMoMo(link = "log", staticAgeFun = FALSE, 
##D                      periodAgeFun = "NP", constFun =  constLCfix_ax)
##D   LCfix_axfit <- fit(LCfix_ax, data= EWMaleData, 
##D                      oxt = rowMeans(log(EWMaleData$Dxt / EWMaleData$Ext)))
##D   plot(LCfix_axfit)
## End(Not run)



