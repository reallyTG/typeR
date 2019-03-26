library(epiR)


### Name: epi.cluster2size
### Title: Sample size under under two-stage cluster sampling
### Aliases: epi.cluster2size
### Keywords: univar univar

### ** Examples

## EXAMPLE 1 (from Levy and Lemeshow p 292):
## We intend to conduct a survey of nurse practitioners to estimate the 
## average number of patients seen by each nurse. There are five health
## centres in the study area, each with three nurses. We intend to sample
## two nurses from each health centre. We would like to be 95% confident
## that our estimate is within 30% of the true population value. We expect 
## that the mean number of patients seen at the health centre level 
## is 84 (var 567) and the mean number of patients seen at the nurse 
## level is 28 (var 160). How many health centres should be sampled?

tn <- c(5, 3); tmean <- c(84, 28); tsigma2.x <- c(567, 160)

epi.cluster2size(nbar = 2, n = tn, mean = tmean, sigma2.x = tsigma2.x, 
   sigma2.y = NA, sigma2.xy = NA, epsilon.r = 0.3, method = "mean", 
   conf.level = 0.95)

## Three health centres need to be sampled to meet the survey 
## specifications.


## EXAMPLE 2 (from Levy and Lemeshow p 294):
## Same scenario as above, but this time we want to estimate the proportion
## of patients referred to a general practitioner from each clinic. As before, 
## we want to be 95% confident that our estimate of the proportion of referred 
## patients is within 30% of the true population value. We expect that 
## approximately 36% of patients are referred.

## On page 295 Levy and Lemeshow state that the parameters sigma2.x, sigma2.y
## and sigma2.xy are rarely known in advance and must be either estimated
## or guessed from experience or intuition. In this example (for 
## demonstration) we use the actual patient data to calculate sigma2.x, 
## sigma2.y and sigma2.xy.

## Nurse-level data. The following code reproduces Table 10.4 of Levy and 
## Lemeshow (page 293).
clinic <- rep(1:5, each = 3)
nurse <- 1:15
Xij <- c(58,44,18,42,53,10,13,18,37,16,32,10,25,23,23)
Yij <- c(5,6,6,3,19,2,12,6,30,5,14,4,17,9,14)
ssudat <- data.frame(clinic, nurse, Xij, Yij)

Xbar <- by(data = ssudat$Xij, INDICES = ssudat$clinic, FUN = mean)
ssudat$Xbar <- rep(Xbar, each = 3)
Ybar <- by(data = ssudat$Yij, INDICES = ssudat$clinic, FUN = mean)
ssudat$Ybar <- rep(Ybar, each = 3)

ssudat$Xij.Xbar <- (ssudat$Xij - ssudat$Xbar)^2
ssudat$Yij.Ybar <- (ssudat$Yij - ssudat$Ybar)^2
ssudat$XY <- (ssudat$Xij - ssudat$Xbar) * (ssudat$Yij - ssudat$Ybar)

## Collapse the nurse-level data (created above) to the clinic level. 
## The following code reproduces Table 10.3 of Levy and Lemeshow (page 292). 
clinic <- as.vector(by(ssudat$clinic, INDICES = ssudat$clinic, FUN = min))
Xi <- as.vector(by(ssudat$Xij, INDICES = ssudat$clinic, FUN = sum))
Yi <- as.vector(by(ssudat$Yij, INDICES = ssudat$clinic, FUN = sum))
psudat <- data.frame(clinic, Xi, Yi)

psudat$Xi.Xbar <- (psudat$Xi - mean(psudat$Xi))^2
psudat$Yi.Ybar <- (psudat$Yi - mean(psudat$Yi))^2
psudat$XY <- (psudat$Xi - mean(psudat$Xi)) * (psudat$Yi - mean(psudat$Yi))

## Number of primary and secondary sampling units:
npsu <- nrow(psudat)
nssu <- mean(by(ssudat$nurse, INDICES = ssudat$clinic, FUN = length))
tn <- c(npsu, nssu)

## Mean of X at primary sampling unit and secondary sampling unit level:
tmean <- c(mean(psudat$Xi), mean(ssudat$Xij))

## Variance of number of patients seen:
tsigma2.x <- c(mean(psudat$Xi.Xbar), mean(ssudat$Xij.Xbar))

## Variance of number of patients referred:
tsigma2.y <- c(mean(psudat$Yi.Ybar), mean(ssudat$Yij.Ybar))
tsigma2.xy <- c(mean(psudat$XY), mean(ssudat$XY))

epi.cluster2size(nbar = 2, R = 0.36, n = tn, mean = tmean, 
   sigma2.x = tsigma2.x, sigma2.y = tsigma2.y, sigma2.xy = tsigma2.xy, 
   epsilon.r = 0.3, method = "proportion", conf.level = 0.95)

## Two health centres need to be sampled to meet the survey 
## specifications.


## EXAMPLE 3:
## We want to determine the prevalence of brucellosis in dairy cattle in a
## country comprised of 20 provinces. The number of dairy herds per province 
## ranges from 50 to 1200. Herd size ranges from 25 to 900. We suspect that
## the prevalence of brucellosis-positive herds across the entire country 
## is around 10%. We suspect that there are a small number of provinces 
## with a relatively high individual cow-level prevalence of disease 
## (thought to be between 40% and 80%). How many herds should be sampled 
## from each province if we want our estimate of prevalence to be within 
## 30% of the true population value?

