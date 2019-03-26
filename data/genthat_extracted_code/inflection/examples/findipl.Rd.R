library(inflection)


### Name: findipl
### Title: Finds the s-Left and s-Right for a Given Internal Point x[j]
### Aliases: findipl
### Keywords: findipl

### ** Examples

#
#Lets create some data based on the Fisher-Pry model, without noise:
x<-seq(0,10,by=0.1);y<-5*(1+tanh(x-5));
tese=ese(x,y,0);tese;
#     j1 j2 chi
# ESE 39 63   5
N<-length(x);N
# [1] 101
#We know that total symmetry exists, so for the middle point it is better to compute |sl|=|sr|
j=(N-1)/2+1;j
# [1] 51
#Define the left and right chord:
fl<-function(t){y[1] + (y[j] - y[1]) * (t - x[1]) / (x[j] - x[1])}
fr<-function(t){y[j] + (y[N] - y[j]) * (t - x[j]) / (x[N] - x[j])}
#Find the s-left and s-right:
LR<-findipl(x,y,j);LR;
# [1] 51.000000  5.000000 -9.031459  9.031459
#Show all results in a plot:
plot(x,y,type="l",col="red")
lines(c(x[1],x[j]),c(y[1],y[j]),type="l",col="green")
lines(c(x[N],x[j]),c(y[N],y[j]),type="l",col="blue")
points(x[j],y[j], type = "p",pch = 19,col="black")
text(2.5,1,round(LR[3],digits=2))
text(6.5,7.5,round(LR[4],digits=2))
#The two surfaces are indeed absolutely equal |sl|=|sr|
#



