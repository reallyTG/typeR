library(mvmeta)


### Name: mvmeta
### Title: Fitting Multivariate and Univariate Meta-Analysis and
###   Meta-Regression Models
### Aliases: mvmeta mvmeta.fit
### Keywords: models regression multivariate

### ** Examples

### BIVARIATE META-ANALYSIS, ESTIMATED THROUGH REML

# RUN THE MODEL
model <- mvmeta(cbind(PD,AL),S=berkey98[5:7],data=berkey98)

# SUMMARIZE THE RESULTS
summary(model)

# RESIDUALS AND FITTED VALUES
residuals(model)
fitted(model)

# LOG-LIKELIHOOD AND AIC VALUE
logLik(model)
AIC(model)


### BIVARIATE META-REGRESSION, ESTIMATED THROUGH METHOD OF MOMENTS

# RUN THE MODEL AND SUMMARIZE THE RESULTS
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98,method="mm")
summary(model)

# BLUP ESTIMATES AND 90% PREDICTION INTERVALS, AGGREGATED BY OUTCOME
blup(model,pi=TRUE,aggregate="y",pi.level=0.90)

# COCHRAN Q TEST FOR RESIDUAL HETEROGENEITY
qtest(model)

# PREDICTED AVERAGED OUTOCOMES AND STANDARD ERRORS FROM YEAR 1985 TO 1989
newdata <- data.frame(pubyear=1985:1989)
predict(model,newdata,se=TRUE)

# MODEL FRAME AND MODEL MATRIX
model.frame(model)
model.matrix(model)


### UNIVARIATE META-REGRESSION, FIXED-EFFECTS MODEL

# RUN THE MODEL
model <- mvmeta(sbp~ish,S=sbp_se^2,data=hyp,method="fixed")
summary(model)

# RESIDUALS AND FITTED VALUES
residuals(model)
fitted(model)

# COCHRAN Q TEST FOR RESIDUAL HETEROGENEITY
qtest(model)


### MULTIVARIATE META-ANALYSIS WITH MORE THAN 2 OUTCOMES

# RUN THE MODEL
y <- as.matrix(fibrinogen[2:5])
S <- as.matrix(fibrinogen[6:15])
model <- mvmeta(y,S)
summary(model)


### IN THE PRESENCE OF MISSING VALUES

# RUN THE MODEL
y <- as.matrix(smoking[11:13])
S <- as.matrix(smoking[14:19])
model <- mvmeta(y,S)
summary(model)

# MODEL FRAME: SEE help(na.omit.data.frame.mvmeta) FOR MORE EXAMPLES
model.frame(model)


### WHEN WITHIN-STUDY COVIARIANCES ARE NOT AVAILABLE AND/OR NEED TO BE INPUTTED

# GENERATE S
(S <- inputcov(hyp[c("sbp_se","dbp_se")],cor=hyp$rho))

# RUN THE MODEL
model <- mvmeta(cbind(sbp,dbp),S=S,data=hyp)

# INPUTTING THE CORRELATION DIRECTLY IN THE MODEL
model <- mvmeta(cbind(y1,y2),cbind(V1,V2),data=p53,control=list(Scor=0.95))
summary(model)

# SEE help(hyp) AND help(p53) FOR MORE EXAMPLES


### STRUCTURING THE BETWEEN-STUDY (CO)VARIANCE

# DIAGONAL
S <- as.matrix(hsls[5:10])
model <- mvmeta(cbind(b1,b2,b3),S,data=hsls,bscov="diag")
summary(model)
model$Psi

# COMPOUND SYMMETRY
model <- mvmeta(cbind(b1,b2,b3),S,data=hsls,bscov="cs")
summary(model)
model$Psi

# SEE help(mvmetaCovStruct) FOR DETAILS AND ADDITIONAL EXAMPLES


### USE OF THE CONTROL LIST

# PRINT THE ITERATIONS AND CHANGE THE DEFAULT FOR STARTING VALUES
y <- as.matrix(smoking[11:13])
S <- as.matrix(smoking[14:19])
model <- mvmeta(y,S,control=list(showiter=TRUE,igls.iter=20))

# SEE help(mvmeta.control) FOR FURTHER DETAILS



