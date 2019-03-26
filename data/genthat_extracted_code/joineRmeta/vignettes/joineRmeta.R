## ----set-options, echo=FALSE, cache=FALSE---------------------------------------------------------
options(width = 100)

## -------------------------------------------------------------------------------------------------
library("joineRmeta")


## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("simjointmeta", package = "joineRmeta")

## -------------------------------------------------------------------------------------------------
exampledat1 <- simjointmeta(k = 5, n = rep(500, 5), sepassoc = FALSE, 
                            ntms = 5,longmeasuretimes = c(0, 1, 2, 3, 4), 
                            beta1 = c(1, 2, 3), beta2 = 1,
                            rand_ind = "intslope", rand_stud = NULL, 
                            gamma_ind = 1, 
                            sigb_ind = matrix(c(1, 0.5, 0.5, 1.5),nrow = 2), 
                            vare = 0.01, theta0 = -3, theta1 = 1, 
                            censoring = TRUE, censlam = exp(-3), 
                            truncation = FALSE,
                            trunctime = max(longmeasuretimes))


## ---- eval=FALSE----------------------------------------------------------------------------------
#  exampledat1$percentevent

## -------------------------------------------------------------------------------------------------
str(exampledat1$longitudinal)


## -------------------------------------------------------------------------------------------------
str(exampledat1$survival)


## -------------------------------------------------------------------------------------------------
exampledat2 <- simjointmeta(k = 5, n = rep(500, 5), sepassoc = TRUE, ntms = 5, 
                          longmeasuretimes = c(0, 1, 2, 3, 4), beta1 = c(1, 2, 3), 
                          beta2 = 1, rand_ind = "intslope", rand_stud = "inttreat", 
                          gamma_ind = c(0.5, 1), gamma_stud = c(0.5, 1), 
                          sigb_ind = matrix(c(1, 0.5, 0.5, 1.5), nrow = 2), 
                          sigb_stud = matrix(c(1, 0.5, 0.5, 1.5), nrow = 2), 
                          vare = 0.01, theta0 = -3, theta1 = 1, censoring = TRUE, 
                          censlam = exp(-3), truncation = FALSE, 
                          trunctime = max(longmeasuretimes))

## -------------------------------------------------------------------------------------------------
gamma_ind_set <- list(c(0.5, 1), c(0.4, 0.9), c(0.6, 1.1), c(0.5, 0.9), c(0.4, 1.1))
gamma_stud_set <- list(c(0.6, 1.1), c(0.5, 1), c(0.5, 0.9), c(0.4, 1.1), c(0.4, 0.9))
censlamset <- c(exp(-3), exp(-2.9), exp(-3.1), exp(-3), exp(-3.05))
theta0set <- c(-3, -2.9, -3, -2.9, -3.1)
theta1set <- c(1, 0.9, 1.1, 1, 0.9)

exampledat2 <- simjointmeta(k = 5, n = rep(500, 5), sepassoc = TRUE, ntms = 5, 
                            longmeasuretimes = c(0, 1, 2, 3, 4), beta1 = c(1, 2, 3), 
                            beta2 = 1, rand_ind = "intslope", rand_stud = "inttreat", 
                            gamma_ind = gamma_ind_set, gamma_stud = gamma_stud_set, 
                            sigb_ind = matrix(c(1, 0.5, 0.5, 1.5), nrow = 2),
                            sigb_stud = matrix(c(1, 0.5, 0.5, 1.5), nrow = 2), 
                            vare = 0.01, theta0 = theta0set, theta1 = theta1set, 
                            censoring = TRUE, censlam = censlamset, truncation = FALSE,
                            trunctime = max(longmeasuretimes))

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("simdat2", package = "joineRmeta")
#  help("simdat3", package = "joineRmeta")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  data("simdat2")
#  str(simdat2)

## -------------------------------------------------------------------------------------------------
jointdat<-tojointdata(longitudinal = simdat2$longitudinal, 
  survival = simdat2$survival, id = "id", longoutcome = "Y", 
  timevarying = c("time","ltime"), survtime = "survtime", cens = "cens",
  time = "time")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("tojointdata", package = "joineRmeta")

