library(modes)


### Name: modes-package
### Title: modes: An R package to find the modes & assess the modality of
###   complex or mixed distributions
### Aliases: modes-package
### Keywords: distribution nonparametric univar multivariate mode

### ** Examples
 #12 Examples of the most useful and common features of this package
#are included below.

#####		Nonparametric Examples		#####

### 1) Mode examples

 ##Example 1.1
 #data<-c(rep(6,9),rep(3,3))
 #mode(data,type=1,"NULL","NULL")

 ##Example 1.2
 #data<-c(rep(6,9),rep(3,9))
 #mode(data,type=1,"NULL","NULL")
 
 ##Example 1.3
 #data<-c(rep(6,9),rep(3,8),rep(7,7),rep(2,6))
 #mode(data,type=1,"NULL",2)

 ##Example 1.4
 #data<-c(rnorm(15,0,1),rnorm(21,5,1),rep(3,3))
 #mode(data)

 ##Example 1.5
 #data<-c(rep(6,3),rep(3,3),rnorm(15,0,1))
 #mode(data,3,NULL,4)
 #mode(data,type=2,digits=1,3)


### 2) Other General Parametric Examples

 ##Example 2.1
 #data<-c(rnorm(15,0,1),rnorm(21,5,1))
 #hist(data)
 #bimodality_amplitude(data,TRUE)
 #bimodality_coefficient(data,TRUE)
 #bimodality_ratio(data,FALSE)

 ##Example 2.2
 #data<-c(rnorm(21,0,1),rnorm(21,5,1))
 #hist(data)
 #bimodality_amplitude(data,TRUE)
 #bimodality_coefficient(data,TRUE)
 #bimodality_ratio(data,FALSE)

### 3) Mixture Proportions Examples

 ##Example 3.1
 #dist1<-rnorm(21,5,2)
 #dist2<-dist1+11
 #data<-c(dist1,dist2)
 #hist(data)
 #bimodality_amplitude(data,TRUE)
 #bimodality_ratio(data,FALSE)

 ##Example 3.2
 #dist1<-rnorm(21,-15,1)
 #dist2<-rep(dist1,3)+30
 #data<-c(dist1,dist2)
 #hist(data)
 #bimodality_amplitude(data,TRUE)
 #bimodality_ratio(data,FALSE)

 ##Example 3.4
 #dist1<-rep(7,70)
 #dist2<-rep(-7,70)
 #data<-c(dist1,dist2)
 #hist(data)
 #bimodality_ratio(data,FALSE)


#####		Parametric Examples		#####

### 4) Replicating a two component Gaussian (normal) mixture  
### Example 4.1

 ##Draw data & plot the distribution
 #dist1<-rnorm(14,-5,1)
 #dist2<-rnorm(21,5,1)
 #plot(density(c(dist1,dist2)), main="Bimodal Gaussian mixture distribution")
 
 ##Calculate the means and standard deviations
 #mu1<-mean(dist1)
 #mu2<-mean(dist2)
 #sd1<-sd(dist1)
 #sd2<-sd(dist2)

 ##Apply measures
 #Ashmans_D(mu1,mu2,sd1,sd2)
 #bimodality_separation(mu1,mu2,sd1,sd2)


### 5) Applying to know mixture components  
### Example 5.1

 ##Draw data & plot the distribution
 #data<-c(rnorm(15,0,1),rnorm(21,15,3))
 #plot(density(c(dist1,dist2)), main="Bimodal Gaussian mixture distribution")

 ##Apply measures
 #Ashmans_D(mu1,mu2,sd1,sd2)
 #bimodality_separation(mu1,mu2,sd1,sd2)



