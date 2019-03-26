library(epiR)


### Name: epi.simplesize
### Title: Sample size under simple random sampling
### Aliases: epi.simplesize
### Keywords: univar univar

### ** Examples

## EXAMPLE 1:
## A city contains 20 neighbourhood health clinics and it is desired to take a 
## sample of clinics to estimate the total number of persons from all these 
## clinics who have been given, during the past 12 month period, prescriptions 
## for a recently approved antidepressant. If we assume that the average number 
## of people seen at these clinics is 1500 per year with the standard deviation 
## equal to 300, and that approximately 5% of patients (regardless of clinic) 
## are given this drug, how many clinics need to be sampled to yield an estimate 
## that is within 20% of the true population value?

pmean <- 1500 * 0.05; pvar <- (300 * 0.05)^2
epi.simplesize(N = 20, Vsq = (pvar / pmean^2), Py = NA, epsilon.r = 0.20, 
   method = "total", conf.level = 0.95)

## Three clinics need to be sampled to meet the survey requirements. 

## EXAMPLE 2:
## We want to estimate the mean bodyweight of deer on a farm. There are 278
## animals present. We anticipate the mean body weight to be around 200 kg
## and the standard deviation of body weight to be 30 kg. We would like to
## be 95% certain that our estimate is within 10 kg of the true mean. How
## many deer should be sampled?

epi.simplesize(N = 278, Vsq = 30^2 / 200^2, Py = NA, epsilon.r = 10/200, 
   method = "mean", conf.level = 0.95)

## A total of 31 deer need to be sampled to meet the survey requirements.

## EXAMPLE 3:
## We want to estimate the seroprevalence of Brucella abortus in a population 
## of cattle. An estimate of the unknown prevalence of B. abortus in this 
## population is 0.15. We would like to be 95% certain that our estimate is 
## within 20% of the true proportion of the population that is seropositive 
## to B. abortus. Calculate the required sample size.

n.crude <- epi.simplesize(N = 1E+06, Vsq = NA, Py = 0.15, epsilon.r = 0.20,
   method = "proportion", conf.level = 0.95)
n.crude

## A total of 544 cattle need to be sampled to meet the survey requirements.

## EXAMPLE 3 (continued):
## Being seropositive to brucellosis is likely to cluster within herds.
## Otte and Gumm (1997) cite the intraclass correlation coefficient (rho) of
## Brucella abortus to be in the order of 0.09. Adjust the sample size
## estimate to account for clustering at the herd level. Assume that, on
## average, 20 animals will be sampled per herd:

## Let D equal the design effect and nbar equal the average number of 
## individuals per cluster:

## rho = (D - 1) / (nbar - 1)

## Solving for D:
## D <- rho * (nbar - 1) + 1

rho <- 0.09; nbar <- 20
D <- rho * (nbar - 1) + 1

n.adj <- ceiling(n.crude * D)
n.adj

## After accounting for the presence of clustering at the herd level we
## estimate that a total of 1475 cattle need to be sampled to meet
## the requirements of the survey.




