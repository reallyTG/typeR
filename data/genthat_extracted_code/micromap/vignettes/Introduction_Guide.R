### R code from vignette source 'Introduction_Guide.Rnw'

###################################################
### code chunk number 1: setup
###################################################
library(knitr)
# set global chunk options
opts_chunk$set(fig.path = '', fig.align = 'center', fig.show = 'hold',message = F, results = 'asis',dev = 'pdf',dev.args=list(family='serif'), fig.pos = '!ht', warning = F)
options(replace.assign=TRUE,width=60)


###################################################
### code chunk number 2: micromap-1a
###################################################
library(micromap)
data("edPov") 
head(edPov)


###################################################
### code chunk number 3: micromap-1b
###################################################
data("USstates") 
head(USstates@data)


###################################################
### code chunk number 4: micromap-1c
###################################################
statePolys <- create_map_table(USstates, IDcolumn="ST") 
head(statePolys) 


###################################################
### code chunk number 5: fig1
###################################################
mmplot(stat.data=edPov,map.data=statePolys,
  panel.types=c("labels", "dot","dot", "map"),
  panel.data=list("state","pov","ed", NA),
  ord.by="pov", grouping=5,
  median.row=T,
  map.link=c("StateAb","ID"),
  print.file="fig1.jpeg",print.res=300
) 


###################################################
### code chunk number 6: micromap-1d (eval = FALSE)
###################################################
## list(1, align="left")
## list(2, graph.bgcolor="lightgray")
## list(3, graph.bgcolor="lightgray")


###################################################
### code chunk number 7: micromap-1e (eval = FALSE)
###################################################
## list(list(1, align="left"), list(2, graph.bgcolor="lightgray"), 
##      list(3, graph.bgcolor="lightgray"))


###################################################
### code chunk number 8: fig2
###################################################
mmplot(stat.data=edPov, map.data=statePolys,
panel.types=c("labels", "dot", "dot","map"),
panel.data=list("state","pov","ed", NA),
ord.by="pov", grouping=5,
median.row=T,
map.link=c("StateAb","ID"),
plot.height=9,
colors=c("red","orange","green","blue","purple"),
panel.att=list(list(1, header="States",
panel.width=.8, 
align="left", text.size=.9),
list(2, header="Percent Living Below \n Poverty Level",
graph.bgcolor="lightgray", point.size=1.5,
xaxis.ticks=list(10,15,20), xaxis.labels=list(10,15,20),
xaxis.title="Percent"),
list(3, header="Percent Adults With\n4+ Years of College",
graph.bgcolor="lightgray", point.size=1.5,
xaxis.ticks=list(20,30,40), xaxis.labels=list(20,30,40),
xaxis.title="Percent"),
list(4, header="Light Gray Means\nHighlighted Above",
inactive.fill="lightgray",
inactive.border.color=gray(.7), inactive.border.size=2,
panel.width=.8)), print.file="fig2.jpeg", 
print.res=300) 


###################################################
### code chunk number 9: fig3
###################################################
mmplot(stat.data=edPov,map.data=statePolys,
panel.types=c("dot_legend","labels","dot","dot","map"),
panel.data=list(NA,"state","pov","ed",NA),
map.link=c("StateAb","ID"),
ord.by="pov", 
grouping=5, 
median.row=T,
plot.height=9, 
colors=c("red","orange","green","blue","purple"),
panel.att=list(list(1, point.type=20, point.border=TRUE),
list(2, header="States", panel.width=.8, 
align="left", text.size=.9),
list(3, header="Percent Living Below\nPoverty Level",
graph.bgcolor="lightgray", point.size=1.5,
xaxis.ticks=list(10,15,20), xaxis.labels=list(10,15,20),
xaxis.title="Percent"),
list(4, header="Percent Adults With\n4+ Years of College",
graph.bgcolor="lightgray", point.size=1.5,
xaxis.ticks=list(20,30,40), xaxis.labels=list(20,30,40), 
xaxis.title="Percent", left.margin=-.8, right.margin=0),
list(5, header="Light Gray Means\nHighlighted Above",
inactive.fill="lightgray",     
inactive.border.color=gray(.7), inactive.border.size=2, 
panel.width=.8)),
print.file="fig3.jpeg",print.res=300)


