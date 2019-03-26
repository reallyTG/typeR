## ----setup, include=FALSE------------------------------------------------
# library(rgl)
# #library(rglwidget)
# setupKnitr()
# knitr::opts_chunk$set(echo = TRUE,
#                       fig.align = "center",
#                       warning = FALSE,
#                       webgl = TRUE,
#                       fig.width = 8, 
#                       fig.height = 8,
#                       fig.keep = "all",
#                       fig.ext = "jpeg"
#                       )

## ----fig.width=5, fig.height=5-------------------------------------------
library(DataVisualizations)
data("Lsun3D")
PixelMatrixPlot(Lsun3D$Data)

## ------------------------------------------------------------------------
library(DataVisualizations)
data(MTY)
InspectVariable(MTY,'MTY')


## ----fig.width=4, fig.height=4-------------------------------------------
library(DataVisualizations)
data(ITS)
data(MTY)
library(vioplot)

boxplot(ITS)
vioplot(x=ITS)

DF=data.frame(ID=1:length(ITS),ITS=ITS)
ggplot2::ggplot(DF, mapping = ggplot2::aes_string(y = 'ITS',x='ID')) + ggplot2::geom_violin(stat = "PDEdensity",fill = "black",scale='width')+ggplot2::theme_bw()+ggplot2::ylab('Range of Values')+ggplot2::xlab('PDE')

#Shortcut for several features
MTY[MTY>8000]=8000 #Disregard outliers after deeper analysis, see publication
MDplot(cbind(ITS,MTY))

## ------------------------------------------------------------------------
library(DataVisualizations)
data(ITS)
data(MTY)
Ind2=which(ITS<900&MTY<8000)
PDEscatter(ITS[Ind2],MTY[Ind2],xlab = 'ITS in EUR',ylab ='MTY in EUR' ,main='Scatter density plot using PDE' )

## ----fig.width=4, fig.height=4-------------------------------------------
data("Lsun3D")
n=nrow(Lsun3D$Data)
Data=cbind(Lsun3D$Data,runif(n),rnorm(n),rt(n,2),rlnorm(n),rchisq(100,2))
Header=c('x','y','z','uniform','gauss','t','log-normal','chi')
cc=cor(Data,method='spearman')
diag(cc)=0
PixelMatrixPlot(cc,YNames = Header,XNames = Header,main = 'Spearman Coeffs')

## ------------------------------------------------------------------------
library(DataVisualizations)
data("Lsun3D")
InspectDistances(Lsun3D$Data,method="euclidean")

## ------------------------------------------------------------------------
library(DataVisualizations)
Cls=c(1L, 1L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 1L, 1L, 1L, 2L, 2L, 2L, 
2L, 2L, 1L, 2L, 2L, 2L, 1L, 2L, 1L, 2L, 1L, 2L, 2L, 1L, 1L, 1L, 
1L, 2L, 1L, 1L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 2L, 2L, 1L, 2L, 1L, 
2L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 3L, 2L, 2L, 2L, 1L, 
2L, 1L, 1L, 2L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 
1L, 2L, 2L, 2L, 1L, 2L, 1L, 2L, 1L, 1L, 2L, 2L, 1L, 1L, 1L, 2L, 
2L, 1L, 2L, 1L, 1L, 1L, 2L, 1L, 2L, 2L, 1L, 1L, 1L, 2L, 2L, 1L, 
2L, 2L, 1L, 2L, 2L, 1L, 2L, 1L, 2L, 2L, 2L, 1L, 2L, 1L, 1L, 1L, 
2L, 1L, 1L, 2L, 1L, 1L, 2L, 2L, 1L, 2L, 1L, 1L, 1L, 2L, 2L, 2L, 
2L, 2L, 2L, 1L, 1L, 2L, 2L, 2L, 2L, 1L, 2L, 2L, 2L, 1L, 1L, 1L
)
Codes=c("AFG", "AGO", "ALB", "ARG", "ATG", "AUS", "AUT", "BDI", "BEL", 
"BEN", "BFA", "BGD", "BGR", "BHR", "BHS", "BLZ", "BMU", "BOL", 
"BRA", "BRB", "BRN", "BTN", "BWA", "CAF", "CAN", "CH2", "CHE", 
"CHL", "CHN", "CIV", "CMR", "COG", "COL", "COM", "CPV", "CRI", 
"CUB", "CYP", "DJI", "DMA", "DNK", "DOM", "DZA", "ECU", "EGY", 
"ESP", "ETH", "FIN", "FJI", "FRA", "FSM", "GAB", "GBR", "GER", 
"GHA", "GIN", "GMB", "GNB", "GNQ", "GRC", "GRD", "GTM", "GUY", 
"HKG", "HND", "HTI", "HUN", "IDN", "IND", "IRL", "IRN", "IRQ", 
"ISL", "ISR", "ITA", "JAM", "JOR", "JPN", "KEN", "KHM", "KIR", 
"KNA", "KOR", "LAO", "LBN", "LBR", "LCA", "LKA", "LSO", "LUX", 
"MAC", "MAR", "MDG", "MDV", "MEX", "MHL", "MLI", "MLT", "MNG", 
"MOZ", "MRT", "MUS", "MWI", "MYS", "NAM", "NER", "NGA", "NIC", 
"NLD", "NOR", "NPL", "NZL", "OMN", "PAK", "PAN", "PER", "PHL", 
"PLW", "PNG", "POL", "PRI", "PRT", "PRY", "ROM", "RWA", "SDN", 
"SEN", "SGP", "SLB", "SLE", "SLV", "SOM", "STP", "SUR", "SWE", 
"SWZ", "SYC", "SYR", "TCD", "TGO", "THA", "TON", "TTO", "TUN", 
"TUR", "TWN", "TZA", "UGA", "URY", "USA", "VCT", "VEN", "VNM", 
"VUT", "WSM", "ZAF", "ZAR", "ZMB", "ZWE")
plotWorldmap(Codes,Cls)

## ----fig.width=5, fig.height=5-------------------------------------------
library(DataVisualizations)
data(categoricalVariable)
fanPlot(categoricalVariable)

pieChart(categoricalVariable)

## ----warning=FALSE, comment=FALSE----------------------------------------
library(DataVisualizations)
data("Lsun3D")

Heatmap(Lsun3D$Data,Lsun3D$Cls,method = 'euclidean')

SilhouettePlot(Lsun3D$Data,Lsun3D$Cls,PlotIt = T)

## ----fig.width=4, fig.height=4,warning=FALSE-----------------------------
library(DataVisualizations)
data("Lsun3D")
Accuracy=c()
for(i in 1:100){
  Cls=kmeans(Lsun3D$Data,4,algorithm="MacQueen")$cluster
  #this is an artifical example, because the problem of arbitrary class labels is not accounted for
  #please choose an appropiate internal index or an external index
  Accuracy[i]=sum(Cls==Lsun3D$Cls)
}

DF=data.frame(ID=1:length(Accuracy),Accuracy=Accuracy)
ggplot2::ggplot(DF, mapping = ggplot2::aes_string(y = 'Accuracy',x='ID')) + ggplot2::geom_violin(stat = "PDEdensity",fill = "black")+ggplot2::theme_bw()+ggplot2::ylab('Range of Values of the Evaluation of an Algorithm')+ggplot2::xlab('Output of Evaluation of Algorithm')

