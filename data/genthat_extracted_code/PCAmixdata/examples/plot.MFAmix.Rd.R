library(PCAmixdata)


### Name: plot.MFAmix
### Title: Graphical outputs of MFAmix
### Aliases: plot.MFAmix

### ** Examples

data(gironde)
class.var<-c(rep(1,9),rep(2,5),rep(3,9),rep(4,4))
names <- c("employment","housing","services","environment")
dat <- cbind(gironde$employment[1:20,],gironde$housing[1:20,],
           gironde$services[1:20,],gironde$environment[1:20,])
res <- MFAmix(data=dat,groups=class.var,
            name.groups=names, rename.level=TRUE, ndim=3,graph=FALSE)

#---- quantitative variables
plot(res,choice="cor",cex=0.6)
plot(res,choice="cor",cex=0.6,coloring.var="groups")
plot(res,choice="cor",cex=0.6,coloring.var="groups",
     col.groups=c("red","yellow","pink","brown"),leg=TRUE)

#----partial axes
plot(res,choice="axes",cex=0.6)
plot(res,choice="axes",cex=0.6,coloring.var="groups")
plot(res,choice="axes",cex=0.6,coloring.var="groups",
     col.groups=c("red","yellow","pink","brown"),leg=TRUE)

#----groups
plot(res,choice="groups",cex=0.6)   #no colors for groups
plot(res,choice="groups",cex=0.6,coloring.var="groups") 
plot(res,choice="groups",cex=0.6,coloring.var="groups",
     col.groups=c("red","yellow","pink","blue")) 
#----squared loadings
plot(res,choice="sqload",cex=0.8)    #no colors for groups
plot(res,choice="sqload",cex=0.8,coloring.var="groups",
     posleg="topright") 
plot(res,choice="sqload",cex=0.6,coloring.var="groups",
     col.groups=c("red","yellow","pink","blue"),ylim=c(0,1)) 
plot(res,choice="sqload",cex=0.8,coloring.var="type",
     cex.leg=0.9,posleg="topright")  

#----individuals 
plot(res,choice="ind",cex=0.6) 

#----individuals with squared cosine greater than 0.5
plot(res,choice="ind",cex=0.6,lim.cos2.plot=0.5)  

#----individuals colored with a qualitative variable
nbchem <- gironde$services$chemist[1:20]
plot(res,choice="ind",cex=0.6,coloring.ind=nbchem,
     posleg="topright")   
plot(res,choice="ind",coloring.ind=nbchem,
     col.ind=c("pink","brown","darkblue"),label=FALSE,posleg="topright")     

#----partial individuals colored by groups
plot(res,choice="ind",partial=c("AUBIAC","ARCACHON"),
    cex=0.6,posleg="bottomright")

#----levels of qualitative variables
plot(res,choice="levels",cex=0.8)
plot(res,choice="levels",cex=0.8,coloring.var="groups")

#levels with squared cosine greater than 0.6
plot(res,choice="levels",cex=0.8, lim.cos2.plot=0.6)

#supplementary groups
data(wine)
X.quanti <- splitmix(wine)$X.quanti[,1:5]
X.quali <- splitmix(wine)$X.quali[,1,drop=FALSE]
X.quanti.sup <- splitmix(wine)$X.quanti[,28:29]
X.quali.sup <- splitmix(wine)$X.quali[,2,drop=FALSE]
data <- cbind(X.quanti,X.quali)
data.sup <- cbind(X.quanti.sup,X.quali.sup)

groups <-c(1,2,2,3,3,1)
name.groups <- c("G1","G2","G3")
groups.sup <- c(1,1,2)
name.groups.sup <- c("Gsup1","Gsup2")
mfa <- MFAmix(data,groups,name.groups,ndim=4,rename.level=TRUE,graph=FALSE)
mfa.sup <- supvar(mfa,data.sup,groups.sup,name.groups.sup,rename.level=TRUE)
plot(mfa.sup,choice="sqload",coloring.var="groups")
plot(mfa.sup,choice="axes",coloring.var="groups")
plot(mfa.sup,choice="groups",coloring.var="groups")
plot(mfa.sup,choice="levels",coloring.var="groups")
plot(mfa.sup,choice="levels")
plot(mfa.sup,choice="cor",coloring.var = "groups")




