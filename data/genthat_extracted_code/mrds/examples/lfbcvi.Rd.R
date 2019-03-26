library(mrds)


### Name: lfbcvi
### Title: Black-capped vireo mark-recapture distance sampling analysis
### Aliases: lfbcvi
### Keywords: datasets

### ** Examples


## Not run: 
##D data(lfbcvi)
##D xy=cut(lfbcvi$Pred, c(-0.0001, .1, .2, .3, .4, .5, .6, .7, .8, .9, 1),
##D   labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"))
##D x=data.frame(lfbcvi, New=xy)
##D 
##D # Note that I scaled the individual covariate of day-helps with
##D # convergence issues
##D bird.data <- data.frame(object=x$ObjectID, observer=x$Observer,
##D                         detected=x$Detected, distance=x$Distance,
##D                         Region.Label=x$New, Sample.Label=x$PointID,
##D                         Day=(x$Day/max(x$Day)))
##D 
##D # make observer a factor variable
##D bird.data$observer=factor(bird.data$observer)
##D 
##D # Jeff Laake suggested this snippet to quickly create distance medians
##D # which adds bin information to the bird.data dataframe
##D 
##D bird.data$distbegin=0
##D bird.data$distend=100
##D bird.data$distend[bird.data$distance==12.5]=25
##D bird.data$distbegin[bird.data$distance==37.5]=25
##D bird.data$distend[bird.data$distance==37.5]=50
##D bird.data$distbegin[bird.data$distance==62.5]=50
##D bird.data$distend[bird.data$distance==62.5]=75
##D bird.data$distbegin[bird.data$distance==87.5]=75
##D bird.data$distend[bird.data$distance==87.5]=100
##D 
##D # Removed all survey points with distance=NA for a survey event;
##D # hence no observations for use in ddf() but needed later
##D bird.data=bird.data[complete.cases(bird.data),]
##D 
##D # Manipulations on full dataset for various data.frame creation for
##D # use in density estimation using dht()
##D 
##D #Samples dataframe
##D xx=x
##D x=data.frame(PointID=x$PointID, Species=x$Species,
##D              Category=x$New, Effort=x$Effort)
##D x=x[!duplicated(x$PointID),]
##D point.num=table(x$Category)
##D samples=data.frame(PointID=x$PointID, Region.Label=x$Category,
##D                    Effort=x$Effort)
##D final.samples=data.frame(Sample.Label=samples$PointID,
##D                          Region.Label=samples$Region.Label,
##D                          Effort=samples$Effort)
##D 
##D #obs dataframe
##D obs=data.frame(ObjectID=xx$ObjectID, PointID=xx$PointID)
##D #used to get Region and Sample assigned to ObjectID
##D obs=merge(obs, samples, by=c("PointID", "PointID"))
##D obs=obs[!duplicated(obs$ObjectID),]
##D obs=data.frame(object=obs$ObjectID, Region.Label=obs$Region.Label,
##D                Sample.Label=obs$PointID)
##D 
##D region.data=data.frame(Region.Label=c(1, 2, 3,4,5,6,7,8,9, 10),
##D Area=c(point.num[1]*3.14, point.num[2]*3.14,
##D        point.num[3]*3.14, point.num[4]*3.14,
##D        point.num[5]*3.14, point.num[6]*3.14,
##D        point.num[7]*3.14, point.num[8]*3.14,
##D        point.num[9]*3.14, point.num[10]*3.14))
##D 
##D # Candidate Models
##D 
##D BV1=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE,point=TRUE,width=100,breaks=c(0,50,100)))
##D BV1FI=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE,point=TRUE,width=100,breaks=c(0,50,100)))
##D BV2=ddf(
##D    dsmodel=~mcds(key="hr",formula=~1),
##D    mrmodel=~glm(~distance),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE,point=TRUE,width=100,breaks=c(0,50,100)))
##D BV3=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance+observer),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV3FI=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance+observer),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV4=ddf(
##D    dsmodel=~mcds(key="hr",formula=~1),
##D    mrmodel=~glm(~distance+observer),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV5=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*observer),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV5FI=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*observer),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV6=ddf(
##D    dsmodel=~mcds(key="hr",formula=~1),
##D    mrmodel=~glm(~distance*observer),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV7=ddf(
##D    dsmodel=~cds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*Day),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV7FI=ddf(
##D    dsmodel=~cds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*Day),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV8=ddf(
##D    dsmodel=~cds(key="hr",formula=~1),
##D    mrmodel=~glm(~distance*Day),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV9=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*observer*Day),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV9FI=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*observer*Day),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D BV10=ddf(
##D    dsmodel=~mcds(key="hr",formula=~1),
##D    mrmodel=~glm(~distance*observer*Day),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D #BV.DS=ddf(
##D #    dsmodel=~mcds(key="hn",formula=~1),
##D #    data=bird.data,
##D #    method="ds",
##D #    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D 
##D #AIC table building code.
##D AIC = c(BV1$criterion, BV1FI$criterion, BV2$criterion, BV3$criterion,
##D         BV3FI$criterion, BV4$criterion,  BV5$criterion, BV5FI$criterion,
##D         BV6$criterion, BV7$criterion, BV7FI$criterion, BV8$criterion,
##D         BV9$criterion, BV9FI$criterion, BV10$criterion)
##D 
##D #creates a set of row names for me to check my grep() call below
##D rn = c("BV1", "BV1FI", "BV2", "BV3",  "BV3FI", "BV4", "BV5", "BV5FI",
##D        "BV6", "BV7", "BV7FI", "BV8", "BV9", "BV9FI", "BV10")
##D 
##D #Number parameters
##D k = c(length(BV1$par), length(BV1FI$par), length(BV2$par),
##D       length(BV3$par), length(BV3FI$par), length(BV4$par),
##D       length(BV5$par),length(BV5FI$par), length(BV6$par),
##D       length(BV7$par), length(BV7FI$par), length(BV8$par),
##D 
##D #build AIC table
##D AIC.table=data.frame(AIC = AIC, rn=rn, k=k, dAIC = abs(min(AIC)-AIC) ,
##D                      likg=exp(-.5*(abs(min(AIC)-AIC))))
##D #row.names(AIC.table)=grep("BV", ls(), value=TRUE)
##D AIC.table=AIC.table[with(AIC.table, order(-likg, -dAIC, AIC, k)),]
##D AIC.table=data.frame(AIC.table, wi=AIC.table$likg/sum(AIC.table$likg))
##D AIC.table
##D 
##D # Model average N_hat_covered estimates
##D #  not very clean, but I wanted to show full process, need to use
##D #  collect.models and model.table here later on
##D estimate <- c(BV1$Nhat, BV1FI$Nhat, BV2$Nhat, BV3$Nhat, BV3FI$Nhat,
##D               BV4$Nhat,  BV5$Nhat, BV5FI$Nhat, BV6$Nhat, BV7$Nhat,
##D               BV7FI$Nhat, BV8$Nhat, BV9$Nhat, BV9FI$Nhat, BV10$Nhat)
##D 
##D AIC.values=AIC
##D 
##D # had to use str() to extract here as Nhat.se is calculated in
##D # mrds:::summary.io, not in ddf(), so it takes a bit
##D std.err <- c(summary(BV1)$Nhat.se, summary(BV1FI)$Nhat.se,
##D              summary(BV2)$Nhat.se, summary(BV3)$Nhat.se,
##D              summary(BV3FI)$Nhat.se, summary(BV4)$Nhat.se,
##D              summary(BV5)$Nhat.se, summary(BV5FI)$Nhat.se,
##D              summary(BV6)$Nhat.se, summary(BV7)$Nhat.se,
##D              summary(BV7FI)$Nhat.se,summary(BV8)$Nhat.se,
##D              summary(BV9)$Nhat.se, summary(BV9FI)$Nhat.se,
##D              summary(BV10)$Nhat.se)
## End(Not run)

## Not run: 
##D #Not Run
##D #requires RMark
##D library(RMark)
##D #uses model.average structure to model average real abundance estimates for
##D #covered area of the surveys
##D   mmi.list=list(estimate=estimate, AIC=AIC.values, se=std.err)
##D   model.average(mmi.list, revised=TRUE)
##D 
##D #Not Run
##D #Summary for the top 2 models
##D  #summary(BV5, se=TRUE)
##D  #summary(BV5FI, se=TRUE)
##D 
##D #Not Run
##D #Best Model
##D  #best.model=AIC.table[1,]
##D 
##D #Not Run
##D #GOF for models
##D #ddf.gof(BV5, breaks=c(0, 25, 50, 75, 100))
##D 
##D #Not Run
##D #Density estimation across occupancy categories
##D #out.BV=dht(BV5, region.data, final.samples, obs, se=TRUE,
##D #           options=list(convert.units=.01))
##D 
##D #Plot--Not Run
##D 
##D #Composite Detection Function
##D #plot(BV5, which=3, showpoints=FALSE, angle=0, density=0, col="black", lwd=3,
##D # main="Black-capped Vireo",xlab="Distance (m)", las=1, cex.axis=1.25,
##D # cex.lab=1.25)
##D 
## End(Not run)