## -------------------------------------------------------------------------------------------------
str(jointdat)

## -------------------------------------------------------------------------------------------------
jointdat$baseline$study <- as.factor(jointdat$baseline$study)
jointdat$baseline$treat <- as.factor(jointdat$baseline$treat)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("removeafter", package = "joineRmeta")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  str(simdat3)

## -------------------------------------------------------------------------------------------------
jointdat3<-tojointdata(longitudinal = simdat3$longitudinal, 
  survival = simdat3$survival, id = "id", longoutcome = "Y", 
  timevarying = c("time","ltime"), survtime = "survtime", cens = "cens",
  time = "time")
  

## ---- results = "hide"----------------------------------------------------------------------------
jointdat3.1<-removeafter(data = jointdat3, longitudinal = "Y", 
                         survival = "survtime", id = "id", time = "time")

## -------------------------------------------------------------------------------------------------
str(jointdat3)
str(jointdat3.1)


## -------------------------------------------------------------------------------------------------
sepplots <- jointmetaplot(dataset = jointdat, study = "study", longoutcome = "Y", 
                          longtime = "time", survtime = "survtime", cens = "cens", 
                          id = "id", smoother = TRUE, 
                          studynames = c("Study 1", "Study 2", "Study 3"), type = "Both")

## ---- fig.show='hold', fig.keep='high'------------------------------------------------------------
sepplots$longplots$`studyplot.Study 3`
sepplots$eventplots[[1]]

## -------------------------------------------------------------------------------------------------
sepplots2 <- jointmetaplot(dataset = jointdat, study = "study", longoutcome = "Y", 
                           longtime = "time", survtime = "survtime", cens = "cens", 
                           id = "id", smoother = TRUE, 
                           studynames = c("Study 1", "Study 2", "Study 3"), 
                           type = "Both", eventby = "treat")

sepplots3 <- jointmetaplot(dataset = jointdat, study = "study", longoutcome = "Y", 
                           longtime = "time", survtime = "survtime", cens = "cens", 
                           id = "id", smoother = TRUE, 
                           studynames = c("Study 1", "Study 2", "Study 3"), 
                           type = "Event", eventconfint =  TRUE)

sepplots2$eventplots$`studyplot.Study 3`
sepplots3$eventplots[[2]]


## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("jointmetaplot", package = "joineRmeta")

## ---- fig.show='hide'-----------------------------------------------------------------------------
allplot2 <- suppressWarnings(jointmetaplotall(plotlist = sepplots2, ncol = 2, 
                                              top = "All studies",
                                              type = "Both"))

## ---- eval=FALSE----------------------------------------------------------------------------------
#  allplot2$longall
#  allplot2$eventsall

## ---- fig.height=10, fig.width=5------------------------------------------------------------------
allplot2$longall
allplot2$eventsall

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("jointmetaplotall", package = "joineRmeta")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("joineRfits", package = "joineRmeta")

## -------------------------------------------------------------------------------------------------
joineRmodels <- joineRfits[c("joineRfit1", "joineRfit2", "joineRfit3")]
joineRmodelsSE <- joineRfits[c("joineRfit1SE", "joineRfit2SE", "joineRfit3SE")]

## -------------------------------------------------------------------------------------------------
summary(joineRmodels[[1]])


## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("joineRfits2", package = "joineRmeta")

## -------------------------------------------------------------------------------------------------
joineRmodels2 <- joineRfits2[c("joineRfit6", "joineRfit7", "joineRfit8", 
                               "joineRfit9", "joineRfit10")]
joineRmodels2SE <- joineRfits2[c("joineRfit6SE", "joineRfit7SE", "joineRfit8SE", 
                                 "joineRfit9SE", "joineRfit10SE")]

## -------------------------------------------------------------------------------------------------
summary(joineRmodels2[[1]])


## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("JMfits", package = "joineRmeta")

## -------------------------------------------------------------------------------------------------
summary(JMfits[[1]])


## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("JMfits2", package = "joineRmeta")

## -------------------------------------------------------------------------------------------------
summary(JMfits2[[1]])


## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("jointmeta2", package = "joineRmeta")

## -------------------------------------------------------------------------------------------------
MAjoineRfits <- jointmeta2(fits = joineRmodels, SE = joineRmodelsSE, 
                           longpar = c("time", "treat1"), 
                           survpar = "treat1", assoc = TRUE, 
                           studynames = c("Study 1","Study 2", "Study 3"))

## -------------------------------------------------------------------------------------------------
names(MAjoineRfits$longMA)

## ---- fig.height=4, fig.width=9, warning = FALSE, message = FALSE---------------------------------
library(meta)
forest(MAjoineRfits$longMA$treat1)

## ---- error = TRUE--------------------------------------------------------------------------------
MAjoineRfits2 <- jointmeta2(fits = c(joineRmodels[1:3], joineRmodels2[1:2]), 
                            SE = c(joineRmodelsSE[1:3],joineRmodels2SE[1:2]), 
                            longpar = c("time", "treat1"), survpar = "treat1", 
                            assoc = TRUE, 
                            studynames = c("Study 1","Study 2", "Study 3"))

## -------------------------------------------------------------------------------------------------
MAJMfits <- jointmeta2(fits = JMfits, longpar = c("time", "treat1"), 
                       survpar = "treat1", assoc = TRUE,
                       studynames = c("Study 1","Study 2", "Study 3"))

## -------------------------------------------------------------------------------------------------
MAJMfits2 <- jointmeta2(fits = JMfits2, longpar = c("time", "treat1"), 
                        survpar = "treat1", assoc = TRUE,
                        studynames = c("Study 1","Study 2", "Study 3"))

## ---- error = TRUE--------------------------------------------------------------------------------
MAtest <- jointmeta2(fits = c(JMfits2[1:3], JMfits[1:2]), 
                     longpar = c("time", "treat1"), 
                     survpar = "treat1", assoc = TRUE, 
                     studynames = c("Study 1","Study 2", "Study 3"))

