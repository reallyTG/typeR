## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(fig.width=10, fig.height=10, out.width="650px",
	out.height="650px", dpi=300, fig.ext="png")

## ------------------------------------------------------------------------
colfuncBlue=colorRampPalette(c("white", "blue"))
colfuncBrown=colorRampPalette(c("white", "brown"))
colfuncHeat=function(n) rev(heat.colors(n))
nCol=50 #number of colors in a gradient

## ------------------------------------------------------------------------
library("NetWeaver")
data("Modules")

## ---- eval=FALSE---------------------------------------------------------
#  str(Modules)

## ------------------------------------------------------------------------
?rc.initialize

## ------------------------------------------------------------------------
cyto=data.frame(Chr=Modules$id, Start=1, End=100, BandColor="black", stringsAsFactors=FALSE)

## ------------------------------------------------------------------------
rc.initialize(cyto, num.tracks=36, params=list(chr.padding=0.1))

## ------------------------------------------------------------------------
(params=rc.get.params())

## ------------------------------------------------------------------------
params$color.hist <- "#A349A4"
rc.reset.params(params)

## ----ch1, eval=FALSE-----------------------------------------------------
#  rc.plot.area(size=0.9)

## ----ch2, eval=FALSE-----------------------------------------------------
#  chrom.alias=1:nrow(cyto)
#  names(chrom.alias)=cyto$Chr
#  rc.plot.ideogram(track.ids=1:2, plot.band=FALSE, plot.chromosome.id=TRUE, cex.text=1.0, chrom.alias=chrom.alias, track.border=NA)

## ----fig1, ref.label=c("ch1","ch2"), fig.cap = "Figure 1. Ideogram", echo=FALSE----
rc.plot.area(size=0.9)
chrom.alias=1:nrow(cyto)
names(chrom.alias)=cyto$Chr
rc.plot.ideogram(track.ids=1:2, plot.band=FALSE, plot.chromosome.id=TRUE, cex.text=1.0, chrom.alias=chrom.alias, track.border=NA)

## ----chunk1, eval=FALSE--------------------------------------------------
#  Rank=data.frame(cyto[,c("Chr","Start","End")], Score=Modules$Score, stringsAsFactors=FALSE)
#  rc.plot.histogram(Rank, track.id=4, data.col="Score", fixed.height=FALSE, custom.track.height=params$track.height*3, track.border=NA)

## ----fig2, ref.label=c("ch1","ch2","chunk1"), fig.cap = "Figure 2. Module ranking", echo=FALSE----
rc.plot.area(size=0.9)
chrom.alias=1:nrow(cyto)
names(chrom.alias)=cyto$Chr
rc.plot.ideogram(track.ids=1:2, plot.band=FALSE, plot.chromosome.id=TRUE, cex.text=1.0, chrom.alias=chrom.alias, track.border=NA)
Rank=data.frame(cyto[,c("Chr","Start","End")], Score=Modules$Score, stringsAsFactors=FALSE)
rc.plot.histogram(Rank, track.id=4, data.col="Score", fixed.height=FALSE, custom.track.height=params$track.height*3, track.border=NA)

## ----chunk2, eval=FALSE--------------------------------------------------
#  eigenCorCols=colnames(Modules)[grep("Rho",colnames(Modules))] #select columns with pattern Rho
#  maxCorr=1 #set maximum correlation coefficient
#  track.border="#999999"
#  track.color="white"
#  track.num=4
#  for(eigenCorCol in eigenCorCols){
#  	track.num <- track.num+1
#  	data.col <- 4
#  	color.col <- 5
#  	HistData=data.frame(Chr=Modules$id,Start=1,End=100,Data=Modules[,eigenCorCol],
#  		stringsAsFactors=FALSE)
#  	#plot positive correlation
#  	HistData1=HistData[HistData$Data > 0,]
#  	HistData1$col=colfuncBrown(nCol)[pmax(1,floor(HistData1[,data.col]*nCol/maxCorr))]
#  	rc.plot.histogram(HistData1, track.num, data.col, color.col=color.col,
#  		fixed.height=TRUE, track.color=track.color, track.border=track.border)
#  	#plot negative correlation
#  	HistData2=HistData[HistData$Data <= 0,]
#  	HistData2$Data=abs(HistData2$Data)
#  	HistData2$col=colfuncBlue(nCol)[pmax(1,floor(HistData2[,data.col]*nCol/maxCorr))]
#  	rc.plot.histogram(HistData2, track.num, data.col, color.col=color.col, fixed.height=TRUE,
#  		track.border=track.border)
#  }

