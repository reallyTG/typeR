library(phenology)


### Name: fitRMU
### Title: Adjust incomplete timeseries with various constraints.
### Aliases: fitRMU

### ** Examples

## Not run: 
##D library("phenology")
##D RMU.names.AtlanticW <- data.frame(mean=c("Yalimapo.French.Guiana", 
##D                                          "Galibi.Suriname", 
##D                                          "Irakumpapy.French.Guiana"), 
##D                                  se=c("se_Yalimapo.French.Guiana", 
##D                                       "se_Galibi.Suriname", 
##D                                       "se_Irakumpapy.French.Guiana"))
##D data.AtlanticW <- data.frame(Year=c(1990:2000), 
##D       Yalimapo.French.Guiana=c(2076, 2765, 2890, 2678, NA, 
##D                                6542, 5678, 1243, NA, 1566, 1566),
##D       se_Yalimapo.French.Guiana=c(123.2, 27.7, 62.5, 126, NA, 
##D                                  230, 129, 167, NA, 145, 20),
##D       Galibi.Suriname=c(276, 275, 290, NA, 267, 
##D                        542, 678, NA, 243, 156, 123),
##D       se_Galibi.Suriname=c(22.3, 34.2, 23.2, NA, 23.2, 
##D                            4.3, 2.3, NA, 10.3, 10.1, 8.9),
##D       Irakumpapy.French.Guiana=c(1076, 1765, 1390, 1678, NA, 
##D                                3542, 2678, 243, NA, 566, 566),
##D       se_Irakumpapy.French.Guiana=c(23.2, 29.7, 22.5, 226, NA, 
##D                                  130, 29, 67, NA, 15, 20))
##D                            
##D cst <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D                colname.year="Year", model.trend="Constant", 
##D                model.SD="Zero")
##D cst <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D                colname.year="Year", model.trend="Constant", 
##D                model.SD="Zero", 
##D                control=list(trace=1, REPORT=100, maxit=500, parscale = c(3000, -0.2, 0.6)))
##D                
##D # Example with optimx
##D require("optimx")
##D cst <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D                colname.year="Year", model.trend="Constant", 
##D                model.SD="Zero", optim="optimx", method=c("Nelder-Mead","BFGS"), 
##D                control = list(trace = 0, REPORT = 100, maxit = 500, 
##D                parscale = c(3000, -0.2, 0.6)))
##D expo <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D                colname.year="Year", model.trend="Exponential", 
##D                model.SD="Zero", optim="optimx", method=c("Nelder-Mead","BFGS"), 
##D                control = list(trace = 0, REPORT = 100, maxit = 500, 
##D                parscale = c(6000, -0.05, -0.25, 0.6)))
##D YS <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D              colname.year="Year", model.trend="Year-specific", method=c("Nelder-Mead","BFGS"), 
##D              optim="optimx", model.SD="Zero")
##D YS1 <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D              colname.year="Year", model.trend="Year-specific", method=c("Nelder-Mead","BFGS"), 
##D              optim="optimx", model.SD="Zero", model.rookeries="First-order")
##D YS1_cst <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D              colname.year="Year", model.trend="Year-specific", 
##D              model.SD="Constant", model.rookeries="First-order", 
##D              optim="optimx", parameters=YS1$par, method=c("Nelder-Mead","BFGS"))
##D YS2 <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D              colname.year="Year", model.trend="Year-specific",
##D              model.SD="Zero", model.rookeries="Second-order", 
##D              optim="optimx", parameters=YS1$par, method=c("Nelder-Mead","BFGS"))
##D YS2_cst <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D              colname.year="Year", model.trend="Year-specific",
##D              model.SD="Constant", model.rookeries="Second-order", 
##D              optim="optimx", parameters=YS1_cst$par, method=c("Nelder-Mead","BFGS"))
##D                
##D compare_AIC(Constant=cst, Exponential=expo, 
##D YearSpecific=YS)
##D 
##D compare_AIC(YearSpecific_ProportionsFirstOrder_Zero=YS1,
##D YearSpecific_ProportionsFirstOrder_Constant=YS1_cst)
##D 
##D compare_AIC(YearSpecific_ProportionsConstant=YS,
##D            YearSpecific_ProportionsFirstOrder=YS1,
##D            YearSpecific_ProportionsSecondOrder=YS2)
##D            
##D compare_AIC(YearSpecific_ProportionsFirstOrder=YS1_cst,
##D            YearSpecific_ProportionsSecondOrder=YS2_cst)
##D 
##D barplot_errbar(YS1_cst$proportions[1, ], y.plus = YS1_cst$proportions.CI.0.95[1, ], 
##D y.minus = YS1_cst$proportions.CI.0.05[1, ], las=1, ylim=c(0, 0.7), 
##D main="Proportion of the different rookeries in the region")
##D 
##D plot(cst, main="Use of different beaches along the time", what="total")
##D plot(expo, main="Use of different beaches along the time", what="total")
##D plot(YS2_cst, main="Use of different beaches along the time", what="total")
##D 
##D plot(YS1, main="Use of different beaches along the time")
##D plot(YS1_cst, main="Use of different beaches along the time")
##D plot(YS1_cst, main="Use of different beaches along the time", what="numbers")
##D 
## End(Not run)



