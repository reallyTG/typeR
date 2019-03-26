## ----load,message=FALSE--------------------------------------------------
library(dejaVu)

## ----seed----------------------------------------------------------------
set.seed(1298711)

## ----complete------------------------------------------------------------
complete <- SimulateComplete(study.time=365, 
                      number.subjects=50, 
                      event.rates=c(0.01,0.005),
                      dispersions=0.25) 
print(complete)
summary(complete)

## ------------------------------------------------------------------------
head(complete$data)

#The event times for subject with Id 1
complete$event.times[[1]]


## ----CRdrop--------------------------------------------------------------
ConstantRateDrop(rate=0.0025,var=1)

## ----drop----------------------------------------------------------------
with.MCAR.dropout <- SimulateDropout(complete,
                    drop.mechanism=ConstantRateDrop(rate=0.0025,
                                                    var=1)) #var by default=0


## ----dropsummary---------------------------------------------------------
summary(with.MCAR.dropout)

head(with.MCAR.dropout$data)

## ----fit-----------------------------------------------------------------
my.fit <- Simfit(with.MCAR.dropout,
                 equal.dispersion=TRUE)

## ------------------------------------------------------------------------
class(my.fit)

summary(my.fit)

#Can access the individual elements of the summary object
x <- summary(my.fit)
x$pval

## ----ip------------------------------------------------------------------

#First get values direct from model fit
gamma_and_mu <- my.fit$genCoeff.function(use.uncertainty=FALSE)
gamma_and_mu$gamma
head(gamma_and_mu$mu, 5)


#Now sample uncertainty in coefficients
#each imputation will call this function
#itself and so generate its own coefficients
#for the imputation
head(my.fit$genCoeff.function(use.uncertainty=TRUE)$mu,5)


## ----imp-----------------------------------------------------------------
imputed.data.sets <- Impute(fit = my.fit,
                            impute.mechanism = weighted_j2r(trt.weight=0),
                            N=10)

#output the number of subject dropouts in each arm 
imputed.data.sets$dropout

## ------------------------------------------------------------------------
sixth.data.set <- GetImputedDataSet(imputed.data.sets,index=6)

summary(sixth.data.set)

head(sixth.data.set$data)

## ------------------------------------------------------------------------
sixth.fit <- Simfit(sixth.data.set,
                    family="poisson") 
                  
summary(sixth.fit)

## ------------------------------------------------------------------------
fitted <- Simfit(imputed.data.sets,
                 family="negbin") #negbin is the default

## ------------------------------------------------------------------------
head(as.data.frame(fitted))

## ------------------------------------------------------------------------
summary(fitted)

## ----scenario------------------------------------------------------------
example.scenario <- function(){ 

  #simulate a complete data set
  sim <- SimulateComplete(study.time=365,number.subjects=125,
                       event.rates=c(0.01,0.005),dispersions=0.25)

  #take the simulated data set and apply an MCAR dropout mechanism...                         
  sim.with.MCAR.dropout <- SimulateDropout(sim,
                    drop.mechanism=ConstantRateDrop(rate=0.0025)) 

  #fit a Negative Binomial model 
  with.MCAR.fit <- Simfit(sim.with.MCAR.dropout,equal.dispersion=TRUE)

  #we can impute a set of 10 sets following the j2r mechanism using the fit
  impute.data.sets <- Impute(with.MCAR.fit,impute.mechanism = weighted_j2r(trt.weight=0),N=10)

  #we can then fit models to the entire imputed data set
  fit.imputed.set <- Simfit(impute.data.sets)

  #output the summary values
  return(list(MI=summary(fit.imputed.set), #for MI
              dropout=summary(with.MCAR.fit), #for dropout
              complete=summary(Simfit(sim)))) #for complete data set
}

## ----rep-----------------------------------------------------------------
answer <- replicate(500,example.scenario(),simplify = FALSE)

## ----extract-------------------------------------------------------------

#answer contains a list of lists each containing 3 SimFit objects
names(answer[[1]])
answer[[1]]$MI
names(answer[[2]])
length(answer)

#we can create a list with only the MI results
MI.fits <- lapply(answer,"[[","MI")

#the 2nd MI fit
MI.fits[[2]]

#and create the scenario
MI.answer <- CreateScenario(MI.fits,description="the description of the scenario")


#The extract_results function can be used to both extract the list and
#create the scenario in one go
MI.answer <- extract_results(answer,name="MI",
                            description="Using j2r multiple imputation")
dropout.answer <- extract_results(answer,name="dropout",
                            description="Using no imputation")
complete.answer <- extract_results(answer,name="complete",
                            description="Using complete data sets")


class(MI.answer)

## ----scenario.df---------------------------------------------------------
head(as.data.frame(MI.answer))

summary(dropout.answer)

summary(complete.answer)

#and can access individual elements
x <- summary(MI.answer,use.adjusted.pval=TRUE,alpha=0.025)

#power is calculated as the proportion of replicas which have
#pvalue < alpha
x$power

## ----linear--------------------------------------------------------------
drop.mec <- LinearRateChangeDrop(starting.rate=0.0025, #C in text above
                                 rate.change=0.0005, #D in text above
                                 var=1) #sigma^2 in text above by default var=0

drop.mec

with.MAR.dropout <- SimulateDropout(complete,
                    drop.mechanism=drop.mec)



## ----moreimp-------------------------------------------------------------
  weighted_j2r(trt.weight=1,delta=c(1,1.4))

## ------------------------------------------------------------------------
covar.df <- data.frame(Id=1:100,
                       arm=c(rep(0,50),rep(1,50)),
                       pre.exa=rbinom(n=100,size=15,prob=0.4),
                       steroid=rbinom(n=100,size=1,prob=0.2))