## ---- error = TRUE--------------------------------------------------------------------------------
MAtest <- jointmeta2(fits = c(JMfits2[1:3], joineRfits[1:2]), 
                     longpar = c("time", "treat1"), 
                     survpar = "treat1", assoc = TRUE, 
                     studynames = c("Study 1","Study 2", "Study 3"))

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("jointmeta1", package = "joineRmeta")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("onestage1", package = "joineRmeta")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit0 <- jointmeta1(data = jointdat,
#                             long.formula = Y ~ 1 + time + treat,
#                             long.rand.ind = c("int", "time"),
#                             sharingstrct = "randprop",
#                             surv.formula = Surv(survtime, cens) ~ treat,
#                             study.name = "study", strat = F)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit1 <- jointmeta1(data = jointdat,
#                             long.formula = Y ~ 1 + time + treat*study,
#                             long.rand.ind = c("int", "time"),
#                             sharingstrct = "randprop",
#                             surv.formula = Surv(survtime, cens) ~ treat*study,
#                             study.name = "study", strat = F)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("jointmeta1.object", package = "joineRmeta")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit1SE <- jointmetaSE(fitted = onestagefit1, n.boot = 200,
#                                overalleffects = list(long = list(c("treat1", "treat1:study2"),
#                                                                  c("treat1", "treat1:study3")),
#                                                      surv = list(c("treat1", "treat1:study2"),
#                                                                  c("treat1", "treat1:study3"))))

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("jointmeta1SE.object", package = "joineRmeta")

## -------------------------------------------------------------------------------------------------
#extract the saved model fit and bootstrap results
onestagefit1 <- onestage1$onestagefit1
onestagefit1SE <- onestage1$onestagefit1SE

## -------------------------------------------------------------------------------------------------
summary(onestagefit1)

## -------------------------------------------------------------------------------------------------
print(onestagefit1)

## -------------------------------------------------------------------------------------------------
fixef(onestagefit1, type = "Longitudinal")

## -------------------------------------------------------------------------------------------------
fixef(onestagefit1, type = "Survival")

## -------------------------------------------------------------------------------------------------
fixef(onestagefit1, type = "Latent")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  ranef(onestagefit1, type = "individual")

## -------------------------------------------------------------------------------------------------
rancov(onestagefit1, type = "individual")

## -------------------------------------------------------------------------------------------------
formula(onestagefit1, type = "Longitudinal")

## -------------------------------------------------------------------------------------------------
formula(onestagefit1, type = "Survival")

## -------------------------------------------------------------------------------------------------
formula(onestagefit1, type = "Rand_ind")

## -------------------------------------------------------------------------------------------------
print(onestagefit1SE)

## -------------------------------------------------------------------------------------------------
confint(onestagefit1SE)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  vcov(onestagefit1SE)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  help("onestage2", package = "joineRmeta")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit2 <- jointmeta1(data = jointdat,
#                             long.formula = Y ~ 1 + time + treat,
#                             long.rand.ind = c("int", "time"),
#                             long.rand.stud = c("study", "treat"),
#                             sharingstrct = "randprop",
#                             surv.formula = Surv(survtime, cens) ~ treat,
#                             study.name = "study", strat = F)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit2SE<-jointmetaSE(fitted = onestagefit2, n.boot = 200)

## -------------------------------------------------------------------------------------------------
#extract the saved model fit and bootstrap results
onestagefit2<-onestage2$onestagefit2
onestagefit2SE<-onestage2$onestagefit2SE

## ---- eval=FALSE----------------------------------------------------------------------------------
#  ranef(onestagefit2, type = "study")

## -------------------------------------------------------------------------------------------------
rancov(onestagefit2, type = "study")

## -------------------------------------------------------------------------------------------------
formula(onestagefit2, type = "Rand_stud")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit3 <- jointmeta1(data = jointdat,
#                             long.formula = Y ~ 1 + time + treat*study,
#                             long.rand.ind = c("int", "time"),
#                             sharingstrct = "randprop",
#                             surv.formula = Surv(survtime, cens) ~ treat,
#                             study.name = "study", strat = TRUE)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit3SE <- jointmetaSE(fitted = onestagefit3, n.boot = 200,
#                                overalleffects = list(long = list(c("treat1", "treat1:study2"),
#                                                                  c("treat1", "treat1:study3")))))

## -------------------------------------------------------------------------------------------------
#extract the saved model fit and bootstrap results
onestagefit3<-onestage3$onestagefit3
onestagefit3SE<-onestage3$onestagefit3SE

## -------------------------------------------------------------------------------------------------
summary(onestagefit3)

## -------------------------------------------------------------------------------------------------
rancov(fitted = onestagefit3, type = "individual")

## ---- error = TRUE--------------------------------------------------------------------------------
rancov(fitted = onestagefit3, type = "study")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit4 <- jointmeta1(data = jointdat, long.formula = Y ~ 1 + time + treat + study,
#                             long.rand.ind = c("int", "time"), long.rand.stud = c("treat"),
#                             sharingstrct = "randprop", surv.formula = Surv(survtime, cens) ~ treat,
#                             study.name = "study", strat = TRUE)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  onestagefit4SE <- jointmetaSE(fitted = onestagefit4, n.boot = 200)

## -------------------------------------------------------------------------------------------------
#extract the saved model fit and bootstrap results
onestagefit4 <- onestage4$onestagefit4
onestagefit4SE <- onestage4$onestagefit4SE

## -------------------------------------------------------------------------------------------------
summary(onestagefit4)

## -------------------------------------------------------------------------------------------------
rancov(fitted = onestagefit4, type = "individual")

## -------------------------------------------------------------------------------------------------
rancov(fitted = onestagefit4, type = "study")

## ---- eval=FALSE----------------------------------------------------------------------------------
#  ###CODE NOT RUN
#  #to extract the results from a separate longitudinal model
#  fitted$sepests$longests$modelfit
#  
#  #to extract the results from a separate survival model
#  fitted$sepests$survests$modelfit

