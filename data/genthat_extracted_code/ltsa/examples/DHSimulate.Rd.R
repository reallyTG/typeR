library(ltsa)


### Name: DHSimulate
### Title: Simulate General Linear Process
### Aliases: DHSimulate
### Keywords: ts datagen

### ** Examples

#simulate a process with autocovariance function 1/(k+1), k=0,1,...
# and plot it
n<-2000
r<-1/sqrt(1:n)
z<-DHSimulate(n, r)
plot.ts(z)

#simulate AR(1) and produce a table comparing the theoretical and sample
# autocovariances and autocorrelations
phi<- -0.8
n<-4096
g0<-1/(1-phi^2)
#theoretical autocovariances
tacvf<-g0*(phi^(0:(n-1)))
z<-DHSimulate(n, tacvf)
#autocorrelations
sacf<-acf(z, plot=FALSE)$acf
#autocovariances
sacvf<-acf(z, plot=FALSE,type="covariance")$acf
tacf<-tacvf/tacvf[1]
tb<-matrix(c(tacvf[1:10],sacvf[1:10],tacf[1:10],sacf[1:10]),ncol=4)
dimnames(tb)<-list(0:9, c("Tacvf","Sacvf","Tacf","Sacf"))
tb

#Show the Davies-Harte condition sometimes hold and sometimes does not
#   in the case of fractionally differenced white noise
#
#Define autocovariance function for fractionally differenced white noise
`tacvfFdwn` <-
function(d, maxlag)
{
    x <- numeric(maxlag + 1)
    x[1] <- gamma(1 - 2 * d)/gamma(1 - d)^2
    for(i in 1:maxlag) 
        x[i + 1] <- ((i - 1 + d)/(i - d)) * x[i]
    x
}
#Build table to show values of d for which condition is TRUE when n=5000
n<-5000
ds<-c(-0.45, -0.25, -0.05, 0.05, 0.25, 0.45)
tb<-logical(length(ds))
names(tb)<-ds
for (kd in 1:length(ds)){
    d<-ds[kd]
    r<-tacvfFdwn(d, n-1)
    tb[kd]<-DHSimulate(n, r, ReportTestOnly = TRUE)
    }
tb




