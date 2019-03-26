library(logihist)


### Name: logihist
### Title: Combined Graphs for Logistic Regression
### Aliases: logihist logibox logidot
### Keywords: ~aplot

### ** Examples


# Get some data from package popbio
data(aq.trans, package="popbio")
aq.trans$survived<-aq.trans$fate!="dead"
a<-subset(aq.trans, leaf<50 & stage!="recruit", c(leaf,survived))


# Transform the "survived" variable in numeric
# This is necesary to correctly plot the combined graph.
 
a$survived <-a$survived*1

# Fit a logistic regression
glm.a<- glm(survived~leaf, data=a, family=binomial)


# Histograms
# From individual variables
# Modifying the appearence of histogram bins
logihist(a$leaf,a$survived)
logihist(a$leaf,a$survived, fillb="blue")
logihist(a$leaf,a$survived, fillb="blue", colob="blue")
logihist(a$leaf,a$survived, fillb=c("orange","blue"), colob=c("orange","blue"))
logihist(a$leaf,a$survived, fillb=c("orange","blue"), colob=c("orange","blue"),
scale.hist=2)
logihist(a$leaf,a$survived, fillb=c("orange","blue"), colob=c("orange","blue"),
  breaks=seq(0,50, by=2))

# Modifying the combined plot using functions from ggpplot2

logihist(a$leaf,a$survived, fillb=NA, sizeb=0.5, ylab2="Number of plants", )+
   ylab("survived")+xlab("leaf")+ stat_smooth(method = "glm", method.args =
   list(family = "binomial"), se=TRUE, size=1, colour="black")+theme_light()


# The same fromm a glm object

logihist(glm.a, fillb=NA, sizeb=0.5, ylab2="Number of plants", se=TRUE)+ 
           theme_light()



# Dotplots
# Double dotplot from the individual variables, with different symbols for
#  0 and 1 categories (black and void, redand solid respectively).

logidot(a$leaf,a$survived,coldot=c(1,2),shapedot=c(1,19))

# Try with a larger dot.
logidot(a$leaf,a$survived,coldot=c(1,2),shapedot=c(1,19), sizedot=1)

# Add the fitted logistic curve and change the presentation using
# respectively an stat and a theme from ggplot2 

logidot(a$leaf,a$survived, coldot=c(1,2),shapedot=c(1,19),  sizedot=1)+
    stat_smooth(method = "glm", method.args = list(family = "binomial"),
           se=FALSE, size=2)+theme_light()+ylab("leaf")+xlab("survived")

# Get the same graphic directly form the fitted glm object
logidot(glm.a, coldot=c(1,2),shapedot=c(1,19),  sizedot=1, sizeglm=2,
           colglm="blue")+theme_light()



# Boxplots
logibox(a$leaf,a$survived)+theme_light()+ stat_smooth(method = "glm",
           method.args = list(family = "binomial"),se=FALSE )+
	   geom_jitter(height=0.02, size=0.5, colour="pink", alpha=0.5)