###################################################
### code chunk number 10: fig4
###################################################
mmplot(stat.data=edPov,map.data=statePolys,
panel.types=c("map","dot_legend","labels","dot","dot"),
panel.data=list(NA,NA,"state","pov","ed"),
map.link=c("StateAb","ID"),
ord.by="pov", 
grouping=5, 
median.row=T,
plot.height=9, 
colors=c("red","orange","green","blue","purple"),
panel.att=list(list(2, point.type=20,
point.border=TRUE),
list(3, header="States", panel.width=.8, 
align="left", text.size=.9),
list(4, header="Percent Living Below\nPoverty Level",
graph.bgcolor="lightgray", point.size=1.5,
xaxis.ticks=list(10,15,20), xaxis.labels=list(10,15,20),
xaxis.title="Percent"),
list(5, header="Percent Adults With\n4+ Years of College",
graph.bgcolor="lightgray", point.size=1.5,
xaxis.ticks=list(20,30,40), xaxis.labels=list(20,30,40), 
xaxis.title="Percent"),
list(1, header="Light Gray Means\nHighlighted Above",
inactive.fill="lightgray",     
inactive.border.color=gray(.7), inactive.border.size=2, 
panel.width=.8)),
print.file="fig4.jpeg",print.res=300)


###################################################
### code chunk number 11: micromap-3a
###################################################
# The download.file command may or may not work depending on firewall settings.  # If it fails, then download the file from the ftp directory to a local directory # manually.
load(file = 'txeco.RData')
plot(txeco)

# Create an ID column in your spatial dataframe for the 
# create_map_table function
txeco$ID <- txeco$US_L3CODE
# Load the maptools library
library(maptools)
txeco1<-thinnedSpatialPoly(txeco,tolerance=7000, minarea=0.001,
topologyPreserve = F, avoidGEOS = T)
plot(txeco1)

# Alternatively, load the rgeos library
library(rgeos)
txeco2 <- gSimplify(txeco, 7000, topologyPreserve=T)
txeco2<-SpatialPolygonsDataFrame(txeco2, txeco@data)
# Notice the difference in resolution, particularly along 
# the southeastern coastline, before and after thinning using rgeos.
plot(txeco2)


###################################################
### code chunk number 12: micromap-5a
###################################################
data(lungMort)
myStats <- lungMort
head(myStats)


###################################################
### code chunk number 13: micromap-5b
###################################################
myStats <- subset(myStats, !StateAb=="DC")


###################################################
### code chunk number 14: micromap-5c
###################################################
myNewStats <- create_DF_rank(myStats, ord.by="Rate_00", group=5)
head(myNewStats)


###################################################
### code chunk number 15: fig5
###################################################
library(ggplot2)
library(grid)
### ggplot2 code:
ggplot(myNewStats) +
  geom_segment(aes(x=Rate_95, y=-pGrpOrd,
  xend=Rate_00, yend=-pGrpOrd, colour=factor(color)),
  arrow=arrow(length=unit(0.1,"cm"))) +
  facet_grid(pGrp~., scales="free_y") +
  scale_colour_manual(values=c("red","orange","green","blue","purple"),
  guide="none")
ggsave(file="fig5.jpeg", dpi=300)


###################################################
### code chunk number 16: micromap-5e
###################################################
myAtts <- sample_att()
myNumber <- 1


###################################################
### code chunk number 17: micromap-5f
###################################################
myAtts$colors <- c("red","orange","green","blue","purple")
myAtts[[myNumber]]$panel.data <- c("Rate_95","Rate_00")


###################################################
### code chunk number 18: micromap-5g
###################################################
myColors <- myAtts$colors 
  # pulls color out of the plot level 
  # section of the "myAtts" attributes list
myColumns <- myAtts[[myNumber]]$panel.data 
  # looks in the panel level section numbered 
  # "myNumber" of the "myAtts" attributes list


###################################################
### code chunk number 19: micromap-5h
###################################################
myNewStats$data1 <- myNewStats[, myColumns[1]]
myNewStats$data2 <- myNewStats[, myColumns[2]]
myPanel <- ggplot(myNewStats) +
  geom_segment(aes(x=data1, y=-pGrpOrd,
  xend= data2, yend=-pGrpOrd, colour=factor(color)),
  arrow=arrow(length=unit(0.1,"cm"))) +
  facet_grid(pGrp~.) +
  scale_colour_manual(values=myColors,
  guide="none")
