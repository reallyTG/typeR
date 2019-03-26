library(NetWeaver)


### Name: rc.initialize
### Title: Initialize Circos Plot Parameters
### Aliases: rc.initialize

### ** Examples

library(NetWeaver)
options(stringsAsFactors=FALSE)
## set fake Cyto data
Cyto=data.frame(Chr=paste0('C',1:20), Start=1, End=100, BandColor=colors()[2:21])

## initialize circos
#firstly set number of tracks, should be larger than the actual number of tracks
#used for plotting in order to leave sufficient sapce in the middle
num.tracks=8 
rc.initialize(Cyto, num.tracks=num.tracks, params=list(chr.padding=0.1))

##retrieve parameters
params=rc.get.params()
#make plot area
rc.plot.area()

##plot ideogram on track 1 and 2 (start from the outside to inside)
track.num=1:2
rc.plot.ideogram(track.num, plot.band=TRUE, plot.chromosome.id=TRUE)

##plot histograms that span multiple chromosomes
MultHistData=data.frame(Chr1=paste0('C',seq(1,18,3)), Start1=50, 
	Chr2=paste0('C',seq(3,20,3)), End2=20, Col=1:6)
track.num=3
rc.plot.mHistogram(MultHistData, track.id=track.num, data.col=5,
	color.col=5, track.border=NA, fixed.height=TRUE)

##plot histogram that occupies two tracks 4 and 5
HistData=data.frame(Chr=paste0('C',1:20), Start=1, End=50, Data=runif(20))
params$color.hist <- 'black'
rc.reset.params(params)
track.num=5
rc.plot.histogram(HistData, track.num, data.col=4, fixed.height=FALSE, 
	custom.track.height=params$track.height*2)

##plot heatmap on track 6
HeatData=data.frame(Chr=paste0('C',1:20), Start=1,End=100, Data=1:20)
colfuncHeat=function(n) rev(heat.colors(n))
track.num=track.num+1
rc.plot.histogram(HeatData, track.num, data.col=4, color.gradient=colfuncHeat(50),
	fixed.height=TRUE)

##plot links in the middle
LinkData=data.frame(Chr1=sample(Cyto$Chr,40,replace=TRUE), Pos1=20, 
	Chr2=sample(Cyto$Chr,40,replace=TRUE),Pos2=20, Data=runif(20))
LinkData=LinkData[LinkData$Chr1 != LinkData$Chr2,]
params$color.line='blue'
rc.reset.params(params)
track.num=track.num+1
rc.plot.link(LinkData, track.num, data.col=4)
ribbonData=data.frame(Chr1=c('C1','C3'), Start1=c(10,10), End1=c(40,40),
	Chr2=c('C17','C10'), Start2=20, End2=60, Col=c('red','brown'))
rc.plot.ribbon(ribbonData, track.num, color.col='Col', twist=TRUE)
#label track id
rc.plot.track.id(2:6, col=2)
#add text label
rc.plot.text(data.frame(Chr='C3',Pos=50,Label='GeneX'), track.id=3,srt=45,cex=0.8,col='blue')
#add line mark
rc.plot.line(data.frame(Chr='C19',Pos=seq(10,90,by=10),Col='red'), track.id=3, color.col=3)



