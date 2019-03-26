library(LogitNet)


### Name: LogitNet.weight
### Title: Derive the weight matrix for fitting the LogitNet model.
### Aliases: LogitNet.weight
### Keywords: methods

### ** Examples


######################## obtain a data example

data(LogitNet.data)
data.m=LogitNet.data$data.m
chromosome=LogitNet.data$chromosome
p=ncol(data.m)

######################## specify the penalty parameter
lambda.n=5
lambda.v=exp(seq(log(13), log(30), length=lambda.n))

######################## calculate the weight matrix
w.m=LogitNet.weight(data.m, chr=chromosome) 

######################## perform cross validation to select lambda
if(0) ### this part will take 10 minutes.
{
try.CV=LogitNet.CV(data.m, w.m, lambda.v, fold=5) 
temp=apply(try.CV[[3]], 2, sum) 
index=which.max(temp) 
}
index=2
######################## estimate the model at selected lambda values

result=LogitNet(data.m, w.m, lambda.v[index]) ###20-30 seconds

######################## illustrate the result similar to Figure 3 of Wang et al. (2009)).

temp=result
diag(temp)=0

par(cex=1.8)
image(1:p, 1:p, temp!=0, col=c("white", "red"), axes=FALSE, xlab="Marker Loci", ylab="Marker Loci")
abline(h=(0:5)*p/6+p/6/2, col=4, lty=3, lwd=0.8)
abline(v=(0:5)*p/6+p/6/2, col=4, lty=3, lwd=0.8)
axis(1, at=c(1,1:6*100), labels=c(1,1:6*100))
axis(2, at=c(1,1:6*100), labels=c(1,1:6*100))
axis(3, at=(0:5)*p/6+p/6/2, labels=c("A", "B", "C", "D", "E", "F"), col.axis=4, tick=FALSE)
axis(4, at=(0:5)*p/6+p/6/2, labels=c("A", "B", "C", "D", "E", "F"), col.axis=4, tick=FALSE)

lab.v=c("A", "B", "C", "D", "E", "F")

cut=30
for(i in 0:4)
{
   cur=i*p/6+p/6/2
   cur2=(i+1)*p/6+p/6/2

   x.cur=c(cur-cut, cur, cur+cut, cur)
   y.cur=c(cur2, cur2-cut, cur2, cur2+cut)
   polygon(x.cur, y.cur, border=grey(0.5))
   polygon(y.cur, x.cur, border=grey(0.5))
}



