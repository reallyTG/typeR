library(untb)


### Name: zsm
### Title: Zero sum multinomial distribution as derived by McKane
### Aliases: zsm
### Keywords: math

### ** Examples

 sum(zsm(164,0.1,0.5))  # should be 1



# McKane et al 2004: figure 1.
layout(matrix(1:4,2,2))
par(mai=0.2+rep(0,4))
plot(1,type="n",log="y",ylim=c(1e-9,1),xlim=c(0,64),xlab="",ylab="Ps(N)",
     axes=FALSE,main=expression(J==64))
axis(1,pos=1e-9)
axis(2,pos=0,at=10^(-(0:9)))
segments(64,1e-9,64,1)
segments(60,1e-9,64,1e-9)
f <- function(P){points(0:64,zsm(64,P=P,m=0.05),type="l")}
for(i in 1:9){f(i/10)}
f(0.99)
f(0.999)
f(0.01)
f(0.001)
text(07,3.2e-7,adj=0,expression(P==0.999))
text(49,3.2e-7,adj=0,expression(P==0.001))
text(45,0.1,expression(m==0.05))


plot(1,type="n",log="y",ylim=c(1e-5,1),xlim=c(0,64),xlab="",ylab="Ps(N)",
     axes=FALSE,main="")
axis(1,pos=1e-5)
axis(2,pos=0,at=10^-(0:5))
segments(60,1e-5,64,1e-5)
segments(64,1e-5,64,1)
par(xpd=FALSE)
g <- function(m){points(0:64,pmax(zsm(64,P=0.1,m=m),1e-5),type="l")}
g(0.0001)
g(0.0005)
g(0.002)
g(0.01)
g(0.02)
g(0.05)
g(0.5)
g(0.999)
text(50,0.4,expression(P==0.1))

plot(1,type="n",log="y",ylim=c(1e-9,1),xlim=c(0,1e5),xlab="",ylab="Ps(N)",
     axes=FALSE,main=expression(J==10000))
axis(1,pos=1e-9)
axis(2,pos=0)
segments(1e5,1e-9,1e5,0.1)


h <- function(P){points(0:1e5,pmax(zsm(1e5,P=P,m=0.05),1e-9),type="l")}
for(i in 1:9){h(i/10)}
h(0.01)
h(0.99)
text(75000,0.1,expression(m==0.5))

plot(1,type="n",log="y",ylim=c(1e-40,1),xlim=c(0,1e5),xlab="",ylab="Ps(N)",
     axes=FALSE,main="")
axis(1,pos=1e-40)
axis(2,pos=0,at=1/10^c(40,32,24,16,8,0))
segments(1e5,1e-40,1e5,1)

i <- function(m){points(0:1e5,pmax(zsm(1e5,P=0.1,m=m),1e-40),type="l")}
i(0.0001)
i(0.0002)
i(0.0005)
i(0.001)
i(0.002)
i(0.005)
i(0.01)
i(0.02)
i(0.5)
text(60000,1e-4,expression(P==0.1))







