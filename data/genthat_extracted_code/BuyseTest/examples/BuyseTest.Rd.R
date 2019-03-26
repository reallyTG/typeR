library(BuyseTest)


### Name: BuyseTest
### Title: Generalized Pairwise Comparisons (GPC)
### Aliases: BuyseTest
### Keywords: BuyseTest function

### ** Examples

# reset the default value of the number of permuation sample
BuyseTest.options(method.inference = "none") # no permutation test

#### simulate some data ####
set.seed(10)
df.data <- simBuyseTest(1e2, n.strata = 2)

                                       # display 
if(require(prodlim)){
   resKM_tempo <- prodlim(Hist(eventtime,status)~Treatment, data = df.data)
   plot(resKM_tempo)
}

#### one time to event endpoint ####
BT <- BuyseTest(Treatment ~ TTE(eventtime, censoring = status), data= df.data)

summary(BT) # net benefit
summary(BT, percentage = FALSE)  
summary(BT, statistic = "winRatio") # win Ratio

## bootstrap to compute the CI
## Not run: 
##D     BT <- BuyseTest(Treatment ~ TTE(eventtime, censoring = status), data=df.data,
##D                     method.inference = "permutation", n.resampling = 1e3)
## End(Not run)
## Don't show: 
    BT <- BuyseTest(Treatment ~ TTE(eventtime, censoring = status), data=df.data,
                    method.inference = "permutation", n.resampling = 1e1, trace = 0)
## End(Don't show)
summary(BT, statistic = "netBenefit") ## default
summary(BT, statistic = "winRatio") 

## parallel boostrap
## Not run: 
##D     BT <- BuyseTest(Treatment ~ TTE(eventtime, censoring = status), data=df.data,
##D                     method.inference = "permutation", n.resampling = 1e3, cpus = 2)
##D     summary(BT)
## End(Not run)

## method Gehan is much faster but does not optimally handle censored observations
BT <- BuyseTest(Treatment ~ TTE(eventtime, censoring = status), data=df.data,
                method.tte = "Gehan", trace = 0)
summary(BT)

#### one time to event endpoint: only differences in survival over 1 unit ####
BT <- BuyseTest(Treatment ~ TTE(eventtime, threshold = 1, censoring = status), data=df.data)
summary(BT)

#### one time to event endpoint with a strata variable
BT <- BuyseTest(Treatment ~ strata + TTE(eventtime, censoring = status), data=df.data)
summary(BT)

#### several endpoints with a strata variable
f <- Treatment ~ strata + T(eventtime, 1, status) + B(toxicity) 
f <- update(f, 
            ~. + T(eventtime, 0.5, status) + C(score, 1) + T(eventtime, 0.25, status))

BT <- BuyseTest(f, data=df.data)
summary(BT)

#### real example : Veteran dataset of the survival package ####
#### Only one endpoint. Type = Time-to-event. Thresold = 0. Stratfication by histological subtype
#### method.tte = "Gehan"

if(require(survival)){
## Not run: 
##D   data(veteran,package="survival")
##D  
##D   ## method.tte = "Gehan"
##D   BT_Gehan <- BuyseTest(trt ~ celltype + TTE(time,threshold=0,censoring=status), 
##D                         data=veteran, method.tte="Gehan",
##D                         method.inference = "permutation", n.resampling = 1e3)
##D   
##D   summary_Gehan <- summary(BT_Gehan)
##D   summary_Gehan <- summary(BT_Gehan, statistic = "winRatio")
##D   
##D   ## method.tte = "Peron"
##D   BT_Peron <- BuyseTest(trt ~ celltype + TTE(time,threshold=0,censoring=status), 
##D                         data=veteran, method.tte="Peron",
##D                         method.inference = "permutation", n.resampling = 1e3)
##D 
##D   class(BT_Peron)
##D   summary(BT_Peron)
## End(Not run)
}