## ------------------------------------------------------------------------
covar.df$rate <- 0.001 + 0.002*covar.df$pre.exa + 
                 0.005*(1-covar.df$steroid) + 0.008*(1-covar.df$arm) 

head(covar.df)  

## ------------------------------------------------------------------------
complete.covar <- SimulateComplete(study.time=365,
                      dispersion=0.25,
                      dejaData = MakeDejaData(covar.df,arm="arm",
                                              Id="Id",rate="rate"))

head(complete.covar$data)


## ----newdropout----------------------------------------------------------

#we create a function which returns the new dropout mechanism
steroidMCAR <- function(steroid.rate, non.steroid.rate,var=0){ 
  
  #First we create a function which must take in two arguments,
  #event.times - a list of a single subject's event times
  #data - a row of the data frame containing the subject details
  #and outputs the time of subject dropout 
  GetDropTime <- function(event.times,data){
    rate <- if(data$steroid==1) steroid.rate else non.steroid.rate  
    rate <- rate*exp(rnorm(1,mean = 0,sd = sqrt(var)))
    dropout.time <- rexp(1,rate)
    return(min(dropout.time, data$censored.time))
  }
  
  #we create a vector of the columns from the data frame that
  #are used in the GetDropTime function
  cols.needed <- c("censored.time","steroid")
  
  #we call the CreateNewDropoutMechanism function
  #with the following arguments
  CreateNewDropoutMechanism(type="MNAR", 
                            text="Rate dependent on steroid use", #the text to be output
                            cols.needed=cols.needed, #see above
                            GetDropTime=GetDropTime, #see above
                            parameters=list(steroid.rate=steroid.rate,
                                            non.steroid.rate=non.steroid.rate,
                                            var=var) #The parameters to be output
                            )

}

## ------------------------------------------------------------------------
#we can view the dropout mechanism
steroidMCAR(steroid.rate = 0.005, non.steroid.rate = 0.025)

#we can use it
dropout.covar <- SimulateDropout(complete.covar,
                    drop.mechanism=steroidMCAR(steroid.rate = 0.0025,
                                   non.steroid.rate = 0.001))

summary(dropout.covar)

## ------------------------------------------------------------------------
dropout.fit <- Simfit(dropout.covar,
                 equal.dispersion=TRUE,
                 covar=~pre.exa)

#The values of mu now depend on subject's pre.exa value
gamma_mu <- dropout.fit$genCoeff.function(use.uncertainty=TRUE)
head(gamma_mu$mu)

## ----newimp--------------------------------------------------------------

#we create a function which returns the new dropout mechanism
#arguments are parameters for probability control arm having event
my.example.impute <- function(steroid.prob,non.steroid.prob){ 
  
  
  #We need a function which takes in a SingleSimFit object
  #and returns a list with 2 elements:
  #newevent.times which contains vectors of the imputed event times for each subject
  #new.censored.times, a vector of the times the imputed data subjects dropout
  #(the code in this function has been designed for clarity as does NOT follow 
  #R best practice)
  impute <- function(fit){
    
    #how many subjects are there in the data frame?
    number.of.subjects <- numberSubjects(fit)
    
    #subject follow up time
    study.time <- fit$singleSim$study.time
    
    #After imputing data, all subjects are followed up
    #for study.time 
    new.censored.times <- rep(study.time,number.of.subjects)
    
    #The subject data
    data <- fit$singleSim$data
    
    #the imputed event times for each subject
    newevent.times <- list()
    
    #Note could access the mu, gamma taking into 
    #account uncertainty in parameter estimates for the imputation
    gamma_mu <-  fit$genCoeff.function(use.uncertainty=TRUE)
    #so gamma_mu$mu[i,] is (mu_c,mu_a) for subject i
    
    #for each subject create a vector of imputed event times
    #if no events are imputed then use numeric(0)
    for(id in 1:number.of.subjects){
    
      #assume by default no events are imputed
      newevent.times[[id]] <- numeric(0) 
      
      #time left on study
      time.left <- study.time - data[id,]$censored.time
      
      #if ti = 0 then subject didn't drop out so 
      #no imputed events and if in treatment group then no new events
      if(data[id,]$arm==1 || time.left==0) next;
        
      #get the probability of an event 
      prob <- if(data[id,]$steroid==1)steroid.prob else non.steroid.prob 
      
      #did subject have an event?
      if(rbinom(n=1,size = 1,prob=prob)!= 0){
        newevent.times[[id]] <- data[id,]$censored.time + 0.5*time.left
      }
    }
    
    #return the appropriate list
    return(list(new.censored.times=new.censored.times,
                newevent.times=newevent.times))
    
  }
  
  #we create a vector of the columns from the data frame that
  #are used in the impute function
  cols.needed <- c("censored.time","arm","steroid")
  
  CreateNewImputeMechanism(name="my new impute mechanism", #name for outputting
                    cols.needed=cols.needed, #see above
                    impute=impute, #see above
                    parameters=list(steroid.prob=steroid.prob,
                                    non.steroid.prob=non.steroid.prob)) #extra parameters
}

#we can view the impute mechanism
my.example.impute(steroid.prob=0.5,non.steroid.prob = 0.9)

## ------------------------------------------------------------------------
imputed.covar <- Impute(fit = dropout.fit,
                  impute.mechanism = my.example.impute(steroid.prob=0.5,
                                       non.steroid.prob = 0.9),
                  N=10)

fitted.covar <- Simfit(imputed.covar,
                 family="negbin",
                 covar=~pre.exa)

summary(fitted.covar)