myPanel


###################################################
### code chunk number 20: fig6
###################################################
assimilatePlot(myPanel, myNumber, myAtts)
ggsave(file="fig6.jpeg", dpi=300)


###################################################
### code chunk number 21: micromap-5j
###################################################
arrow_plot_build <- function(myPanel, myNumber, myNewStats, myAtts){
  myColors <- myAtts$colors
  myColumns <- myAtts[[myNumber]]$panel.data
  myNewStats$data1 <- myNewStats[, myColumns[1]]
  myNewStats$data2 <- myNewStats[, myColumns[2]]
  myPanel <- ggplot(myNewStats) +
  geom_segment(aes(x=data1, y=-pGrpOrd,
  xend= data2, yend=-pGrpOrd,
  colour=factor(color)),
  arrow=arrow(length=unit(0.1,"cm"))) +
  facet_grid(pGrp~.) +
  scale_colour_manual(values=myColors, guide="none")
  myPanel <- assimilatePlot(myPanel, myNumber, myAtts)
  }
myPanel


###################################################
### code chunk number 22: micromap-5k
###################################################
arrow_plot_build <- function(myPanel, myNumber, myNewStats, myAtts){
  myColors <- myAtts$colors
  myColumns <- myAtts[[myNumber]]$panel.data
  myNewStats$data1 <- myNewStats[, myColumns[1]]
  myNewStats$data2 <- myNewStats[, myColumns[2]]
  myNewStats <- alterForMedian(myNewStats, myAtts)
  myPanel <- ggplot(myNewStats) +
  geom_segment(aes(x=data1, y=-pGrpOrd,
  xend= data2, yend=-pGrpOrd,
  colour=factor(color)),
  arrow=arrow(length=unit(0.1,"cm"))) +
  facet_grid(pGrp~., space="free", scales="free_y") +
  scale_colour_manual(values=myColors, guide="none")
  myPanel <- assimilatePlot(myPanel, myNumber, myAtts)
  }
myPanel


###################################################
### code chunk number 23: micromap-5l
###################################################
myPanelAtts <- standard_att()
myPanelAtts <- append(myPanelAtts,
list(line.width=1, tip.length=1))


###################################################
### code chunk number 24: micromap-5m
###################################################
arrow_plot_att <- function(){
  myPanelAtts <- standard_att()
  myPanelAtts <- append(myPanelAtts,
  list(line.width=1, tip.length=1))
}


###################################################
### code chunk number 25: micromap-5n
###################################################
arrow_plot_build <- function(myPanel, myNumber, myNewStats, myAtts){
  myColors <- myAtts$colors
  myColumns <- myAtts[[myNumber]]$panel.data
  myLineWidth <- myAtts[[myNumber]]$line.width 
  # Again, note that these are stored in the panel level section of the
  myTipLength <- myAtts[[myNumber]]$tip.length # attributes object
  myNewStats$data1 <- myNewStats[, myColumns[1]]
  myNewStats$data2 <- myNewStats[, myColumns[2]]
  myNewStats <- alterForMedian(myNewStats, myAtts)
  myPanel <- ggplot(myNewStats) +
  geom_segment(aes(x=data1, y=-pGrpOrd,
  xend= data2, yend=-pGrpOrd,
  colour=factor(color)),
  arrow=arrow(length=unit(0.1*myTipLength,"cm")), 
  size=myLineWidth) +
  facet_grid(pGrp~., space="free", scales="free_y") +
  scale_colour_manual(values=myColors, guide="none")
  myPanel <- assimilatePlot(myPanel, myNumber, myAtts)
  }
myPanel


###################################################
### code chunk number 26: fig7
###################################################
mmplot(stat.data=myStats,
map.data=statePolys,
panel.types=c("map","labels", "arrow_plot"),
panel.data=list(NA,"State", list("Rate_95","Rate_00")),
ord.by="Rate_00",
grouping=5,
map.link=c("StateAb","ID"),
panel.att=list(list(3, line.width=1.25, tip.length=1.5)), 
print.file="fig7.jpeg", print.res=300) 


