## ----code options, echo = FALSE----------------------------------------------------
options(width = 85)

## ----source package, eval=FALSE----------------------------------------------------
#  install.packages("WeMix")

## ----load package, results="hide", message=FALSE,eval=FALSE------------------------
#  library(WeMix)

## ----wemix, eval=FALSE-------------------------------------------------------------
#  # model with one random effect
#  mix(pv1math ~ st29q03 + sc14q02 +st04q01+escs+ (1|schoolid), data=data,
#      weights=c("pwt1", "pwt2"), nQuad=27, verbose=FALSE, fast=TRUE,run=TRUE)
#  
#  # model with two random effects assuming zero correlation between the two
#  mix(pv1math ~ st29q03 + sc14q02 +st04q01+escs+ (1|schoolid)+ (0+escs|schoolid), data=data,
#      weights=c("pwt1", "pwt2"), nQuad=13, verbose=FALSE, fast=TRUE,run=TRUE)

## ----eval=FALSE--------------------------------------------------------------------
#  library(lme4)
#  library(WeMix)
#  ss1 <- sleepstudy
#  doubles <- c(308, 309, 310) # subject with double obs
#  
#  # Create weights
#  ss1$W1 <- ifelse(ss1$Subject %in% doubles, 2, 1)
#  ss1$W2 <- 1
#  
#  # Create binary outcome variable called "over300"
#  ss1$over300 <- ifelse(sleepstudy$Reaction<300,0,1)
#  
#  # Run mixed model with random intercept and fixed slope
#  bi_1 <- mix(over300~ Days + (1|Subject),data=ss1,
#              family=binomial(link="logit"),verbose=FALSE,
#              weights=c("W1", "W2"),nQuad=13)
#  

## ----Centering, eval=FALSE---------------------------------------------------------
#  library(lme4)  #to use example sleep study data
#  
#  #create dummy weights
#  sleepstudy$weight1L1 <- 1
#  sleepstudy$weight1L2 <- 1
#  
#  # Group mean centering of the variable Days within group Subject
#  group_center <- mix(Reaction ~ Days + (1|Subject), data=sleepstudy,
#                      center_group=list("Subject"= ~Days),
#                      weights=c("weight1L1", "weight1L2"), nQuad=13,
#                      verbose=FALSE, fast=TRUE,run=TRUE)
#  
#  # Grand mean centering of the variable Days
#  grand_center <- mix(Reaction ~ Days + (1|Subject), data=sleepstudy,
#                      center_grand=~Days,weights=c("weight1L1", "weight1L2"),
#                      nQuad=13, verbose=FALSE, fast=TRUE,run=TRUE)

## ----Stata, eval=FALSE-------------------------------------------------------------
#  import delimited "PISA2012_USA.csv"
#  
#  generate intercept = 1
#  eq intercept: intercept
#  eq slope: escs
#  tabulate st29q03, generate (st29q03d)
#  tabulate sc14q02, generate (sc14q02d)
#  tabulate st04q01, generate (st04q01d)
#  
#  //Random intercept model
#  gllamm pv1math st29q03d1 st29q03d2 st29q03d4 sc14q02d1 sc14q02d3 sc14q02d4 st04q01d2
#  escs, i(schoolid) pweight(pwt) l(identity) f(gau) nip(27) nrf(1) eqs(intercept)
#  adapt nocorrel
#  
#  
#  //Random slope and intercept model
#  gllamm pv1math st29q03d1 st29q03d2 st29q03d4 sc14q02d1 sc14q02d3 sc14q02d4 st04q01d2
#  escs, i(schoolid) pweight(pwt) l(identity) f(gau) nip(13) nrf(2) eqs(intercept slope)
#  adapt nocorrel

## ----Statamixed, eval=FALSE--------------------------------------------------------
#  import delimited "PISA2012_USA.csv"
#  tabulate st29q03, generate (st29q03d)
#  tabulate sc14q02, generate (sc14q02d)
#  tabulate st04q01, generate (st04q01d)
#  
#  //Random intercept model
#  mixed pv1math st29q03d1 st29q03d2 st29q03d4 sc14q02d1 sc14q02d3 sc14q02d4 st04q01d2
#  escs [pw = pwt1] || schoolid: , pweight (pwt2)
#  
#  //Random slope and intercept model
#  mixed pv1math st29q03d1 st29q03d2 st29q03d4 sc14q02d1 sc14q02d3 sc14q02d4 st04
#  q01d2 escs [pw = pwt1] || schoolid: escs, pweight (pwt2)

## ----sas, eval=FALSE---------------------------------------------------------------
#  proc import datafile="PISA2012_USA.csv"
#       out=pisa_data
#       dbms=csv
#       replace;
#  run;
#  
#  proc glimmix data=pisa_data method=quadrature(qpoints=27) empirical=classical NOREML;
#    nloptions GCONV=1E-10 technique=TRUREG;
#      class  sc14q02(ref='Not at all') st04q01(ref='Female') st29q03(ref='Strongly agree');
#      model pv1math = escs sc14q02 st04q01 st29q03/  obsweight=pwt1 solution;
#      random INT/subject=schoolid weight=pwt2;
#  run;
#  
#  
#  proc glimmix data=pisa_data method=quadrature(qpoints=13) empirical=classical NOREML;
#    nloptions GCONV=1E-10 technique=TRUREG;
#    class  sc14q02(ref='Not at all') st04q01(ref='Female') st29q03(ref='Strongly agree');
#    model pv1math = escs sc14q02 st04q01 st29q03/ obsweight=pwt1 solution;
#    random intercept escs/subject=schoolid   weight=pwt2;
#  run;
#  
#  
#  

## ----data_prep, eval=FALSE---------------------------------------------------------
#  library(EdSurvey)
#  
#  #read in data
#  cntl <- readPISA([path], countries = "USA")
#  om <- getAttributes(cntl, "omittedLevels")
#  data <- getData(cntl, c("schoolid","pv1math","st29q03","sc14q02","st04q01","escs","w_fschwt","w_fstuwt"), omittedLevels = FALSE, addAttributes = FALSE)
#  
#  #prepare weights
#  data$sqw <- data$w_fstuwt^2
#  sumsqw <- aggregate(sqw ~ schoolid, data = data, sum)
#  sumw <- aggregate(w_fstuwt ~ schoolid, data = data, sum)
#  data$sumsqw <- sapply(data$schoolid, function(s) sumsqw$sqw[sumsqw$schoolid == s])
#  data$sumw <- sapply(data$schoolid, function(s) sumw$w_fstuwt[sumw$schoolid == s])
#  data$pwt1 <- data$w_fstuwt * (data$sumw / data$sumsqw)
#  data$pwt2 <- data$w_fschwt
#  
#  # Remove NA and omitted Levels
#  om <- c("Invalid","N/A","Missing","Miss",NA,"(Missing)")
#  for (i in 1:ncol(tempData)) {
#    tempData <- tempData[!tempData[,i] %in% om,]
#  }
#  
#  #relevel factors for model
#  data$st29q03 <- relevel(data$st29q03,ref="Strongly agree")
#  data$sc14q02 <- relevel(data$sc14q02,ref="Not at all")
#  

