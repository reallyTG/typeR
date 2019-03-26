library(Davies)


### Name: davies.moment
### Title: Moments of the Davies distribution
### Aliases: davies.moment kurtosis skewness expected.value
###   expected.value.approx mu variance M
### Keywords: distribution

### ** Examples

params <- c(10,0.1,0.1)
davies.moment(n=100,i=99,2,params) # ie the second moment of the 99th smallest
                            # observation of 100 drawn from a Davies
                            # distribution with parameters p


mean(rdavies(1e6,params))-mu(params)

#now reproduce the S-K graph:

f <- function(x,y){c(skewness(c(1,x,y)),kurtosis(c(1,x,y)))}
g <- function(j,vector,pp,qq=1){points(t(sapply(vector,f,y=j)),type="l",col="black",lty=qq)}

vector <- c((0:300)/100 , (0:300)/10000 , seq(from=3,to=10,len=100))
vector <- sort(unique(vector))

plot(t(sapply((0:10)/10,f,y=0)),
       xlim=c(-3,3),ylim=c(0,10),
       type="n",xlab="skewness",ylab="kurtosis")
g(0.001,vector,"red",qq=1)
g(0.01,vector,"yellow",qq=2)
g(0.02,vector,"green",qq=3)
g(0.05,vector,"blue",qq=4)
g(0.1 ,vector,"purple",qq=5)
g(0.14,vector,"black",qq=6)

x <- seq(from=-3,to=3,len=30)
points(x,x^2+1,type="l",lwd=2)

leg.txt <- expression(lambda[2]==0.001,
        lambda[2]==0.01,lambda[2]==0.02,lambda[2]==0.05,
        lambda[2]==0.1,lambda[2]==0.14)
legend(-1.1,10,leg.txt,col="black",lty=1:6)



