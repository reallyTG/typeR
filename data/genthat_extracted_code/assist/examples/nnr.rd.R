library(assist)


### Name: nnr
### Title: Nonlinear Non-parametric Regression
### Aliases: nnr
### Keywords: file

### ** Examples

x<- 1:100/100
y<- exp(sin(2*pi*x))+0.3*rnorm(x)
fit<- nnr(y~exp(f(x)), func=list(f(u)~list(~u, cubic(u))), start=list(0))

## fit a generalized varying coefficient models
data(Arosa)
Arosa$csmonth <- (Arosa$month-0.5)/12
Arosa$csyear <- (Arosa$year-1)/45
ozone.vc.fit <- nnr(thick~f1(csyear)+exp(f2(csyear))*f3(csmonth),
        func=list(f1(x)~list(~I(x-.5),cubic(x)), f2(x)~list(~I(x-.5)-1,cubic(x)),
        f3(x)~list(~sin(2*pi*x)+cos(2*pi*x)-1,lspline(x,type="sine0"))),
        data=Arosa[Arosa$year%%2==1,], spar="m", start=list(f1=mean(thick),f2=0,f3=sin(csmonth)),
        control=list(backfit=1))