###################################################
### code chunk number 27: fig8
###################################################
data(lungMort)
myStats <- lungMort
mmplot(stat.data=myStats,
map.data=statePolys,
panel.types=c("map", "dot_legend", "labels", "dot_cl", "arrow_plot"),
panel.data=list(NA,
"points",
"State",
list("Rate_00","Lower_00","Upper_00"),
list("Rate_95","Rate_00")),
ord.by="Rate_00", grouping=5,
median.row=T,
map.link=c("StateAb","ID"),
plot.height=10,
colors=c("red","orange","green","blue","purple"),
panel.att=list(list(1, header="Light Gray Means\n Highlighted Above",
map.all=TRUE,
fill.regions="two ended",
inactive.fill="lightgray",                    
inactive.border.color=gray(.7),
inactive.border.size=2,
panel.width=1),
list(2, point.type=20,
point.border=TRUE),
list(3, header="U.S. \nStates ",
panel.width=.8,
align="left", text.size=.9),
list(4, header="State 2000\n Rate and 95% CI",
graph.bgcolor="lightgray",
xaxis.ticks=list(20,30,40,50),
xaxis.labels=list(20,30,40,50),
xaxis.title="Deaths per 100,000"),
list(5, header="State Rate Change\n 1995-99 to 2000-04",
line.width=1.25, tip.length=1.5,
graph.bgcolor="lightgray",
xaxis.ticks=list(20,30,40,50),
xaxis.labels=list(20,30,40,50),
xaxis.title="Deaths per 100,000")),
print.file="fig8.jpeg", print.res=300) 


###################################################
### code chunk number 28: micromap-6a
###################################################
library(micromap)
data("vegCov")
head(vegCov, n = 9)


###################################################
### code chunk number 29: micromap-6b
###################################################
data("WSA3")
print(WSA3@data)


###################################################
### code chunk number 30: micromap-6c
###################################################
wsa.polys<-create_map_table(WSA3)
head(wsa.polys)


###################################################
### code chunk number 31: micrmap-6d
###################################################
national.polys<-subset(wsa.polys, hole==0 & plug==0)
national.polys<-transform(national.polys, ID="National", region=4,
poly=region*1000 + poly)
head(national.polys)
wsa.polys<-rbind(wsa.polys,national.polys)
head(wsa.polys)
str(wsa.polys)


###################################################
### code chunk number 32: fig9
###################################################
mmgroupedplot(stat.data=vegCov,
map.data=wsa.polys,
panel.types=c("map", "labels", "bar_cl", "bar_cl"),
panel.data=list(NA,"Category",
list("Estimate.P","LCB95Pct.P","UCB95Pct.P"),
list("Estimate.U","LCB95Pct.U","UCB95Pct.U")),
grp.by="Subpopulation",
cat="Category",
map.link=c("Subpopulation", "ID"),
print.file="fig9.jpeg",print.res=300)


###################################################
### code chunk number 33: fig10
###################################################
mmgroupedplot(stat.data= vegCov,
map.data= wsa.polys,
panel.types=c("map", "labels", "bar_cl", "bar_cl"),
panel.data=list(NA,"Category",
list("Estimate.P","LCB95Pct.P","UCB95Pct.P"),
list("Estimate.U","LCB95Pct.U","UCB95Pct.U")),
grp.by="Subpopulation",
cat="Category",
colors=c("red3","green3","lightblue"),
map.link=c("Subpopulation", "ID"),
map.color="orange3",
plot.grp.spacing=2,
plot.width=7,
plot.height=4,
panel.att=list(list(1, header="Region", header.size=1.5,
panel.width=.75),
list(2, header="Category",
header.size=1.5,
panel.width=1.9),
list(3, header="Percent", header.size=1.5,
graph.bgcolor="lightgray",
xaxis.title="percent",
xaxis.ticks=list(0,20,40,60),
xaxis.labels=list(0,20,40,60)),
list(4, header="Unit", header.size=1.5,
graph.bgcolor="lightgray",
xaxis.title="thousands",
xaxis.ticks=list(0,200000,350000,550000),
xaxis.labels=list(0,200,350,550))),
print.file="fig10.jpeg",print.res=300)


