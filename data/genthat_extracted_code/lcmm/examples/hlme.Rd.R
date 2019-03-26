library(lcmm)


### Name: hlme
### Title: Estimation of latent class linear mixed models
### Aliases: hlme

### ** Examples



##### Example of a latent class model estimated for a varying number
# of latent classes: 
# The model includes a subject- (ID) and class-specific linear 
# trend (intercept and Time in fixed, random and mixture components)
# and a common effect of X1 and its interaction with time over classes 
# (in fixed). 
# The variance of the random intercept and slope are assumed to be equal 
# over classes (nwg=F).
# The covariate X3 predicts the class membership (in classmb).
#
# !CAUTION: initialization of mixed models with latent classes is 
# of most importance because of the problem of multimodality of the likelihood.
# Calls m2a-m2d illustrate the different implementations for the 
# initial values.

### homogeneous linear mixed model (standard linear mixed model) 
### with correlated random-effects
m1<-hlme(Y~Time*X1,random=~Time,subject='ID',ng=1,data=data_hlme)
summary(m1)

### latent class linear mixed model with 2 classes

# a. automatic specification from G=1 model estimates:
m2a<-hlme(Y~Time*X1,mixture=~Time,random=~Time,classmb=~X2+X3,subject='ID',
         ng=2,data=data_hlme,B=m1)
         
# b. vector of initial values provided by the user:
m2b<-hlme(Y~Time*X1,mixture=~Time,random=~Time,classmb=~X2+X3,subject='ID',
         ng=2,data=data_hlme,B=c(0.11,-0.74,-0.07,20.71,
                                 29.39,-1,0.13,2.45,-0.29,4.5,0.36,0.79,0.97))
 
# c. random draws from G = 1 model estimates:
m2c<-hlme(Y~Time*X1,mixture=~Time,random=~Time,classmb=~X2+X3,subject='ID',
          ng=2,data=data_hlme,B=random(m1))

# d. gridsearch with 50 departures and 10 iterations of the algorithm 
#     (see function gridsearch for details)
## Not run: 
##D m2d <- gridsearch(rep = 50, maxiter = 10, minit = m1, hlme(Y ~ Time * X1, 
##D mixture =~ Time, random =~ Time, classmb =~ X2 + X3, subject = 'ID', ng = 2, 
##D data = data_hlme))
##D 
## End(Not run)  
          


# summary of the estimation process
summarytable(m1, m2a, m2b, m2c)

# summary of m2a
summary(m2a)

# posterior classification
postprob(m2a)

# plot of predicted trajectories using some newdata
newdata<-data.frame(Time=seq(0,5,length=100),
X1=rep(0,100),X2=rep(0,100),X3=rep(0,100))
plot(predictY(m2a,newdata,var.time="Time"),legend.loc="right",bty="l")






