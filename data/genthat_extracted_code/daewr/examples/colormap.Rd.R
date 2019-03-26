library(daewr)


### Name: colormap
### Title: This function makes a colormap of correlations in a design
###   matrix
### Aliases: colormap
### Keywords: hplot

### ** Examples

# color map of 2^(4-1) design
library(FrF2)
design <- FrF2(8, 4, randomize = FALSE)
colormap(design, mod=3)

# Makes color map for saturated 2^(7-4) design in Figure 6.14 p. 197
library(FrF2)
design <-FrF2( 8, 7)
colormap(design, mod=2)

# Makes colormap of an Alternate Screening Design 
library(daewr)
ascr<-Altscreen(7)
colormap(ascr, mod=2)

# Makes colormap of a Model Robust Design 
library(daewr)
MR16 <- ModelRobust('MR16m7g5', randomize = FALSE)
colormap(MR16, mod=2)
          
## The function is currently defined as
function(design,mod) {
##################### Inputs ###########################################
# design - a data frame containing columns of the numeric factor levels
# mod - the model for the color plot of correlations
#    1 = Linear model containing only the terms in the data frame
#    2 = Linear model plus two factor interactions
#    3 = Linear model plus 2 and 3 factor interactions
#    4 = Linear model plus 2, 3 and 4 factor interactions
########################################################################
y<-runif(nrow(design),0,1)
if(mod==1) {test <- model.matrix(lm(y~(.),data=design))}
if(mod==2) {test <- model.matrix(lm(y~(.)^2,data=design))}
if(mod==3) {test <- model.matrix(lm(y~(.)^3,data=design))}
if(mod==4) {test <- model.matrix(lm(y~(.)^4,data=design))}
names<-colnames(test)
names<-gsub(':','',names)
names<-gsub('1','',names)
colnames(test)<-names
cmas<-abs(cor(test[,ncol(test):2]))
cmas<-cmas[c((ncol(cmas)):1), ]
rgb.palette <- colorRampPalette(c("white", "black"), space = "rgb")
levelplot(cmas, main="Map of absolute correlations", xlab="", ylab="", col.regions=rgb.palette(120),
            cuts=100, at=seq(0,1,0.01),scales=list(x=list(rot=90))) }



