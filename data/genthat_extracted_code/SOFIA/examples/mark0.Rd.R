library(SOFIA)


### Name: mark0
### Title: Genetic maps to be used as examples for generating Circos
###   figures
### Aliases: mark0

### ** Examples

# loading data contained in mark0
# data(mark0)
# str(mark0)

# making the dataframe data with the variables map, chr, pos and locus
# data1<-data.frame(map=mark0$map,chr=mark0$lg,pos=mark0$consensus,locus=mark0$marker)

##### adding variables to plot
# plotting text
# data1$someNames<-data1$locus
# data1$someNames[sample(1:10000,9000)]<-NA

# plotting a heatmap with only two colors (black and white for marker presence and absence,
# respectively). 
# This plot gives a karyotype plot 
# data1$kar<-data1$pos

# more random data
# data1$lod1<--log10(mark0$b)
# data1$lod2<-sample(data1$lod1)
# data1$lod3<-rev(data1$lod1)

# defining the location of each plot (5 plots total)
# plotLocation<-data.frame(r0=c(0.90,.88,.78,.68,.58),r1=c(.99,.9,.87,.77,.67)) 
# in this case, the first plot is going to be in the position 0.90-0.99, the second in the 
# position 0.88-0.90, and so on. 

# defining the background for the 5 plots. In this case, the first two plots are not going to have 
# background. All plot are going to have horizontal axes spaced at 5 units. 
# plotBackground<-data.frame(backgroundShow=c(FALSE,FALSE,TRUE,TRUE,TRUE), 
# backgroundColor=rep('vvlgrey',5),axisShow=rep(TRUE,5),axisSep=rep(4,5))

# defining the overall configuration for the figure. In this case, there are two maps, 
# the chromosomes for map 1 are going to be ordered from 1 to 12, however map 2 is going 
# to have its chromosomes in order 9 to 1. In addition, the argument rev is going to 
# reverse chromosomes for map 1. Finally, map 1 is going to have two different 
# kind of blues (lblue_a3 and vvdblue_a3, which mieans light blue for the first one,
# and very very dark blue for the second; a3 is a degree of transparency) for their 
# chromosomes, while the map two is going to be all dark green.  
# chromoConfiguration<-data.frame(order=c(1:12,9:1),map=c(rep(1,12),rep(2,9)),
# rev=c(rep(FALSE,12),rep(TRUE,9)),color=c(rep(c('vvdblue_a3','lblue_a3'),6),rep('dgreen',9)),
# radius=rep(1,21))

# defining plot types
# plotType<-c('text','heatmap',rep('scatter',2),'line')

# defining marker colors. For the first plot, the letters are going to be black, 
# for the second plot, the presence of numberic data is going to be colored with 
# black (for traditional heatmaps with multiple colors, a color palette has to be defined), 
# for the third plot, the color 'chr' tells SOFIA to use the color of the chromosome where 
# the marker is located, for the forth plot, the markers are going to be colored using the 
# palette piyg-11-div (higher and lower values are going to have different colors), and 
# the fifth line plot is going to be colored with dark red.
# plotColor<-c('black','black','chr','piyg-11-div','dred_a3')

# definifn marker size. For the text plot, the marker size defines the font size. 
# For scatter, it defines the circle size while for line plots, it defines the line 
# thickness. For heatmaps, any random number can be included since it is not used at all. 
# markerSize<-c(8,10,16,16,1)

# please change the argument circosLocation
# SOFIA(data=data1,linkColor='chr',linkGeometry=c(.001,.1),linkRadius=c(.57,.57),
# linksFlag=TRUE,chromoConfiguration=chromoConfiguration,plotBackground=plotBackground,
# plotLocation=plotLocation,plotType=plotType,plotColor=plotColor,markerSize=markerSize,
# circosLocation='/circos/bin',tickSuffix='cM',returnConf=TRUE,circosDisplay=FALSE)




