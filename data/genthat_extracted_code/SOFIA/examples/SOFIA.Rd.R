library(SOFIA)


### Name: SOFIA
### Title: Making Sofisticated and Aesthetical Figures in R
### Aliases: SOFIA

### ** Examples

# Loading data contained in mark0
data(mark0)
str(mark0)

# Making the dataframe data with the variables map, chr, pos and locus
data1<-data.frame(map=mark0$map,chr=mark0$lg,pos=mark0$consensus,locus=mark0$marker)

##### Adding numeric and text variables to plot in the figure

# text plot
data1$someNames<-data1$locus
data1$someNames[sample(1:10000,9000)]<-NA

# Plotting a heatmap with only two colors (black for marker presence and white for marker absence.
# The colors are defined later). 
# By using this trick, a karyotype-like plot can be obtained.
data1$kar<-data1$pos

# Random numeric data
data1$lod1<--log10(mark0$b)
data1$lod2<-sample(data1$lod1)
data1$lod3<-rev(data1$lod1)


# Until here, we added five columns with numeric and text data to the dataframe data1. Now, we
# have to work in other arguments related with general and specific figure configuration. 


# Defining the location of each plot (5 plots total).
# In this case, the first plot is going to be in the position 0.90-0.99, the second in the 
# position 0.88-0.90, and so on. 

plotLocation<-data.frame(r0=c(0.90,.88,.78,.68,.58),r1=c(.99,.9,.87,.77,.67)) 

# Defining the background for the 5 plots. 
# In this case, the first two plots are not going to have a 
# background. All plots are going to have horizontal lines spaced at 5 units and colored vvlgrey. 


plotBackground<-data.frame(backgroundShow=c(FALSE,FALSE,TRUE,TRUE,TRUE), 
backgroundColor=rep('vvlgrey',5),axisShow=rep(TRUE,5),axisSep=rep(4,5))


# Defining the overall configuration for the figure. 
# In this example, Figure 2 has two genetic maps; the chromosomes for map 1 are 
# going to be ordered 
# from 1 to 12, while map 2 is going to have its chromosomes in order 9 to 1. 
# In addition, the argument rev is going to flag
# all chromosomes in map 2 to be reversed. Finally, chromosomes in map 1 are going 
# to be colored with two different 
# blue colors (vvdblue_a3 and lblue_a3), while map two is going to have all 
# chromosomes colored with a single color (dgreen).  



chromoConfiguration<-data.frame(order=c(1:12,9:1),map=c(rep(1,12),rep(2,9)),
rev=c(rep(FALSE,12),rep(TRUE,9)),color=c(rep(c('vvdblue_a3','lblue_a3'),6),rep('dgreen',9)),
radius=rep(1,21))



# Defining marker colors. 
# For the first plot, the text lables are going to be black colored; for the second plot, 
# the presence of numberic data is going to be colored with black (for traditional 
# heatmaps with multiple colors, a color palette, 
# such as reds-9-seq, has to be defined); for the third plot, 
# the color 'chr' tells SOFIA to use the color of the chromosome bar corresponding 
# to the markers location; for the forth plot, the markers are 
# going to be colored using the palette piyg-11-div (markers are colored 
# based on their values); the fifth line plot is going to be red colored (dred_a3).

plotType<-c('text','heatmap',rep('scatter',2),'line')

# defining marker colors. For the first plot, the letters are going to be black, 
# for the second plot, the presence of numberic data is going to be colored with 
# black (for traditional heatmaps with multiple colors, a color palette has to be defined), 
# for the third plot, the color 'chr' tells SOFIA to use the color of the chromosome where 
# the marker is located, for the forth plot, the markers are going to be colored using the 
# palette piyg-11-div (higher and lower values are going to have different colors), and 
# the fifth line plot is going to be colored with dark red.

plotColor<-c('black','black','chr','piyg-11-div','dred_a3')

# Defining marker size. 
# For the text plot, the marker size defines the text size. 
# For scatter, it defines the circle size while for line plots, it defines the line thickness. 
# For heatmaps, any random number can be included since it is not used at all. 

markerSize<-c(8,10,16,16,1)

# Please change the argument circosLocation

SOFIA(data=data1,linkColor='chr',linkGeometry=c(.001,.1),linkRadius=c(.57,.57),
linksFlag=TRUE,chromoConfiguration=chromoConfiguration,plotBackground=plotBackground,
plotLocation=plotLocation,plotType=plotType,plotColor=plotColor,markerSize=markerSize,
circosLocation=NULL,tickSuffix='cM',returnConf=TRUE,circosDisplay=TRUE,
deleteData=TRUE,runCircos=TRUE,confName='circos.conf')




