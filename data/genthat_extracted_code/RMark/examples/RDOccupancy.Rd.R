library(RMark)


### Name: RDOccupancy
### Title: Robust Design occupancy example data
### Aliases: RDOccupancy
### Keywords: datasets

### ** Examples


## No test: 
# This example is excluded from testing to reduce package check time
data(RDOccupancy)
#
# Example of epsilon=1-gamma
test_proc=process.data(RDOccupancy,model="RDOccupEG",time.intervals=c(0,0,1,0,0,1,0,0))
test_ddl=make.design.data(test_proc)
test_ddl$Epsilon$eps=-1
test_ddl$Gamma$eps=1
p.dot=list(formula=~1)
Epsilon.random.shared=list(formula=~-1+eps, share=TRUE)
model=mark(test_proc,test_ddl,model.parameters=list(Epsilon=Epsilon.random.shared, p=p.dot))
#
# A self-contained function for evaluating a set of user-defined candidate models
run.RDExample=function()
{
# Creating list of potential predictor variables for Psi

Psi.area=list(formula=~samplearea)
Psi.cover=list(formula=~cover)
Psi.areabycover=list(formula=~samplearea*cover)
Psi.dot=list(formula=~1)
Psi.time=list(formula=~time)

# Creating list of potential predictor variables for p
# When coding formula with session-dependent (primary or secondary)
# covariates, you do NOT have to include the session identifiers (
# the ps of occps) in the model formula. You only need to specify ~occ.
# The variable suffix can be primary occasion numbers or
# primary and secondary occasion numbers.

p.dot=list(formula=~1)
p.occ=list(formula=~occ)
p.area=list(formula=~sample.area)
p.coverbyocc=list(formula=~occ*cover)

# Creating list of potential predictor variables for Gamma
# and/or Epsilon (depending on which RDOccupXX Parameterization is used)

gam.area=list(formula=~samplearea)
epsilon.area=list(formula=~samplearea)
gam.dot=list(formula=~1)
epsilon.dot=list(formula=~1)

# setting time intervals for 3 primary sessions with
# secondary session length of 3,3,3

time_intervals=c(0,0,1,0,0,1,0,0)

# Initial data processing for RMARK RDOccupPG
# (see RMARK appendix C-3 for list of RDOccupXX model paramterizations)

RD_process=process.data(RDOccupancy, model="RDOccupPG",
time.intervals=time_intervals)
RD_ddl=make.design.data(RD_process)
# Candidate model list
# 1. Occupancy, detection, and colonization are constant

model.p.dot.Psi.dot.gam.dot<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.dot, Psi=Psi.dot, Gamma=gam.dot),
invisible=TRUE)

# 2. Occupancy varies by time, detection is constant,
# colonization is constant

model.p.dot.Psi.time.gam.dot<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.dot, Psi=Psi.time, Gamma=gam.dot),
invisible=TRUE)

# 3. Occupancy varies by area, detection is constant,
# colonization varies by area

model.p.dot.Psi.area.gam.area<-mark(RD_process,
RD_ddl, model.parameters=list(p=p.dot, Psi=Psi.area,
Gamma=gam.area), invisible=TRUE)

# 4. Occupancy varies by cover, detection is constant,
# colonization varies by area

model.p.dot.Psi.cover.gam.area<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.dot, Psi=Psi.cover, Gamma=gam.area),
invisible=TRUE)

# 5. Occupancy is constant, detection is session dependent,
# colonization is constant

model.p.occ.Psi.dot.gam.dot<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.occ, Psi=Psi.dot, Gamma=gam.dot),
invisible=TRUE)

# 6. Occupancy varied by area, detection is session
# dependent, colonization is constant
model.p.occ.Psi.area.gam.dot<-mark(RD_process, RD_ddl,
model.parameters=list(p=p.occ, Psi=Psi.area, Gamma=gam.dot),
invisible=TRUE)
#
# Return model table and list of models
#
return(collect.models())
}
# This runs the 6 models above-Note that if you use
# invisible=FALSE in the above model calls
# then the mark.exe prompt screen will show as each model is run.

robustexample<-run.RDExample() #This runs the 6 models above

# Outputting model selection results
robustexample 	# This will print selection results
options(width=150)	# Sets page width to 100 characters
sink("results.table.txt") # Captures screen output to file

# Remove comment to see output
#print(robustexample) # Sends output to file
sink() # Returns output to screen
#
# Allows you to view results in notepad;remove # to see output
# system("notepad results.table.txt", invisible=FALSE, wait=FALSE)

# Examine the output for Model 1: Psi(.), p(.), Gamma(.)
# Opens MARK results file in text editor
#robustexample$model.p.dot.Psi.dot.gam.dot

# View beta estimates for specified model in R
robustexample$model.p.dot.Psi.dot.gam.dot$results$beta

# View real estimates for specified model in R
robustexample$model.p.dot.Psi.dot.gam.dot$results$real

# Examine the best fitting model which has a time-dependent
# effect on detection
# (Model 5: Psi(.), p(occ), Gamma(.))

# View beta estimates for specified model in R
robustexample$model.p.occ.Psi.dot.gam.dot$results$beta

# View real estimates for specified model in R
robustexample$model.p.occ.Psi.dot.gam.dot$results$real

# View estimated variance/covariance matrix in R
robustexample$model.p.occ.Psi.dot.gam.dot$results$beta.vcv


# View model averages estimates for session-dependent
# detection probabilities
model.average(robustexample, "p", vcv=TRUE)

# View model averaged estimate for Psi (Occupancy)
model.average(robustexample, "Psi", vcv=TRUE)

# View model averaged estimate for Gamma (Colonization)
model.average(robustexample, "Gamma", vcv=TRUE)

#
# Compute real estimates across the range of covariates
# for a specific model parameter using Model 6
#
# Identify indices we are interested in predicting
# see covariate.predictions for information on
# index relationship to real parameters

summary.mark(robustexample$model.p.occ.Psi.area.gam.dot, se=TRUE)
# Define data frame of covariates to be used for analysis

ha<-sort(RDOccupancy$samplearea)

# Predict parameter of interest (Psi) across the
# range of covariate data of interest

Psi.by.Area<-covariate.predictions(robustexample,
data=data.frame(samplearea=ha), indices=c(1))

# View dataframe of real parameter estimates without var-cov
# matrix printing (use str(Psi.by.Area) to evaluate structure))

Psi.by.Area[1]

#Create a simple plot using plot() and lines()

plot(Psi.by.Area$estimates$covdata, Psi.by.Area$estimates$estimate,
type="l", xlab="Patch Area", ylab="Occupancy", ylim=c(0,1))
lines(Psi.by.Area$estimates$covdata, Psi.by.Area$estimates$lcl, lty=2)
lines(Psi.by.Area$estimates$covdata, Psi.by.Area$estimates$ucl, lty=2)

# For porting graphics directly to file, see pdf() or png(),

## End(No test) 



