library(gamlss)


### Name: ps
### Title: P-Splines Fits in a GAMLSS Formula
### Aliases: ps pb pbo pbp pbc pbc.control pb.control pbo.control
###   pbp.control pvc pvc.control cy cy.control pbm pbm.control pbz
###   pbz.control getZmatrix
### Keywords: regression

### ** Examples

#==============================
# pb() and ps() functions
data(aids)
# fitting a smoothing cubic spline with 7 degrees of freedom
# plus the a quarterly  effect  
aids1<-gamlss(y~ps(x,df=7)+qrt,data=aids,family=PO) # fix df's 
aids2<-gamlss(y~pb(x,df=7)+qrt,data=aids,family=PO) # fix df's
aids3<-gamlss(y~pb(x)+qrt,data=aids,family=PO) # estimate lambda
with(aids, plot(x,y))
with(aids, lines(x,fitted(aids1),col="red"))
with(aids, lines(x,fitted(aids2),col="green"))
with(aids, lines(x,fitted(aids1),col="yellow"))
rm(aids1, aids2, aids3)
#=============================
## Not run: 
##D # pbc()
##D # simulate data
##D set.seed(555)
##D x = seq(0, 1, length = 100)
##D y = sign(cos(1 * x * 2 * pi + pi / 4)) + rnorm(length(x)) * 0.2
##D plot(y~x)
##D m1<-gamlss(y~pbc(x)) 
##D lines(fitted(m1)~x)
##D rm(y,x,m1)
##D #=============================
##D # the pvc() function
##D # function to generate data
##D genData <- function(n=200)
##D  {
##D f1 <- function(x)-60+15*x-0.10*x^2
##D f2 <- function(x)-120+10*x+0.08*x^2
##D set.seed(1441)
##D x1 <- runif(n/2, min=0, max=55)
##D x2 <- runif(n/2, min=0, max=55)
##D y1 <- f1(x1)+rNO(n=n/2,mu=0,sigma=20)
##D y2 <- f2(x2)+rNO(n=n/2,mu=0,sigma=30)
##D  y <- c(y1,y2)
##D  x <- c(x1,x2)
##D  f <- gl(2,n/2)
##D da<-data.frame(y,x,f)
##D da
##D }
##D da<-genData(500)
##D plot(y~x, data=da, pch=21,bg=c("gray","yellow3")[unclass(f)])
##D # fitting models
##D # smoothing x
##D m1 <- gamlss(y~pb(x), data=da)
##D # parallel smoothing lines
##D m2 <- gamlss(y~pb(x)+f, data=da)
##D # linear interaction
##D m3 <- gamlss(y~pb(x)+f*x, data=da)
##D # varying coefficient model
##D m4 <- gamlss(y~pvc(x, by=f), data=da)
##D GAIC(m1,m2,m3,m4)
##D # plotting the fit
##D lines(fitted(m4)[da$f==1][order(da$x[da$f==1])]~da$x[da$f==1]
##D          [order(da$x[da$f==1])], col="blue", lwd=2)
##D lines(fitted(m4)[da$f==2][order(da$x[da$f==2])]~da$x[da$f==2]
##D          [order(da$x[da$f==2])], col="red", lwd=2)
##D rm(da,m1,m2,m3,m4)
##D #=================================
##D # the rent data
##D # first with a factor
##D data(rent)
##D plot(R~Fl, data=rent, pch=21,bg=c("gray","blue")[unclass(rent$B)])
##D r1 <- gamlss(R~pb(Fl), data=rent)
##D # identical to model
##D r11 <- gamlss(R~pvc(Fl), data=rent)
##D # now with the factor
##D r2 <- gamlss(R~pvc(Fl, by=B), data=rent)
##D lines(fitted(r2)[rent$B==1][order(rent$Fl[rent$B==1])]~rent$Fl[rent$B==1]
##D                 [order(rent$Fl[rent$B==1])], col="blue", lwd=2)
##D lines(fitted(r2)[rent$B==0][order(rent$Fl[rent$B==0])]~rent$Fl[rent$B==0]
##D                 [order(rent$Fl[rent$B==0])], col="red", lwd=2)
##D # probably not very sensible model
##D rm(r1,r11,r2)
##D #-----------
##D # now with a continuous variable
##D # additive model
##D  h1 <-gamlss(R~pb(Fl)+pb(A), data=rent)
##D # varying-coefficient model
##D  h2 <-gamlss(R~pb(Fl)+pb(A)+pvc(A,by=Fl), data=rent)
##D AIC(h1,h2)
##D rm(h1,h2)
##D #-----------
##D # monotone function
##D set.seed(1334)
##D x = seq(0, 1, length = 100)
##D p = 0.4
##D y = sin(2 * pi * p * x) + rnorm(100) * 0.1
##D plot(y~x)
##D m1 <- gamlss(y~pbm(x))
##D points(fitted(m1)~x, col="red")
##D yy <- -y
##D plot(yy~x)
##D m2 <- gamlss(yy~pbm(x, mono="down"))
##D points(fitted(m2)~x, col="red")
##D #==========================================
##D # the pbz() function
##D # creating uncorrelated data
##D set.seed(123)
##D y<-rNO(100)
##D x<-1:100
##D plot(y~x)
##D #----------------------
##D # ML estimation
##D m1<-gamlss(y~pbz(x))
##D m2 <-gamlss(y~pb(x))
##D AIC(m1,m2)
##D op <- par( mfrow=c(1,2))
##D term.plot(m1, partial=T)
##D term.plot(m2, partial=T)
##D par(op)
##D # GAIC estimation
##D m11<-gamlss(y~pbz(x, method="GAIC", k=2))
##D m21 <-gamlss(y~pb(x, method="GAIC", k=2))
##D AIC(m11,m21)
##D op <- par( mfrow=c(1,2))
##D term.plot(m11, partial=T)
##D term.plot(m21, partial=T)
##D par(op)
##D # GCV estimation
##D m12<-gamlss(y~pbz(x, method="GCV"))
##D m22 <-gamlss(y~pb(x, method="GCV"))
##D AIC(m12,m22)
##D op <- par( mfrow=c(1,2))
##D term.plot(m12, partial=T)
##D term.plot(m22, partial=T)
##D par(op)
##D # fixing df is more trycky since df are the extra df 
##D m13<-gamlss(y~pbz(x, df=0))
##D m23 <-gamlss(y~pb(x, df=0))
##D AIC(m13,m23)
##D # here the second penalty is not take effect therefore identical results 
##D m14<-gamlss(y~pbz(x, df=1))
##D m24 <-gamlss(y~pb(x, df=1))
##D AIC(m14,m24)
##D # fixing lambda
##D m15<-gamlss(y~pbz(x, lambda=1000))
##D m25 <-gamlss(y~pb(x, lambda=1000))
##D AIC(m15,m25)
##D #--------------------------------------------------
##D # prediction 
##D m1<-gamlss(y~pbz(x), data=data.frame(y,x))
##D m2 <-gamlss(y~pb(x), data=data.frame(y,x))
##D AIC(m1,m2)
##D predict(m1, newdata=data.frame(x=c(80, 90, 100, 110)))
##D predict(m2, newdata=data.frame(x=c(80, 90, 100, 110)))
##D #---------------------------------------------------
## End(Not run)



