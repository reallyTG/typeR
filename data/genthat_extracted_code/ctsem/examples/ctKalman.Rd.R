library(ctsem)


### Name: ctKalman
### Title: ctKalman
### Aliases: ctKalman

### ** Examples

#Basic
ctKalman(ctstantestfit, timerange=c(0,60), timestep=.5, plot=TRUE)

#Multiple subjects, y and yprior, showing plot arguments
ctKalman(ctstantestfit, timerange=c(0,60), timestep=.1, plot=TRUE,
  subjects=2:3, 
  kalmanvec=c('y','yprior'),
  errorvec=c(NA,'ypriorcov'), #'auto' would also have achieved this
  ltyvec="auto",
  colvec='auto', 
  lwdvec='auto', 
  subsetindices=2, #Only plotting 2nd dimension of y and yprior
  pchvec='auto', typevec='auto',grid=TRUE,legend=TRUE,
  plotcontrol=list(xlim=c(0,55),main='Observations and priors'),
  polygoncontrol=list(steps=5))



