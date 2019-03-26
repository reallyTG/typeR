library(DOS)


### Name: dynarski
### Title: A Natural Experiment Concerning Subsidized College Education
### Aliases: dynarski
### Keywords: datasets

### ** Examples

#
data(dynarski)
# Table 13.1 of Rosenbaum (2010)
head(dynarski)
# Table 13.2 of Rosenbaum (2010)
zb<-dynarski$zb
zbf<-factor(zb,levels=c(1,0),labels=c("Father deceased","Father not deceased"))
table(zbf)
Xb<-dynarski[,3:10]

# Estimate the propensity score, Rosenbaum (2010, Section 13.3)
p<-glm(zb~Xb$faminc+Xb$incmiss+Xb$black+Xb$hisp
    +Xb$afqtpct+Xb$edmissm+Xb$edm+Xb$female,
    family=binomial)$fitted.values
# Figure 13.1 in Rosenbaum (2010)
boxplot(p~zbf,ylab="Propensity score",main="1979-1981 Cohort")

# Read about missing covariate values in section 13.4 of Rosenbaum (2010)

# Robust Mahalanobis distance matrix, treated x control
dmat<-smahal(zb,Xb)
dim(dmat)
# Table 13.3 in Rosenbaum (2010)
round(dmat[1:5,1:5],2)

# Add a caliper on the propensity score using a penalty function
dmat<-addcaliper(dmat,zb,p,caliper=.2)
dim(dmat)
# Table 13.4 in Rosenbaum (2010)
round(dmat[1:5,1:5],2)
## Not run: 
##D # YOU MUST LOAD the optmatch package and accept its license to continue.
##D # Note that the optmatch package has changed since 2010.  It now suggests
##D # that you indicate the data explicitly as data=dynarski.
##D 
##D # Creating a 1-to-10 match, as in section 13.6 of Rosenbaum (2010)
##D # This may take a few minutes.
##D m<-fullmatch(dmat,data=dynarski,min.controls = 10,max.controls = 10,omit.fraction = 1379/2689)
##D length(m)
##D sum(matched(m))
##D 1441/11 # There are 131 matched sets, 1 treated, 10 controls
##D 
##D # Alternative, simpler code to do the same thing
##D m2<-pairmatch(dmat,controls=10,data=dynarski)
##D # Results are the same:
##D sum(m[matched(m)]!=m2[matched(m2)])
##D 
##D # Housekeeping
##D im<-as.integer(m)
##D dynarski<-cbind(dynarski,im)
##D dm<-dynarski[matched(m),]
##D dm<-dm[order(dm$im,1-dm$zb),]
##D 
##D # Table 13.5 in Rosenbaum (2010)
##D which(dm$id==10)
##D dm[188:198,]
##D which(dm$id==396)
##D dm[23:33,]
##D which(dm$id==3051)
##D dm[1068:1078,]
##D # In principle, there can be a tie, in which several different
##D # matched samples all minimize the total distance.  On my
##D # computer, this calculation reproduces Table 13.5, but were
##D # there a tie, optmatch should return one of the tied optimal
##D # matches, but not any particular one.
## End(Not run)