## ----fig3, ref.label=c("ch1","ch2","chunk1","chunk2"), fig.cap = "Figure 3. Correlation coeffcients", echo=FALSE----
rc.plot.area(size=0.9)
chrom.alias=1:nrow(cyto)
names(chrom.alias)=cyto$Chr
rc.plot.ideogram(track.ids=1:2, plot.band=FALSE, plot.chromosome.id=TRUE, cex.text=1.0, chrom.alias=chrom.alias, track.border=NA)
Rank=data.frame(cyto[,c("Chr","Start","End")], Score=Modules$Score, stringsAsFactors=FALSE)
rc.plot.histogram(Rank, track.id=4, data.col="Score", fixed.height=FALSE, custom.track.height=params$track.height*3, track.border=NA)
eigenCorCols=colnames(Modules)[grep("Rho",colnames(Modules))] #select columns with pattern Rho
maxCorr=1 #set maximum correlation coefficient
track.border="#999999"
track.color="white"
track.num=4
for(eigenCorCol in eigenCorCols){
	track.num <- track.num+1
	data.col <- 4
	color.col <- 5
	HistData=data.frame(Chr=Modules$id,Start=1,End=100,Data=Modules[,eigenCorCol],
		stringsAsFactors=FALSE)
	#plot positive correlation
	HistData1=HistData[HistData$Data > 0,]
	HistData1$col=colfuncBrown(nCol)[pmax(1,floor(HistData1[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData1, track.num, data.col, color.col=color.col,
		fixed.height=TRUE, track.color=track.color, track.border=track.border)
	#plot negative correlation
	HistData2=HistData[HistData$Data <= 0,]
	HistData2$Data=abs(HistData2$Data)
	HistData2$col=colfuncBlue(nCol)[pmax(1,floor(HistData2[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData2, track.num, data.col, color.col=color.col, fixed.height=TRUE,
		track.border=track.border)
}

## ----chunk3, eval=FALSE--------------------------------------------------
#  y.cor=rc.get.coordinates(1,1,1)$y[1]-1
#  x.cor=params$radius*0.8
#  bht=0.6
#  bwt=0.2
#  rc.plot.grColLegend(x.cor, y.cor, colfuncBrown(nCol), at=c(1,floor(nCol/2),nCol),
#  	legend=signif(c(0,maxCorr/2,maxCorr),2), title=expression(italic(r)),
#  	width=bwt,height=bht, cex.text=0.8)
#  rc.plot.grColLegend(x.cor, y.cor-bht, rev(colfuncBlue(nCol)), at=c(0,floor(nCol/2)),
#  	legend=signif(c(-maxCorr,-maxCorr/2),2), title="", width=bwt, height=bht, cex.text=0.8)

## ----fig4, ref.label=c("ch1","ch2","chunk1","chunk2","chunk3"), fig.cap = "Figure 4. Color gradient legend for correlations", echo=FALSE----
rc.plot.area(size=0.9)
chrom.alias=1:nrow(cyto)
names(chrom.alias)=cyto$Chr
rc.plot.ideogram(track.ids=1:2, plot.band=FALSE, plot.chromosome.id=TRUE, cex.text=1.0, chrom.alias=chrom.alias, track.border=NA)
Rank=data.frame(cyto[,c("Chr","Start","End")], Score=Modules$Score, stringsAsFactors=FALSE)
rc.plot.histogram(Rank, track.id=4, data.col="Score", fixed.height=FALSE, custom.track.height=params$track.height*3, track.border=NA)
eigenCorCols=colnames(Modules)[grep("Rho",colnames(Modules))] #select columns with pattern Rho
maxCorr=1 #set maximum correlation coefficient
track.border="#999999"
track.color="white"
track.num=4
for(eigenCorCol in eigenCorCols){
	track.num <- track.num+1
	data.col <- 4
	color.col <- 5
	HistData=data.frame(Chr=Modules$id,Start=1,End=100,Data=Modules[,eigenCorCol],
		stringsAsFactors=FALSE)
	#plot positive correlation
	HistData1=HistData[HistData$Data > 0,]
	HistData1$col=colfuncBrown(nCol)[pmax(1,floor(HistData1[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData1, track.num, data.col, color.col=color.col,
		fixed.height=TRUE, track.color=track.color, track.border=track.border)
	#plot negative correlation
	HistData2=HistData[HistData$Data <= 0,]
	HistData2$Data=abs(HistData2$Data)
	HistData2$col=colfuncBlue(nCol)[pmax(1,floor(HistData2[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData2, track.num, data.col, color.col=color.col, fixed.height=TRUE,
		track.border=track.border)
}
y.cor=rc.get.coordinates(1,1,1)$y[1]-1
x.cor=params$radius*0.8
bht=0.6
bwt=0.2
rc.plot.grColLegend(x.cor, y.cor, colfuncBrown(nCol), at=c(1,floor(nCol/2),nCol),
	legend=signif(c(0,maxCorr/2,maxCorr),2), title=expression(italic(r)),
	width=bwt,height=bht, cex.text=0.8)
rc.plot.grColLegend(x.cor, y.cor-bht, rev(colfuncBlue(nCol)), at=c(0,floor(nCol/2)),
	legend=signif(c(-maxCorr,-maxCorr/2),2), title="", width=bwt, height=bht, cex.text=0.8)

## ----chunk4, eval=FALSE--------------------------------------------------
#  track.num=track.num+1
#  heatmapData=t(Modules[,grep("Enrichment.*.Pvalue",colnames(Modules))])
#  colnames(heatmapData)=Modules$id
#  #convert P value to -log10 scale
#  heatmapData[,]=as.integer(-log(heatmapData+1.0e-320,base=10))
#  #cap the maximum -log10 P value so that there is a richer color pattern
#  maxLogPval=25
#  heatmapData[heatmapData>maxLogPval]=maxLogPval
#  #
#  rc.plot.heatmap(heatmapData, track.num, color.gradient=colfuncHeat(nCol),
#  		track.color=track.color, track.border=track.border)
#  track.num=track.num+nrow(heatmapData)

## ----fig5, ref.label=c("ch1","ch2","chunk1","chunk2","chunk3","chunk4"), fig.cap = "Figure 5. Enrichment for gene signatures", echo=FALSE----
rc.plot.area(size=0.9)
chrom.alias=1:nrow(cyto)
names(chrom.alias)=cyto$Chr
rc.plot.ideogram(track.ids=1:2, plot.band=FALSE, plot.chromosome.id=TRUE, cex.text=1.0, chrom.alias=chrom.alias, track.border=NA)
Rank=data.frame(cyto[,c("Chr","Start","End")], Score=Modules$Score, stringsAsFactors=FALSE)
rc.plot.histogram(Rank, track.id=4, data.col="Score", fixed.height=FALSE, custom.track.height=params$track.height*3, track.border=NA)
eigenCorCols=colnames(Modules)[grep("Rho",colnames(Modules))] #select columns with pattern Rho
maxCorr=1 #set maximum correlation coefficient
track.border="#999999"
track.color="white"
track.num=4
for(eigenCorCol in eigenCorCols){
	track.num <- track.num+1
	data.col <- 4
	color.col <- 5
	HistData=data.frame(Chr=Modules$id,Start=1,End=100,Data=Modules[,eigenCorCol],
		stringsAsFactors=FALSE)
	#plot positive correlation
	HistData1=HistData[HistData$Data > 0,]
	HistData1$col=colfuncBrown(nCol)[pmax(1,floor(HistData1[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData1, track.num, data.col, color.col=color.col,
		fixed.height=TRUE, track.color=track.color, track.border=track.border)
	#plot negative correlation
	HistData2=HistData[HistData$Data <= 0,]
	HistData2$Data=abs(HistData2$Data)
	HistData2$col=colfuncBlue(nCol)[pmax(1,floor(HistData2[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData2, track.num, data.col, color.col=color.col, fixed.height=TRUE,
		track.border=track.border)
}
y.cor=rc.get.coordinates(1,1,1)$y[1]-1
x.cor=params$radius*0.8
bht=0.6
bwt=0.2
rc.plot.grColLegend(x.cor, y.cor, colfuncBrown(nCol), at=c(1,floor(nCol/2),nCol),
	legend=signif(c(0,maxCorr/2,maxCorr),2), title=expression(italic(r)),
	width=bwt,height=bht, cex.text=0.8)
rc.plot.grColLegend(x.cor, y.cor-bht, rev(colfuncBlue(nCol)), at=c(0,floor(nCol/2)),
	legend=signif(c(-maxCorr,-maxCorr/2),2), title="", width=bwt, height=bht, cex.text=0.8)
track.num=track.num+1
heatmapData=t(Modules[,grep("Enrichment.*.Pvalue",colnames(Modules))])
colnames(heatmapData)=Modules$id
#convert P value to -log10 scale
heatmapData[,]=as.integer(-log(heatmapData+1.0e-320,base=10))
#cap the maximum -log10 P value so that there is a richer color pattern
maxLogPval=25
heatmapData[heatmapData>maxLogPval]=maxLogPval
#
rc.plot.heatmap(heatmapData, track.num, color.gradient=colfuncHeat(nCol),
		track.color=track.color, track.border=track.border)
track.num=track.num+nrow(heatmapData)

## ----chunk5, eval=FALSE--------------------------------------------------
#  rc.plot.grColLegend(x.cor+0.8, y.cor-bht, colfuncHeat(nCol), at=c(1,floor(nCol/2),nCol),
#  	legend=signif(c(0,maxLogPval/2,maxLogPval),2), title=expression(paste(-log[10],"(P)")),
#  	width=bwt, height=2*bht, cex.text=0.8)

## ----fig6, ref.label=c("ch1","ch2","chunk1","chunk2","chunk3","chunk4","chunk5"), fig.cap = "Figure 6. Color gradient legend for enrichment", echo=FALSE----
rc.plot.area(size=0.9)
chrom.alias=1:nrow(cyto)
names(chrom.alias)=cyto$Chr
rc.plot.ideogram(track.ids=1:2, plot.band=FALSE, plot.chromosome.id=TRUE, cex.text=1.0, chrom.alias=chrom.alias, track.border=NA)
Rank=data.frame(cyto[,c("Chr","Start","End")], Score=Modules$Score, stringsAsFactors=FALSE)
rc.plot.histogram(Rank, track.id=4, data.col="Score", fixed.height=FALSE, custom.track.height=params$track.height*3, track.border=NA)
eigenCorCols=colnames(Modules)[grep("Rho",colnames(Modules))] #select columns with pattern Rho
maxCorr=1 #set maximum correlation coefficient
track.border="#999999"
track.color="white"
track.num=4
for(eigenCorCol in eigenCorCols){
	track.num <- track.num+1
	data.col <- 4
	color.col <- 5
	HistData=data.frame(Chr=Modules$id,Start=1,End=100,Data=Modules[,eigenCorCol],
		stringsAsFactors=FALSE)
	#plot positive correlation
	HistData1=HistData[HistData$Data > 0,]
	HistData1$col=colfuncBrown(nCol)[pmax(1,floor(HistData1[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData1, track.num, data.col, color.col=color.col,
		fixed.height=TRUE, track.color=track.color, track.border=track.border)
	#plot negative correlation
	HistData2=HistData[HistData$Data <= 0,]
	HistData2$Data=abs(HistData2$Data)
	HistData2$col=colfuncBlue(nCol)[pmax(1,floor(HistData2[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData2, track.num, data.col, color.col=color.col, fixed.height=TRUE,
		track.border=track.border)
}
y.cor=rc.get.coordinates(1,1,1)$y[1]-1
x.cor=params$radius*0.8
bht=0.6
bwt=0.2
rc.plot.grColLegend(x.cor, y.cor, colfuncBrown(nCol), at=c(1,floor(nCol/2),nCol),
	legend=signif(c(0,maxCorr/2,maxCorr),2), title=expression(italic(r)),
	width=bwt,height=bht, cex.text=0.8)
rc.plot.grColLegend(x.cor, y.cor-bht, rev(colfuncBlue(nCol)), at=c(0,floor(nCol/2)),
	legend=signif(c(-maxCorr,-maxCorr/2),2), title="", width=bwt, height=bht, cex.text=0.8)
track.num=track.num+1
heatmapData=t(Modules[,grep("Enrichment.*.Pvalue",colnames(Modules))])
colnames(heatmapData)=Modules$id
#convert P value to -log10 scale
heatmapData[,]=as.integer(-log(heatmapData+1.0e-320,base=10))
#cap the maximum -log10 P value so that there is a richer color pattern
maxLogPval=25
heatmapData[heatmapData>maxLogPval]=maxLogPval
#
rc.plot.heatmap(heatmapData, track.num, color.gradient=colfuncHeat(nCol),
		track.color=track.color, track.border=track.border)
track.num=track.num+nrow(heatmapData)
rc.plot.grColLegend(x.cor+0.8, y.cor-bht, colfuncHeat(nCol), at=c(1,floor(nCol/2),nCol),
	legend=signif(c(0,maxLogPval/2,maxLogPval),2), title=expression(paste(-log[10],"(P)")),
	width=bwt, height=2*bht, cex.text=0.8)

## ----chunk6, eval=FALSE--------------------------------------------------
#  rc.plot.track.id(4, labels=1, col="black", custom.track.height=params$track.height*2, cex=0.8)
#  rc.plot.track.id(seq(7, track.num-1,by=3), labels=seq(7,track.num-1,by=3)-3, col="black", cex=0.8)

## ----fig7, ref.label=c("ch1","ch2","chunk1","chunk2","chunk3","chunk4","chunk5","chunk6"), fig.cap = "Figure 7. A circular plot visualizing the complex properties of gene coexpression network modules.", echo=FALSE----
rc.plot.area(size=0.9)
chrom.alias=1:nrow(cyto)
names(chrom.alias)=cyto$Chr
rc.plot.ideogram(track.ids=1:2, plot.band=FALSE, plot.chromosome.id=TRUE, cex.text=1.0, chrom.alias=chrom.alias, track.border=NA)
Rank=data.frame(cyto[,c("Chr","Start","End")], Score=Modules$Score, stringsAsFactors=FALSE)
rc.plot.histogram(Rank, track.id=4, data.col="Score", fixed.height=FALSE, custom.track.height=params$track.height*3, track.border=NA)
eigenCorCols=colnames(Modules)[grep("Rho",colnames(Modules))] #select columns with pattern Rho
maxCorr=1 #set maximum correlation coefficient
track.border="#999999"
track.color="white"
track.num=4
for(eigenCorCol in eigenCorCols){
	track.num <- track.num+1
	data.col <- 4
	color.col <- 5
	HistData=data.frame(Chr=Modules$id,Start=1,End=100,Data=Modules[,eigenCorCol],
		stringsAsFactors=FALSE)
	#plot positive correlation
	HistData1=HistData[HistData$Data > 0,]
	HistData1$col=colfuncBrown(nCol)[pmax(1,floor(HistData1[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData1, track.num, data.col, color.col=color.col,
		fixed.height=TRUE, track.color=track.color, track.border=track.border)
	#plot negative correlation
	HistData2=HistData[HistData$Data <= 0,]
	HistData2$Data=abs(HistData2$Data)
	HistData2$col=colfuncBlue(nCol)[pmax(1,floor(HistData2[,data.col]*nCol/maxCorr))]
	rc.plot.histogram(HistData2, track.num, data.col, color.col=color.col, fixed.height=TRUE,
		track.border=track.border)
}
y.cor=rc.get.coordinates(1,1,1)$y[1]-1
x.cor=params$radius*0.8
bht=0.6
bwt=0.2
rc.plot.grColLegend(x.cor, y.cor, colfuncBrown(nCol), at=c(1,floor(nCol/2),nCol),
	legend=signif(c(0,maxCorr/2,maxCorr),2), title=expression(italic(r)),
	width=bwt,height=bht, cex.text=0.8)
rc.plot.grColLegend(x.cor, y.cor-bht, rev(colfuncBlue(nCol)), at=c(0,floor(nCol/2)),
	legend=signif(c(-maxCorr,-maxCorr/2),2), title="", width=bwt, height=bht, cex.text=0.8)
track.num=track.num+1
heatmapData=t(Modules[,grep("Enrichment.*.Pvalue",colnames(Modules))])
colnames(heatmapData)=Modules$id
#convert P value to -log10 scale
heatmapData[,]=as.integer(-log(heatmapData+1.0e-320,base=10))
#cap the maximum -log10 P value so that there is a richer color pattern
maxLogPval=25
heatmapData[heatmapData>maxLogPval]=maxLogPval
#
rc.plot.heatmap(heatmapData, track.num, color.gradient=colfuncHeat(nCol),
		track.color=track.color, track.border=track.border)
track.num=track.num+nrow(heatmapData)
rc.plot.grColLegend(x.cor+0.8, y.cor-bht, colfuncHeat(nCol), at=c(1,floor(nCol/2),nCol),
	legend=signif(c(0,maxLogPval/2,maxLogPval),2), title=expression(paste(-log[10],"(P)")),
	width=bwt, height=2*bht, cex.text=0.8)
rc.plot.track.id(4, labels=1, col="black", custom.track.height=params$track.height*2, cex=0.8)
rc.plot.track.id(seq(7, track.num-1,by=3), labels=seq(7,track.num-1,by=3)-3, col="black", cex=0.8)

