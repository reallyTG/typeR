library(npmlreg)


### Name: alldist
### Title: NPML estimation or Gaussian quadrature for overdispersed GLM's
###   and variance component models
### Aliases: alldist allvc
### Keywords: models regression

### ** Examples


# The first three examples (galaxy data, toxoplasmosis data , fabric faults) 
# are based on GLIM examples in Aitkin et al. (2005), and the forth example using
# the Hospital-Stay-Data (Rosner, 2000) is taken from Einbeck & Hinde (2006).
# The fifth data example using the Oxford boys is again inspired by Aitkin et al. (2005).
# The sixth example on Irish suicide rates is taken from Sofroniou et al. (2006).
  

# The galaxy data   
  data(galaxies, package="MASS")
  gal<-as.data.frame(galaxies)
  galaxy.np6 <- alldist(galaxies/1000~1, random=~1, random.distribution="np", 
      data=gal, k=6)
  galaxy.np8u <- alldist(galaxies/1000~1, random=~1, random.distribution="np", 
      data=gal, k=8, lambda=0.99)
  round(galaxy.np8u$sdev$sdevk, digits=3)
  # [1]  0.912 0.435 0.220 0.675 1.214 0.264 0.413 0.297

# The toxoplasmosis data 
  data(rainfall)
  rainfall$x<-rainfall$Rain/1000  
  rainfall$x2<- rainfall$x^2; rainfall$x3<- rainfall$x^3
  toxo.np3<- alldist(cbind(Cases,Total-Cases) ~ x+x2+x3, random=~1, 
      random.distribution="np", family=binomial(link=logit), data=rainfall, k=3)
  toxo.np3x<- alldist(cbind(Cases,Total-Cases) ~ x, random=~x, 
      random.distribution="np", family=binomial(link=logit), data=rainfall, k=3)
  # is the same as 
  toxo.np3x<- alldist(Cases/Total ~ x, random = ~x, weights=Total, 
      family=binomial(link=logit), data=rainfall, k=3)
  # or
  toxo.np3x<-update(toxo.np3, .~.-x2-x3, random = ~x)

# The fabric faults data
  data(fabric)
  coefficients(alldist(y ~ x, random=~1, family=poisson(link=log), 
      random.distribution="gq", data= fabric, k=3, verbose=FALSE))
  # (Intercept)           x           z 
  #  -3.3088663   0.8488060   0.3574909
  
# The Pennsylvanian hospital stay data
  data(hosp)
  fitnp3<-  alldist(duration~age+temp1, data=hosp, k=3, family=Gamma(link=log),
      tol=0.5) 
  fitnp3$shape$shape
  # [1] 50.76636
  fitnp3<-  alldist(duration~age+temp1, data=hosp, k=3, family=Gamma(link=log),
      tol=0.5, lambda=0.9) 
  fitnp3$shape$shapek
  # [1]  49.03101  42.79522 126.64077
  
# The Oxford boys data
  data(Oxboys, package="nlme")
  Oxboys$boy <- gl(26,9)
  allvc(height~age, random=~1|boy, data=Oxboys, random.distribution='gq', k=20)
  allvc(height~age, random=~1|boy, data=Oxboys,random.distribution='np',k=8) 
  # with random coefficients:
  allvc(height~age,random=~age|boy, data=Oxboys, random.distribution='np', k=8)
    
# Irish suicide data
  data(irlsuicide)
  # Crude rate model:
  crude<- allvc(death~sex* age, random=~1|ID, offset=log(pop), 
      k=3, data=irlsuicide, family=poisson) 
  crude$disparity 
  # [1] 654.021
  # Relative risk model:
  relrisk<- allvc(death~1, random=~1|ID, offset=log(expected), 
      k=3, data=irlsuicide, family=poisson) 
  relrisk$disparity    
  # [1] 656.4955
  