epi.simplesize(N = 1200, Vsq = NA, Py = 0.10, epsilon.r = 0.30, 
   method = "proportion", conf.level = 0.95)

## A total of 234 herds should be sampled from each province.

## Next we work out the number of provinces that need to be sampled. 
## Again, we would like to be 95% confident that our estimate is within 
## 30% of the true population value. Simulate some data to derive appropriate
## estimates of sigma2.x, sigma2.y and sigma2.xy.

## Number of herds per province:
npsu <- 20
nherds.p <- as.integer(runif(n = npsu, min = 50, max = 1200))

## Mean herd size per province:
hsize.p <- as.integer(runif(n = npsu, min = 25, max = 900))

## Simulate estimates of the cow-level prevalence of brucellosis in each 
## province. Here we generate an equal mix of `low' and `high' brucellosis
## prevalence provinces:
prev.p <- c(runif(n = 15, min = 0, max = 0.05), 
   runif(n = 5, min = 0.40, max = 0.80)) 

## Generate some data:
prov <- c(); herd <- c(); 
Xij <- c(); Yij <- c(); 
Xbar <- c(); Ybar <- c();
Xij.Xbar <- c(); Yij.Ybar <- c()

for(i in 1:npsu){
   ## Province identifiers:
   tprov <- rep(i, times = nherds.p[i])
   prov <- c(prov, tprov)
   
   ## Herd identifiers:
   therd <- 1:nherds.p[i]
   herd <- c(herd, therd)
   
   ## Number of cows in each of the herds in this province:
   tXij <- as.integer(rlnorm(n = nherds.p[i], meanlog = log(hsize.p[i]), 
      sdlog = 0.5))
   tXbar <- mean(tXij)
   tXij.Xbar <- (tXij - tXbar)^2
   Xij <- c(Xij, tXij)
   Xbar <- c(Xbar, rep(tXbar, times = nherds.p[i]))
   Xij.Xbar <- c(Xij.Xbar, tXij.Xbar)   
   
   ## Number of brucellosis-positive cows in each herd:
   tYij <- c()
   for(j in 1:nherds.p[i]){ 
      ttYij <- rbinom(n = 1, size = tXij[j], prob = prev.p[i]) 
      tYij <- c(tYij, ttYij)
      }
    tYbar <- mean(tYij)
    tYij.Ybar <- (tYij - tYbar)^2
    Yij <- c(Yij, tYij)
    Ybar <- c(Ybar, rep(tYbar, times = nherds.p[i]))
    Yij.Ybar <- c(Yij.Ybar, tYij.Ybar)   
}

ssudat <- data.frame(prov, herd, Xij, Yij, Xbar, Ybar, Xij.Xbar, Yij.Ybar)
ssudat$XY <- (ssudat$Xij - ssudat$Xbar) * (ssudat$Yij - ssudat$Ybar)

## Collapse the herd-level data (created above) to the province level: 
prov <- as.vector(by(ssudat$prov, INDICES = ssudat$prov, FUN = min))
Xi <- as.vector(by(ssudat$Xij, INDICES = ssudat$prov, FUN = sum))
Yi <- as.vector(by(ssudat$Yij, INDICES = ssudat$prov, FUN = sum))
psudat <- data.frame(prov, Xi, Yi)

psudat$Xi.Xbar <- (psudat$Xi - mean(psudat$Xi))^2
psudat$Yi.Ybar <- (psudat$Yi - mean(psudat$Yi))^2
psudat$XY <- (psudat$Xi - mean(psudat$Xi)) * (psudat$Yi - mean(psudat$Yi))

## Number of primary and secondary sampling units:
npsu <- nrow(psudat)
nssu <- round(mean(by(ssudat$herd, INDICES = ssudat$prov, FUN = length)),
   digits = 0)
tn <- c(npsu, nssu)

## Mean of X at primary sampling unit and secondary sampling unit level:
tmean <- c(mean(psudat$Xi), mean(ssudat$Xij))

## Variance of herd size:
tsigma2.x <- c(mean(psudat$Xi.Xbar), mean(ssudat$Xij.Xbar))

## Variance of number of brucellosis-positive cows:
tsigma2.y <- c(mean(psudat$Yi.Ybar), mean(ssudat$Yij.Ybar))
tsigma2.xy <- c(mean(psudat$XY), mean(ssudat$XY))

## Finally, calculate the number of provinces to be sampled:
tR <- sum(psudat$Yi) / sum(psudat$Xi)

epi.cluster2size(nbar = 234, R = tR, n = tn, mean = tmean, 
   sigma2.x = tsigma2.x, sigma2.y = tsigma2.y, sigma2.xy = tsigma2.xy, 
   epsilon.r = 0.3, method = "proportion", conf.level = 0.95)

## Four provinces (sampling 234 herds from each) are required to be 95% 
## confident that our estimate of the individual animal prevalence of 
## brucellosis is within 30% of the true population value.




