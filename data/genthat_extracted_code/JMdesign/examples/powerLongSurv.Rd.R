library(JMdesign)


### Name: powerLongSurv
### Title: Power calculation in joint modeling of longitudinal and survival
###   data - k-th Order Trajectories and Unknown Sigma
### Aliases: powerLongSurv JMdesign-powerLongSurv
### Keywords: functions

### ** Examples

## Example 1.
## **********
## Input elements of Sigma_theta in forumula 4.6;
SigmaTheta <- matrix(c(1.2,0.0,0.0,0.0,0.7,0.0,0.0,0.0,0.8),nrow=3,ncol=3)

N        <-  200; # Total sample size;
nevents  <-  140; # Number of events;
tmedian  <-  0.7; # median survival;
meantf   <-  1.4; # mean follow-up time;
beta     <-  0.2; # Effect of the trajectory;
alpha    <-  0.05;# Type-I Error (2-sided);
sigmae_2 <-  0.09; # measurement error;

## schedule of measurement;
t <- c(0.4, 0.8, 1.2, 1.6, 2) ; # maximum 2 year follow-up;

## Input estimated proportion subjects with 2,3,4,5,6 measurements;
## This is \xi in formula 4.6;
## The data is obtained from the simulated data for the calculation in table 2;
p <- c(0.3, 0.4, 0.15, 0.1, 0.05);

## Input the order of trajectories
ordtraj <- 1 ## linear trajectories

## Call function
## Linear Trajectories
pLSl <- powerLongSurv(N, nevents, tmedian, meantf, p, t, SigmaTheta,
                      sigmae_2, ordtraj, beta, alpha=0.05)
pLSl
show(pLSl)
unclass(pLSl)

## Constant Trajectories
powerLongSurv(N, nevents, tmedian, meantf, p, t, SigmaTheta, sigmae_2,
              ordtraj=0, beta, alpha=0.05)

## Quadratic Trajectories
powerLongSurv(N, nevents, tmedian, meantf, p, t, SigmaTheta, sigmae_2,
              ordtraj=2, beta, alpha=0.05)

## ***************************************************************************

## Example 2.
## **********
## Input elements of Sigma_theta in forumula 4.6;
SigmaTheta <- matrix(c(1.2,0.0,0.0,0.0,0.7,0.0,0.0,0.0,0.8),nrow=3,ncol=3)

N        <-  200; # Total sample size;
nevents  <-  140; # Number of events;
tmedian  <-  0.7; # median survival;
meantf   <-  1.4; # mean follow-up time;
beta     <-  0.2; # Effect of the trajectory;
alpha    <-  0.05;# Type-I Error (2-sided);
sigmae_2 <-  0.09; # measurement error;

## schedule of measurement;
t <- c(0.4, 0.8, 1.2, 1.6);

## Input estimated proportion subjects with 2,3,4,5,6 measurements;
## This is \xi in formula 4.6;
## The data is obtained from the simulated data for the calculation in table 2;
p <- c(0.3, 0.4, 0.2, 0.1);

## Input the order of trajectories
ordtraj <- 2 ## quadratic trajectories

## Call function
## Quadratic Trajectories
pLSq <- powerLongSurv(N,nevents,tmedian,meantf,p,t,SigmaTheta,sigmae_2,ordtraj,beta, alpha = 0.05)
pLSq
show(pLSq)
unclass(pLSq)

## Constant Trajectories
powerLongSurv(N, nevents, tmedian, meantf, p, t, SigmaTheta, sigmae_2,
              ordtraj=0, beta, alpha=0.05)

## Linear Trajectories
powerLongSurv(N, nevents, tmedian, meantf, p, t, SigmaTheta, sigmae_2,
              ordtraj=1, beta, alpha=0.05)



