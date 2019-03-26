library(phenology)


### Name: fitCF
### Title: Fit a model of Clutch Frequency for marine turtles.
### Aliases: fitCF

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D data(MarineTurtles_2002)
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002)
##D 
##D # Paraetric model for clutch frequency
##D o_mu1p1_CFp <- fitCF(x = c(mu = 2.1653229641404539, 
##D                  sd = 1.1465246643327098, 
##D                  p = 0.25785366120357966), 
##D                  fixed.parameters=NULL, 
##D                  data=ECFOCF_2002, hessian = TRUE)
##D  
##D # Non parametric model for clutch frequency
##D o_mu1p1_CFnp <- fitCF(x = c(mu.1 = 18.246619595610383, 
##D                        mu.2 = 4.2702163522832892, 
##D                        mu.3 = 2.6289986859556458, 
##D                        mu.4 = 3.2496360919228611, 
##D                        mu.5 = 2.1602522716550943, 
##D                        mu.6 = 0.68617023351032846, 
##D                        mu.7 = 4.2623607001877026, 
##D                        mu.8 = 1.1805600042630455, 
##D                        mu.9 = 2.2786176350939731, 
##D                        mu.10 = 0.47676265496204945, 
##D                        mu.11 = 5.8988238539197062e-08, 
##D                        mu.12 = 1.4003187851424953e-07, 
##D                        mu.13 = 2.4128444894899776e-07, 
##D                        mu.14 = 2.4223748020049825e-07, 
##D                        p = 0.32094401970037578), 
##D                  fixed.parameters=c(mu.15 = 1E-10), 
##D                  data=ECFOCF_2002, hessian = TRUE)
##D                  
##D o_mu2p1 <- fitCF(x = c(mu1 = 1.2190766766978423, 
##D                      sd1 = 0.80646454821956925, 
##D                      mu2 = 7.1886819592223246, 
##D                      sd2 = 0.18152887523015518, 
##D                      p = 0.29347220802963259, 
##D                      OTN = 2.9137627675219533), 
##D                   fixed.parameters=NULL,
##D                   data=ECFOCF_2002, hessian = TRUE)
##D 
##D o_mu1p2 <- fitCF(x = c(mu = 5.3628701816871462, 
##D                      sd = 0.39390555498088764, 
##D                      p1 = 0.61159637544418755, 
##D                      p2 = -2.4212753004659189, 
##D                      OTN = 0.31898004668901009),
##D                  data=ECFOCF_2002, hessian = TRUE)
##D                  
##D o_mu2p2 <- fitCF(x = c(mu1 = 0.043692606004492131, 
##D                    sd1 = 1.9446036983033428, 
##D                    mu2 = 7.3007868915644751, 
##D                    sd2 = 0.16109296152913491, 
##D                    p1 = 1.6860260469536992, 
##D                    p2 = -0.096816113083788985, 
##D                    OTN = 2.2604431232973501), 
##D                   data=ECFOCF_2002, hessian = TRUE)
##D 
##D compare_AIC(mu1p1=o_mu1p1_CFp, 
##D             mu2p1=o_mu2p1, 
##D             mu1p2=o_mu1p2, 
##D             mu2p2=o_mu2p2)
##D                  
##D o_mu3p3 <- fitCF(x = c(mu1 = 0.24286312214288761, 
##D                             sd1 = 0.34542255091729313, 
##D                             mu2 = 5.0817174343025551, 
##D                             sd2 = 1.87435099405695, 
##D                             mu3 = 5.2009265101740683, 
##D                             sd3 = 1.79700447678357, 
##D                             p1 = 8.8961708614726156, 
##D                             p2 = 0.94790116453886453, 
##D                             p3 = -0.76572930634505421, 
##D                             OTN1 = 1.2936848663276974, 
##D                             OTN2 = 0.81164278235645926),
##D                  data=ECFOCF_2002, hessian = TRUE)
##D                  
##D 
##D o_mu3p1 <- fitCF(x = structure(c(0.24387978183477, 
##D                                    1.2639261745506, 
##D                                    4.94288464711349, 
##D                                    1.945082889758, 
##D                                    4.9431672350811, 
##D                                    1.287663104591, 
##D                                    0.323636536050397, 
##D                                    1.37072039291397, 
##D                                    9.28055412564559e-06), 
##D                                   .Names = c("mu1", "sd1", "mu2", 
##D                                              "sd2", "mu3", "sd3", 
##D                                              "p", "OTN1", "OTN2")),
##D                  data=ECFOCF_2002, hessian = TRUE)
##D                  
##D 
##D o_mu1p3 <- fitCF(x = structure(c(4.65792402108387, 
##D                                    1.58445909785, 
##D                                    -2.35414198317177, 
##D                                    0.623757854800649, 
##D                                    -3.62623634029326, 
##D                                    11.6950204755787, 
##D                                    4.05273728846523), 
##D                                    .Names = c("mu", "sd", 
##D                                               "p1", "p2", "p3", 
##D                                               "OTN1", "OTN2")),
##D                  data=ECFOCF_2002, hessian = TRUE)
##D                  
##D compare_AIC(mu1p1=o_mu1p1, 
##D             mu2p1=o_mu2p1, 
##D             mu1p2=o_mu1p2, 
##D             mu2p2=o_mu2p2, 
##D             mu3p3=o_mu3p3, 
##D             mu1p3=o_mu1p3, 
##D             mu3p1=o_mu3p1)
##D             
##D  # 3D model for (ECF, OCF, period)           
##D             
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002, 
##D                            date0=as.Date("2002-01-01"))
##D 
##D fp <- rep(0, dim(ECFOCF_2002)[3])
##D names(fp) <- paste0("p.", formatC(1:(dim(ECFOCF_2002)[3]), width=2, flag="0"))
##D par <- c(mu = 2.6404831115214353, 
##D         sd = 0.69362774786433479, 
##D         mu_season = 12.6404831115214353, 
##D         sd_season = 1.69362774786433479)
##D par <- c(par, fp[attributes(ECFOCF_2002)$table["begin"]:
##D                  attributes(ECFOCF_2002)$table["end"]])
##D # The value of p (logit -capture probability) out of the period 
##D # of monitoring is set to +Inf (capture probability=1)
##D # to indicate that no turtle is nesting in the period out of 
##D # monitoring time
##D # p is set to -Inf (capture probability=0) to indicate that no
##D # monitoring has been done but some turtles could have been present.
##D fixed.parameters <- c(p=+Inf)
##D # The fitted values are:
##D par <- c(mu = 2.4911638591178051, 
##D          sd = 0.96855483039640977, 
##D          mu_season = 13.836059118657793, 
##D          sd_season = 0.17440085345943984, 
##D          p.10 = 1.3348233607728222, 
##D          p.11 = 1.1960387774393837, 
##D          p.12 = 0.63025680979544774, 
##D          p.13 = 0.38648155002707452, 
##D          p.14 = 0.31547864054366048, 
##D          p.15 = 0.19720001827017075, 
##D          p.16 = 0.083199496372073328, 
##D          p.17 = 0.32969130595897905, 
##D          p.18 = 0.36582777525265819, 
##D          p.19 = 0.30301248314170637, 
##D          p.20 = 0.69993987591518514, 
##D          p.21 = 0.13642423871641118, 
##D          p.22 = -1.3949268190534629)
##D 
##D o_mu1p1season1 <- fitCF(x=par, data=ECFOCF_2002, 
##D                         fixed.parameters=fixed.parameters)
##D 
##D # Same model but with two different models of capture probabilities
##D                         
##D fp <- rep(0, dim(ECFOCF_2002)[3])
##D names(fp) <- paste0("p1.", formatC(1:(dim(ECFOCF_2002)[3]), width=2, flag="0"))
##D par <- c(mu = 2.6404831115214353, 
##D         sd = 0.69362774786433479, 
##D         mu_season = 12.6404831115214353, 
##D         sd_season = 1.69362774786433479)
##D par <- c(par, fp[attributes(ECFOCF_2002)$table["begin"]:
##D                  attributes(ECFOCF_2002)$table["end"]])
##D names(fp) <- paste0("p2.", formatC(1:(dim(ECFOCF_2002)[3]), width=2, flag="0"))
##D par <- c(par, fp[attributes(ECFOCF_2002)$table["begin"]:
##D                  attributes(ECFOCF_2002)$table["end"]])
##D fixed.parameters <- c(p1=+Inf, p2=+Inf)
##D 
##D o_mu1p2season1 <- fitCF(x=par, data=ECFOCF_2002, 
##D                         fixed.parameters=fixed.parameters)
##D 
##D # Here the two different capture probabilities are different 
##D # by a constant:
##D # p1=invlogit(-p)     [Note that invlogit(-a1) = 1]
##D # p2=invlogit(-p)*invlogit(-a2)
##D 
##D fp <- rep(0, dim(ECFOCF_2002)[3])
##D names(fp) <- paste0("p.", formatC(1:(dim(ECFOCF_2002)[3]), width=2, flag="0"))
##D par <- c(mu = 2.6404831115214353, 
##D         sd = 0.69362774786433479, 
##D         mu_season = 12.6404831115214353, 
##D         sd_season = 1.69362774786433479, 
##D         a2=0)
##D par <- c(par, fp[attributes(ECFOCF_2002)$table["begin"]:
##D                  attributes(ECFOCF_2002)$table["end"]])
##D fixed.parameters <- c(a1=+Inf, p=+Inf)
##D 
##D o_mu1p1aseason1 <- fitCF(x=par, data=ECFOCF_2002, 
##D                         fixed.parameters=fixed.parameters)
##D                         data=ECFOCF_2002)
##D  
## End(Not run)



