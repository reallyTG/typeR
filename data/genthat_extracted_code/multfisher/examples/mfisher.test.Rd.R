library(multfisher)


### Name: mfisher.test
### Title: Optimal Exact Tests for Multiple Binary Endpoints
### Aliases: mfisher.test

### ** Examples

## Examples with two endpoints
data<-data.frame(endpoint1=c(0,0,1,1,1,0,0,0,0,1,1,1,1,1,1, 0,0,1,0,0,1,1,1,1,1,1,1,1,1,1),
		  endpoint2=c(0,0,0,0,0,1,1,1,1,1,1,1,1,1,1, 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1),
		  group=rep(c(0,1),each=15))
## maximal power under a specified alternative
p1<-matrix(c(0.1,0.2,0.2,0.5),2,2)
p0<-matrix(c(0.75,0.1,0.1,0.05),2,2)
rownames(p1)<-rownames(p0)<-c("EP1_failure","EP1_success")
colnames(p1)<-colnames(p0)<-c("EP2_failure","EP2_success")
testpower<-mfisher.test(x=data[,c(1:2)],y=data$group,method="power",
	p1=p1,p0=p0,closed.test=TRUE,show.region=TRUE)
print(testpower)
plot(testpower,cex=2)
str(testpower)

## maximal alpha with consonance constraint and using aggregated data as input
tab1<-table(data$endpoint1[data$group==1],data$endpoint2[data$group==1])
tab0<-table(data$endpoint1[data$group==0],data$endpoint2[data$group==0])
testalpha<-mfisher.test(x=tab1,y=tab0,method="alpha",closed.test=TRUE,
	show.region=TRUE,consonant=TRUE)
print(testalpha)
plot(testalpha,cex=2)

## Examples with three endpoints
data3EP<-data.frame(endpoint1=c(0,0,0,0,0,1,1,0,0,0, 0,0,0,0,1,1,1,1,1,1),
		     endpoint2=c(0,0,0,0,0,1,0,1,0,0, 0,0,1,1,1,1,1,1,1,1),
		     endpoint3=c(0,0,0,0,0,0,0,0,1,1, 0,0,0,1,1,1,1,1,1,1),
		     group=rep(c(0,1),each=10))

## greedy alpha exhaustion
testgreedy3EP<-mfisher.test(x=data3EP[,1:3],y=data3EP$group,method="alpha.greedy",
	show.region=TRUE,closed.test=TRUE)
print(testgreedy3EP)
par(mfrow=c(3,3))
for(i in 1:9) {
plot(testgreedy3EP,dim=c(1,2),slice=list(T3=i),show.titles=FALSE,cex=2,xlim=c(0,8),ylim=c(0,10))
title(paste("T3 =",i))
}

## Bonferroni greedy
mfisher.test(x=data3EP[,1:3],y=data3EP$group,method="bonferroni.greedy",closed.test=TRUE)
## Bonferroni greedy with alternative input of marginal tables
mfisher.test(x=list(table(data3EP$endpoint1,data3EP$group),
	table(data3EP$endpoint2,data3EP$group),table(data3EP$endpoint3,data3EP$group)),
	method="bonferroni.greedy",closed.test=TRUE)




