## ----install, eval=FALSE-------------------------------------------------
#  install.packages('nat', dependencies = TRUE)

## ---- message=FALSE------------------------------------------------------
library(nat)

## ---- include=FALSE------------------------------------------------------
# set up for knitr / 3D snapshot figures
rgl::setupKnitr()
library(knitr)
opts_chunk$set(fig.width=5)

## ------------------------------------------------------------------------
data("Cell07PNs")

## ------------------------------------------------------------------------
class(Cell07PNs)

## ------------------------------------------------------------------------
length(Cell07PNs)
# access the first neuron in the neuronlist
class(Cell07PNs[[1]])

## ------------------------------------------------------------------------
n1=Cell07PNs[[1]]
plot(n1)

## ------------------------------------------------------------------------
# Use =1 so that we don't show complete structure
# for objects inside n1
str(n1, max.level=1)

## ------------------------------------------------------------------------
n1$NumPoints
n1[["NumPoints"]]

## ------------------------------------------------------------------------
n1$Comment='The sex of this specimen is uncertain'

## ------------------------------------------------------------------------
str(n1$d)

## ------------------------------------------------------------------------
plot(n1$d$X, n1$d$Y, type = 'l')

## ------------------------------------------------------------------------
methods(class = 'neuron')

## ------------------------------------------------------------------------
plot(n1, col = 'black', WithNodes = F, main="Shifting neurons")
# shift by 3 microns in x,y,z
plot(n1+3, col = 'red', add = TRUE, WithNodes = F)
# shift by -5 microns in y
plot(n1+c(0,-5,0), col = 'blue', add = TRUE, WithNodes = F)

## ------------------------------------------------------------------------
plot(n1, col = 'black', WithAllPoints = T, main="Subsetting a neuron")
# keep only nodes with X position >20
n1.lh=subset(n1, X>240)
# plot the selected part of the neuron in blue
plot(n1.lh, col='blue', lwd=3, add=TRUE)
# add a line illustrating the cut point
abline(v=240, lty=2)

## ------------------------------------------------------------------------
summary(n1)
summary(n1.lh)

## ------------------------------------------------------------------------
# we can select neurons by indexing 
first5=Cell07PNs[1:5]
summary(first5)

## ------------------------------------------------------------------------
names(Cell07PNs)
nl3=Cell07PNs[c("EBH11R", "EBH20L", "EBH20R")]
all.equal(nl3, Cell07PNs[1:3])

## ------------------------------------------------------------------------
head(Cell07PNs)
df=as.data.frame(Cell07PNs)
nrow(df)
# rownames of data.frame are the same as names of Cell07PNs list.
all.equal(rownames(df), names(Cell07PNs))

## ------------------------------------------------------------------------
# subset.neuronlist method (which you call using the subset function)
da1n=subset(Cell07PNs, Glomerulus=="DA1")

# with.neuronlist method
with(Cell07PNs, table(Glomerulus))

## ------------------------------------------------------------------------
Cell07PNs[, 'Glomerulus']

## ---- eval=FALSE---------------------------------------------------------
#  summary(Cell07PNs[,])

## ---- eval=FALSE---------------------------------------------------------
#  Cell07PNs[, 'NewColumn'] = somevariable
#  Cell07PNs[, "Sex"] = sub("F", "female", Cell07PNs[, "Sex"])
#  Cell07PNs[, "Sex"] = sub("M", "male", Cell07PNs[, "Sex"])

## ---- eval=FALSE---------------------------------------------------------
#  Cell07PNs[1:5, "Glomerulus"]
#  Cell07PNs[Cell07PNs[, "Sex"]=="F", "Glomerulus"]
#  

## ------------------------------------------------------------------------
methods(class = "neuronlist")

## ------------------------------------------------------------------------
# convert from microns to nm
Cell07PNs.nm = Cell07PNs*1e3
plot(Cell07PNs.nm)

## ------------------------------------------------------------------------
# define a 180 degree rotation around the x axis
rotm=cmtkparams2affmat(rx=180)
# remove tiny values due to rounding errors
rotm=zapsmall(rotm)
plot(xform(Cell07PNs, rotm))

## ---- fig.width=8, fig.height=4------------------------------------------
plot(Cell07PNs[[1]])

## ---- fig.width=8, fig.height=4------------------------------------------
plot(Cell07PNs[[1]], col='red', WithText=T)

## ---- fig.width=8, fig.height=4------------------------------------------
plot(Cell07PNs[1:3])

## ------------------------------------------------------------------------
plot(Cell07PNs, subset=Glomerulus!="DA1", col='grey', WithNodes=F, main="DA1 neurons")
plot(Cell07PNs, subset=Glomerulus=="DA1", add=TRUE)

## ---- webgl=TRUE---------------------------------------------------------
clear3d()
plot3d(Cell07PNs[[1]], col='red')
# set a grey background so it's easier to see extent of the webgl canvas
bg3d(col='lightgrey')

## ---- rgl=TRUE, fig.width=6----------------------------------------------
# 3d plot of neurons from olfactory glomeruli beginning with a D
# coloured by glomerulus
rval=plot3d(Cell07PNs, subset=grepl("^D", Glomerulus), col=Glomerulus,
  lwd=2, WithNodes=FALSE)

## ----plot3d-legend, fig.width=3, fig.height=3----------------------------
# make a legend so that you know which colours match which glomerulus
plot.new()
with(attr(rval,'df'), legend('center', legend = unique(Glomerulus), fill=unique(col)))

## ------------------------------------------------------------------------
# note that we had to use OmitFailures=T due to a problem with the graph
# structure of one neuron
lha=nlapply(Cell07PNs, subset, X>250, OmitFailures = T)
# Let's plot what we have colouring by glomerulus
plot(lha, col=Glomerulus, WithNodes=F)

## ------------------------------------------------------------------------
lhstats=summary(lha, include.attached.dataframe = TRUE)
boxplot(lhstats$cable.length~lhstats$Glomerulus, log='y')
boxplot(lhstats$branchpoints~lhstats$Glomerulus)

## ------------------------------------------------------------------------
# quick function to calculate centroid
arbour_centroid <- function(n) {
  # extract location of all points in neuron object
  xyzs=xyzmatrix(n)
  # median in all 3 axes (=>2 columns)
  apply(xyzs, 2, median)
}
# note that we have to transpose because sapply results in x,y,z rows
centroids=t(sapply(lha, arbour_centroid))
lhstats=cbind(lhstats, centroids)

## ------------------------------------------------------------------------
library(MASS)
lda.fit = lda(Glomerulus ~ cable.length+X+Y+Z+branchpoints, lhstats, CV = T)
table(lda.fit$class, lhstats$Glomerulus)

