library(expp)


### Name: epp-class
### Title: Building data-set for realized and unrealized EPP-pairs
### Aliases: epp-class epp as.data.frame as.data.frame,epp-method
###   plot,epp,missing-method plot.epp barplot barplot,epp-method
### Keywords: spatial

### ** Examples


  ### Simple example with three breeding pairs
  require(expp)
  # create raw data
  set.seed(1310)
  b = data.frame(id = as.integer(10:12), x = rnorm(3), y = rnorm(3), 
  male = paste0("m",1:3), female =  paste0("f",1:3), xx = rnorm(3), stringsAsFactors=FALSE  )  
  eppPairs = data.frame(male = c("m1", "m2", "m1"), female=c("f3", "f1", "f2") )
  
  # prepare data
  breedingDat = SpatialPointsBreeding(b, id = 'id', coords = ~ x + y, breeding = ~ male + female)
  polygonsDat = DirichletPolygons(breedingDat)
  eppDat   = eppMatrix(eppPairs, pairs = ~ male + female)

  plot(breedingDat, eppDat)
  
  # convert to epp class     
  x = epp(breedingDat, polygonsDat, eppDat, maxlag = 3)
  as.data.frame(x)
  
  
  #plot 
  plot(x) 
  
  ### Example on a random data set with n breeding pairs and  n/2 extra-pair paternity rate
  # create raw data
  set.seed(123)
  n = 20
  b = data.frame(id = 1:n, x = rnorm(n), y = rnorm(n), 
  male = paste0("m",1:n), female =  paste0("f",1:n), xx = rnorm(n), stringsAsFactors=FALSE  )  
  eppPairs = data.frame(male = sample(b$male, round(n/2) ), female = sample(b$female, round(n/2) ) )
  
  # prepare data
  breedingDat = SpatialPointsBreeding(b, id = 'id', coords = ~ x + y, breeding = ~ male + female)
  polygonsDat = DirichletPolygons(breedingDat)
  eppDat   = eppMatrix(eppPairs, pairs = ~ male + female)
  
  # convert to epp class
  x = epp(breedingDat, polygonsDat, eppDat, maxlag = 10)
  
  # plot 
  plot(x)
  barplot(x) 
  barplot(x, relativeValues = TRUE) 
  

## No test: 
   
  ### Real data example
  # Raw datasets 
  data(bluetit_breeding)
  data(bluetit_epp)
  # select one year 
  year = 2010
  b = bluetit_breeding[bluetit_breeding$year_ == year, ]
  eppPairs = bluetit_epp[bluetit_epp$year_ == year, ]
  
  # prepare data
  breedingDat  = SpatialPointsBreeding(b, id = 'id', coords = ~ x + y, breeding = ~ male + female)
  polygonsDat = DirichletPolygons(breedingDat)
  eppDat = eppMatrix(eppPairs, pairs = ~ male + female)
  
  # convert to epp class
  x = epp(breedingDat, polygonsDat, eppDat, maxlag = 2)
  
  # plot
  plot(x)
  barplot(x) 
  # plot zoom
  plot(x, zoom = 120, maxlag = 3) 
  
  # run model on epp probability     
  dat = as.data.frame(x)
  nrow(dat[dat$epp == 1, c('male', 'female')] )
  nrow(unique(eppPairs))
  
  if(require(lme4))
   (summary(glmer(epp ~ rank + male_age_MALE + (1|male) + (1|female), 
    data = dat, family = binomial)))

## End(No test)
  




