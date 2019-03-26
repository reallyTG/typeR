library(ClusteredMutations)


### Name: PD4107a
### Title: Somatic mutations data set from a primary breast cancer genome.
### Aliases: PD4107a
### Keywords: datasets

### ** Examples

data(PD4107a)

###PD4107a data set;
head(PD4107a,12)

###generate new data set with intermutational distance;
#rainfall<-imd(data=PD4107a,chr=Chr,position=Position)
###Rainfall plot for PD4107a cancer sample;
#plot(rainfall$number, rainfall$log10distance,pch=20,
#	ylab="Intermutation distance (bp)",xlab="PD4107a",yaxt="n", 
#	col=c(rep(c("black","red"),14)[rainfall$chr]))
#axis(2, at=c(0,1,2,3,4,6), labels=c("1","10","100","1000","10000","1000000"),
#	las=2, cex.axis=0.6)

###Locate the clustered mutations;
#showers(data=PD4107a,chr=Chr,position=Position)

###Visualizes a dissimilarity mutation matrix using seriation and matrix shading 
### using the method developed by Hahsler and Hornik (2011).
###Chromosome 6;
#mut.matrix <- dissmutmatrix(data=PD4107a,chr=Chr,position=Position,subset=6)
#dissplot(mut.matrix, method=NA, options=list( col = 
#  c("black","navy","blue","cyan","green","yellow","orange","red",
#	"darkred","darkred","white")))



