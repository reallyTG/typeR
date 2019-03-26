library(ModelMap)


### Name: col2trans
### Title: colors to transparent colors
### Aliases: col2trans
### Keywords: models

### ** Examples


col.names=c("blue","violetred4","thistle3","yellowgreen")
col2trans(col.names,alpha=.2)


###to see effect of alpha###

alpha<-(0:10)/10
colmat<-matrix(	1:(length(alpha)*length(col.names)),
			nrow=length(alpha),
			ncol=length(col.names),
			byrow=TRUE)

color.codes<-vector("character",0)

for(i in 1:length(alpha)){
	color.codes<-c(color.codes,col2trans(col.names,alpha=alpha[i]))
}

#make plot#
plot(	c(0,1),c(0,1),
	type="n",xlab="alpha",ylab="color name",yaxt="n",xaxs="i",yaxs="i")
abline(h=(0:100)/100)
image(	z=colmat,
		x=(0:length(alpha))/length(alpha),
		y=(0:length(col.names))/length(col.names),
		col=color.codes,
		add=TRUE
		)
op<-par(xpd=TRUE)
text(	col.names,
	x=-.08,
	y=(1:length(col.names)-.5)/length(col.names),
	srt=90)
par(op)





