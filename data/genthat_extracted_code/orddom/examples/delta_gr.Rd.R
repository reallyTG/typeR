library(orddom)


### Name: delta_gr
### Title: Cliff's delta Graphics and Interpretation
### Aliases: delta_gr
### Keywords: distribution

### ** Examples
## Not run: 
##D #Paired comparison combined inference (Data taken from Long et al. (2003), Table 4)
##D x2<-t(matrix(c(2,6,6,7,7,8,8,9,9,9,10,10,10,11,11,12,13,14,15,16),1))
##D colnames(x2)<-c("Incidental")
##D y2<-t(matrix(c(4,11,8,9,10,11,11,5,14,12,13,10,14,16,14,13,15,15,16,10),1))
##D colnames(y2)<-c("Intentional")
##D delta_gr(x2,y2,paired=TRUE,studdist=FALSE,dv=3)
##D #
##D #Journal of Statistics Education Dataset: Oral Contraceptive Drug Interaction Study
##D #Journal of Statistics Education, Volume 12, Number 1 (March 2004).
##D columns<-c("SubjectNo","Seq","Period","Treatment","EEAUC","EECmax","NETAUC","NETCmax")
##D data<-read.table("http://www.amstat.org/publications/jse/datasets/ocdrug.dat",col.names=columns)
##D #
##D #returns delta (between) and 95##D 
##D x<-subset(data,data$Treatment==0)[6] #Placebo EECmax
##D colnames(x)<-"Placebo Phase"
##D y<-subset(data,data$Treatment==1)[6] #Treatment EECmax
##D colnames(y)<-"Treatment Phase"
##D delta_gr(x,y,paired=TRUE,onetailed=TRUE,dv=2)
##D #
##D #checks treatment groups delta equivalence in placebo phase
##D #returns delta and 95##D 
##D plac<-subset(data,data$Treatment==0)
##D x<-subset(plac,plac$Period==1)[6] #control (placebo before drug)
##D colnames(x)<-"Control (before Drug)"
##D y<-subset(plac,plac$Period==2)[6] #experimental (placebo after drug)
##D colnames(y)<-"Exp (Placebo after Drug)"
##D delta_gr(x,y)
##D #
## End(Not run)


