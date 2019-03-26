library(magicaxis)


### Name: magmap
### Title: Value remapper
### Aliases: magmap
### Keywords: mapping

### ** Examples

set.seed(650)
temp=cbind(runif(100),runif(100))
temp=cbind(temp,sqrt(temp[,1]^2+temp[,2]^2))
magplot(temp)
magplot(temp[,1:2],col=hsv(h=magmap(temp[,3])$map))

# A different mapping type:
magplot(temp[,1:2],col=hsv(h=magmap(temp[,3],type='rank')$map))

# Flipped:
magplot(temp[,1:2],col=hsv(h=magmap(temp[,3],flip=TRUE,type='rank')$map))

# Example of linear/log/atan/asinh mapping:
temp=cbind(temp,10^temp[,3])
magplot(temp[,1:2],col=hsv(h=magmap(temp[,4])$map))
magplot(temp[,1:2],col=hsv(h=magmap(temp[,4],stretch='log')$map))
magplot(temp[,1:2],col=hsv(h=magmap(temp[,4],stretch='atan')$map))
magplot(temp[,1:2],col=hsv(h=magmap(temp[,4],stretch='asinh')$map))

#atan and asinh can be useful when data spans negative to positive:
temp=cbind(temp,temp[,4]-10)
magplot(temp[,1:2],col=hsv(h=magmap(temp[,5],stretch='atan')$map))
magplot(temp[,1:2],col=hsv(h=magmap(temp[,5],stretch='asinh')$map))
#effect of stretchscale
magplot(temp[,1:2],col=hsv(h=magmap(temp[,5],stretch='atan',stretchscale=0.5)$map))
magplot(temp[,1:2],col=hsv(h=magmap(temp[,5],stretch='atan',stretchscale=2)$map))
magplot(temp[,1:2],col=hsv(h=magmap(temp[,5],stretch='asinh',stretchscale=0.5)$map))
magplot(temp[,1:2],col=hsv(h=magmap(temp[,5],stretch='asinh',stretchscale=2)$map))

#Using multiple mappings for plots:
magplot(temp[,1:2],col=hsv(h=magmap(temp[,4],stretch='log')$map),
cex=magmap(temp[,3],lo=0.5,hi=1,range=c(1,6),type='num')$map)

#Different combinations of mapping options:
magmap(c(-1,0.1,1,NA,0.3,3),lo=0,hi=2.5,type='num',stretch='lin',bad=0.5)$map
magmap(c(-1,0.1,1,NA,0.3,3),lo=0.1,hi=0.9,type='quan',stretch='log',bad=0.8)$map
magmap(c(-1,0.1,1,NA,0.3,3),lo=-1,hi=1,type='sig',stretch='asinh',bad=0,stretchscale=2)$map
magmap(c(-1,0.1,1,NA,0.3,3),type='rank',stretch='atan',bad=NA,stretchscale=2)$map

#Example showing using asinh to generate a different axis mapping:
datastretch=cbind(runif(1e3),10^runif(1e3,0,4)-10^runif(1e3,0,4))
#This isn't a very helpful view of the data
magplot(datastretch[,1:2])
#This only shows the positive half of the data:
magplot(datastretch[,1:2],log='y')
#We can do a better job by remapping using the asinh option in magmap:
datastretch=cbind(datastretch,magmap(datastretch[,2],lo=-1e4,hi=1e4,range=c(0,1),
type='num',stretch='asinh')$map)
asinhticks=magmap(c(-10^(4:0),0,10^(0:4)),lo=-1e4,hi=1e4,range=c(0,1),type='num',
stretch='asinh')$map
magplot(datastretch[,1],datastretch[,3],side=1)
axis(2,asinhticks,labels=c(-10^(4:0),0,10^(0:4)))
abline(h=magmap(0,lo=-1e4,hi=1e4,range=c(0,1),type='num',stretch='asinh')$map)




