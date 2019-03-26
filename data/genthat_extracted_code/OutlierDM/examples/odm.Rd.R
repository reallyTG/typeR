library(OutlierDM)


### Name: odm
### Title: Outlier Dectection for Multi-replicated data
### Aliases: odm
### Keywords: odm

### ** Examples

  ## Not run: 
##D     ##############################################################
##D     #
##D     #   Outlier Detection for Mass Spectrometry Data
##D     #   Section 3. Illustration
##D     #   by HyungJun Cho and Soo-Heang Eo,
##D     #   Dept of Statistics, Korea University, Seoul, Korea
##D     #
##D     ##############################################################
##D 
##D     #####
##D     # Load a package OutlierDM
##D 
##D     # If an OutlierDM package is not installed on your system, type
##D     #install.package('OutlierDM', dependency = TRUE)
##D     library(OutlierDM)
##D 
##D     #####
##D     # Sec 3.1 When the number of replicates is large enough
##D     ## Load toy dataset
##D     data(toy)
##D     head(toy)
##D     pairs(log2(toy), pch = 20, cex = .7)
##D 
##D     #####
##D     # Fit 1. Z-score based criterion
##D     fit1 = odm(x = toy, method = "Zscore", k = 3)
##D     fit1
##D     summary(fit1)
##D     head(input(fit1))
##D     head(output(fit1))
##D     print(outliers(fit1), digits = 3)
##D     plot(fit1)
##D     rect(1, -4, 10, 4, col = heat.colors(20,alpha = 0.3), border = heat.colors(20,alpha = 0.5))
##D     oneplot(object = fit1, i = 4)
##D     title("Outlier Detection by the Z-score criterion")
##D 
##D     # Add a peptide name on a dot-plot
##D     #oneplot(fit1, 191,1)
##D     #title("Outlier Detection by the Z-score criterion")
##D 
##D     #####
##D     # Fit 2. Grubbs test criteria
##D     fit2 = odm(x = toy, method ="grubbs", alpha = 0.01)
##D     fit2
##D     summary(fit2)
##D     head(output(fit2))
##D     print(outliers(fit2), digits = 3)
##D     oneplot(object = fit2, i = 1)
##D     title("Outlier Detection by the Grubbs criterion")
##D 
##D     # Add text
##D     #oneplot(fit2, 191,1)
##D     #title("Outlier Detection by the Grubbs criterion")
##D 
##D     #####
##D     # Fit 3. IQR criteria
##D     fit3 = odm(x = toy, method = "iqr", k = 3)
##D     fit3
##D     summary(fit3)
##D     print(outliers(fit3), digits = 3)
##D     plot(fit3)
##D     rect(1, -4, 10, 40, col = heat.colors(20,alpha = 0.3), border = heat.colors(20,alpha = 0.5))
##D     oneplot(fit3, 1)
##D     title("Outlier Detection by the IQR criterion")
##D 
##D     # Add a peptide name on a dot-plot
##D     #oneplot(fit3, 1, 1)
##D     #title("Outlier Detection by the IQR criterion")
##D 
##D     #####
##D     # Fit 4. SIQR criteria
##D     fit4 = odm(x = toy, method = "siqr", k = 3)
##D     fit4
##D     summary(fit4)
##D     print(outliers(fit4), digits = 3)
##D     plot(fit4)
##D     rect(1, -4, 10, 4, col = heat.colors(20,alpha = 0.3), border = heat.colors(20,alpha = 0.5))
##D     oneplot(fit4, 1)
##D     title("Outlier Detection by the SIQR criterion")
##D 
##D     #####################
##D     ## Real data example
##D     #####################
##D     data(lcms3)
##D     head(lcms3)
##D     pairs(log2(lcms3), pch = 20, cex = .7)
##D 
##D     #####
##D     # Fit 5. OutlierD
##D     fit5 = odm(lcms3[,1:2], method = "pair", k = 3)
##D     fit5
##D     summary(fit5)
##D     head(output(fit5))
##D     print(outliers(fit5), digits = 3)
##D     plot(fit5)
##D     title("Outlier Detection by the OutlierD algorithm")
##D 
##D     #####
##D     # Fit 6. OutlierDM 
##D     fit6 = odm(lcms3, method = "proj", k = 3, center = TRUE)
##D     fit6
##D     summary(fit6)
##D     print(outliers(fit6), digits = 3)
##D     plot(fit6)
##D     title("Outlier Detection by the OutlierDM algorithm")
##D     oneplot(fit6, 18)
##D     #oneplot(fit6, 18, 1)
##D     title("The dotplot for the 18th samples of the lcms3 data")
##D     ### End of the illustration
##D 
##D     
##D     #####
##D     # Other OutlierDM algorithms
##D     data(lcms3)
##D     
##D     ## Load 
##D     ## Fit projection approaches
##D     fit.proj.const <- odm(lcms3, quantreg="constant")
##D     fit.proj.linear <- odm(lcms3, quantreg="linear")
##D     fit.proj.nonlin <- odm(lcms3, quantreg="nonlin")
##D     fit.proj.nonpara <- odm(lcms3, quantreg="nonpar", lbda = 1)
##D     
##D     par(mfrow = c(2,2))
##D     plot(fit.proj.const, main = "Constant")
##D     plot(fit.proj.linear, main = "Linear")
##D     plot(fit.proj.nonlin, main = "NonLinear")
##D     plot(fit.proj.nonpara, main = "Nonparametric")
##D 
##D   
## End(Not run)



