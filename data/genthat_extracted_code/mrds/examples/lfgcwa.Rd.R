library(mrds)


### Name: lfgcwa
### Title: Golden-cheeked warbler mark-recapture distance sampling analysis
### Aliases: lfgcwa
### Keywords: datasets

### ** Examples


## Not run: 
##D data(lfgcwa)
##D xy <- cut(lfgcwa$Pred, c(-0.0001, .1, .2, .3, .4, .5, .6, .7, .8, .9, 1),
##D  labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"))
##D x <- data.frame(lfgcwa, New=xy)
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
##D # which adds bin information to the \code{bird.data} dataframe
##D 
##D bird.data$distbegin=0
##D bird.data$distend=100
##D bird.data$distend[bird.data$distance==12.5]=50
##D bird.data$distbegin[bird.data$distance==37.5]=0
##D bird.data$distend[bird.data$distance==37.5]=50
##D bird.data$distbegin[bird.data$distance==62.5]=50
##D bird.data$distend[bird.data$distance==62.5]=100
##D bird.data$distbegin[bird.data$distance==87.5]=50
##D bird.data$distend[bird.data$distance==87.5]=100
##D 
##D # Removed all survey points with distance=NA for a survey event;
##D # hence no observations for use in \code{ddf()} but needed later
##D bird.data=bird.data[complete.cases(bird.data),]
##D 
##D # Manipulations on full dataset for various data.frame creation
##D # for use in density estimation using \code{dht()}
##D 
##D # Samples dataframe
##D xx <- x
##D x <- data.frame(PointID=x$PointID, Species=x$Species,
##D                 Category=x$New, Effort=x$Effort)
##D x <- x[!duplicated(x$PointID),]
##D point.num <- table(x$Category)
##D samples <- data.frame(PointID=x$PointID, Region.Label=x$Category,
##D                       Effort=x$Effort)
##D final.samples=data.frame(Sample.Label=samples$PointID,
##D                          Region.Label=samples$Region.Label,
##D                          Effort=samples$Effort)
##D 
##D # obs dataframe
##D obs <- data.frame(ObjectID=xx$ObjectID, PointID=xx$PointID)
##D # used to get Region and Sample assigned to ObjectID
##D obs <- merge(obs, samples, by=c("PointID", "PointID"))
##D obs <- obs[!duplicated(obs$ObjectID),]
##D obs <- data.frame(object=obs$ObjectID, Region.Label=obs$Region.Label,
##D                   Sample.Label=obs$PointID)
##D 
##D #Region.Label dataframe
##D region.data <- data.frame(Region.Label=c(1,2,3,4,5,6,7,8,9),
##D                           Area=c(point.num[1]*3.14,
##D                                  point.num[2]*3.14,
##D                                  point.num[3]*3.14,
##D                                  point.num[4]*3.14,
##D                                  point.num[5]*3.14,
##D                                  point.num[6]*3.14,
##D                                  point.num[7]*3.14,
##D                                  point.num[8]*3.14,
##D                                  point.num[9]*3.14))
##D 
##D # Candidate Models
##D 
##D GW1=ddf(
##D    dsmodel=~cds(key="unif", adj.series="cos", adj.order=1,adj.scale="width"),
##D    mrmodel=~glm(~distance),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE,point=TRUE,width=100,breaks=c(0,50,100)))
##D GW2=ddf(
##D    dsmodel=~cds(key="unif", adj.series="cos", adj.order=1,adj.scale="width"),
##D    mrmodel=~glm(~distance+observer),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE,point=TRUE,width=100,breaks=c(0,50,100)))
##D GW3=ddf(
##D    dsmodel=~cds(key="unif", adj.series="cos", adj.order=1,adj.scale="width"),
##D    mrmodel=~glm(~distance*observer),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE,point=TRUE,width=100,breaks=c(0,50,100)))
##D GW4=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE,point=TRUE,width=100,breaks=c(0,50,100)))
##D GW4FI=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE,point=TRUE,width=100,breaks=c(0,50,100)))
##D GW5=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance+observer),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D GW5FI=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance+observer),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D GW6=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*observer),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D GW6FI=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*observer),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D GW7=ddf(
##D    dsmodel=~cds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*Day),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D GW7FI=ddf(
##D    dsmodel=~cds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*Day),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D GW8=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*observer*Day),
##D    data=bird.data,
##D    method="io",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D GW8FI=ddf(
##D    dsmodel=~mcds(key="hn",formula=~1),
##D    mrmodel=~glm(~distance*observer*Day),
##D    data=bird.data,
##D    method="io.fi",
##D    meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D #GWDS=ddf(
##D #   dsmodel=~mcds(key="hn",formula=~1),
##D #   data=bird.data,
##D #   method="ds",
##D #   meta.data=list(binned=TRUE, point=TRUE, width=100,breaks=c(0,50,100)))
##D 
##D 
##D 
##D #### GCWA Summary Metrics
##D 
##D #AIC table building code, not exactly elegant, but I did not
##D want to add more package dependencies
##D AIC = c(GW1$criterion, GW2$criterion, GW3$criterion, GW4$criterion,
##D         GW4FI$criterion, GW5$criterion, GW5FI$criterion,
##D         GW6$criterion, GW6FI$criterion, GW7$criterion, GW7FI$criterion,
##D         GW8$criterion, GW8FI$criterion)
##D 
##D #creates a set of row names for me to check my grep() call below
##D rn <- c("GW1", "GW2", "GW3", "GW4", "GW4FI", "GW5", "GW5FI", "GW6",
##D         "GW6FI", "GW7","GW7FI", "GW8", "GW8FI")
##D 
##D # number of parameters for each model
##D k <- c(length(GW1$par), length(GW2$par), length(GW3$par), length(GW4$par),
##D        length(GW4FI$par), length(GW5$par), length(GW5FI$par),
##D        length(GW6$par), length(GW6FI$par), length(GW7$par),
##D        length(GW7FI$par), length(GW8$par), length(GW8FI$par))
##D 
##D # build AIC table and
##D AIC.table <- data.frame(AIC = AIC, rn=rn, k=k, dAIC = abs(min(AIC)-AIC),
##D                         likg = exp(-.5*(abs(min(AIC)-AIC))))
##D # row.names(AIC.table)=grep("GW", ls(), value=TRUE)
##D AIC.table <- AIC.table[with(AIC.table, order(-likg, -dAIC, AIC, k)),]
##D AIC.table <- data.frame(AIC.table, wi=AIC.table$likg/sum(AIC.table$likg))
##D AIC.table
##D 
##D # Model average N_hat_covered estimates
##D # not very clean, but I wanted to show full process, need to use
##D # collect.models and model.table here
##D 
##D estimate <- c(GW1$Nhat, GW2$Nhat, GW3$Nhat, GW4$Nhat, GW4FI$Nhat,
##D               GW5$Nhat, GW5FI$Nhat, GW6$Nhat, GW6FI$Nhat, GW7$Nhat,
##D               GW7FI$Nhat, GW8$Nhat, GW8FI$Nhat)
##D AIC.values <- AIC
##D 
##D # Nhat.se is calculated in mrds:::summary.io, not in ddf(), so
##D # it takes a bit to pull out
##D std.err <- c(summary(GW1)$Nhat.se, summary(GW2)$Nhat.se,
##D              summary(GW3)$Nhat.se,summary(GW4)$Nhat.se,
##D              summary(GW4FI)$Nhat.se, summary(GW5)$Nhat.se,
##D              summary(GW5FI)$Nhat.se, summary(GW6)$Nhat.se,
##D              summary(GW6FI)$Nhat.se, summary(GW7)$Nhat.se,
##D              summary(GW7FI)$Nhat.se,summary(GW8)$Nhat.se,
##D              summary(GW8FI)$Nhat.se)
## End(Not run)
## Not run: 
##D #Not Run
##D #requires RMark
##D library(RMark)
##D #uses model.average structure to model average real abundance estimates for
##D #covered area of the surveys
##D mmi.list=list(estimate=estimate, AIC=AIC.values, se=std.err)
##D model.average(mmi.list, revised=TRUE)
##D 
##D #Not Run
##D #Best Model FI
##D #best.modelFI=AIC.table[1,]
##D #best.model
##D #Best Model PI
##D #best.modelPI=AIC.table[2,]
##D #best.modelPI
##D 
##D #Not Run
##D #summary(GW7FI, se=TRUE)
##D #summary(GW7, se=TRUE)
##D 
##D #Not Run
##D #GOF for models
##D #ddf.gof(GW7, breaks=c(0,50,100))
##D 
##D #Not Run
##D #Density estimation across occupancy categories
##D #out.GW=dht(GW7, region.data, final.samples, obs, se=TRUE,
##D            options=list(convert.units=.01))
##D 
##D #Plots--Not Run
##D #Composite Detection Function examples
##D #plot(GW7, which=3, showpoints=FALSE, angle=0, density=0,
##D #     col="black", lwd=3, main="Golden-cheeked Warbler",
##D #     xlab="Distance (m)", las=1, cex.axis=1.25, cex.lab=1.25)
##D 
##D #Conditional Detection Function
##D #dd=expand.grid(distance=0:100,Day=(4:82)/82)
##D #dmat=model.matrix(~distance*Day,dd)
##D #dd$p=plogis(model.matrix(~distance*Day,dd)%*%coef(GW7$mr)$estimate)
##D #dd$Day=dd$Day*82
##D #with(dd[dd$Day==12,],plot(distance,p,ylim=c(0,1), las=1,
##D # ylab="Detection probability", xlab="Distance (m)",
##D #  type="l",lty=1, lwd=3, bty="l", cex.axis=1.5, cex.lab=1.5))
##D #with(dd[dd$Day==65,],lines(distance,p,lty=2, lwd=3))
##D #ch=paste(bird.data$detected[bird.data$observer==1],
##D #         bird.data$detected[bird.data$observer==2],
##D #         sep="")
##D #tab=table(ch,cut(82*bird.data$Day[bird.data$observer==1],c(0,45,83)),
##D # cut(bird.data$distance[bird.data$observer==1],c(0,50,100)))
##D #tabmat=cbind(colMeans(rbind(tab[3,,1]/colSums(tab[2:3,,1],
##D #                            tab[3,,1]/colSums(tab[c(1,3),,1])))),
##D #             colMeans(rbind(tab[3,,2]/colSums(tab[2:3,,2],
##D #                            tab[3,,2]/colSums(tab[c(1,3),,2])))))
##D #colnames(tabmat)=c("0-50","51-100")
##D #points(c(25,75),tabmat[1,],pch=1, cex=1.5)
##D #points(c(25,75),tabmat[2,],pch=2, cex=1.5)
##D 
##D # Another alternative plot using barplot instead of points
##D # (this is one in paper)
##D 
##D #ch=paste(bird.data$detected[bird.data$observer==1],
##D #         bird.data$detected[bird.data$observer==2],
##D #sep="")
##D #tab=table(ch,cut(82*bird.data$Day[bird.data$observer==1],c(0,45,83)),
##D # cut(bird.data$distance[bird.data$observer==1],c(0,50,100)))
##D #tabmat=cbind(colMeans(rbind(tab[3,,1]/colSums(tab[2:3,,1],
##D #                            tab[3,,1]/colSums(tab[c(1,3),,1])))),
##D #colMeans(rbind(tab[3,,2]/colSums(tab[2:3,,2],
##D #               tab[3,,2]/colSums(tab[c(1,3),,2])))))
##D #colnames(tabmat)=c("0-50","51-100")
##D #par(mfrow=c(2, 1), mai=c(1,1,1,1))
##D #with(dd[dd$Day==12,],
##D #     plot(distance,p,ylim=c(0,1), las=1,
##D #          ylab="Detection probability", xlab="",
##D #          type="l",lty=1, lwd=4, bty="l", cex.axis=1.5, cex.lab=1.5))
##D #segments(0, 0, .0, tabmat[1,1], lwd=3)
##D #segments(0, tabmat[1,1], 50, tabmat[1,1], lwd=4)
##D #segments(50, tabmat[1,1], 50, 0, lwd=4)
##D #segments(50, tabmat[1,2], 100, tabmat[1,2], lwd=4)
##D #segments(0, tabmat[1,1], 50, tabmat[1,1], lwd=4)
##D #segments(100, tabmat[1,2], 100, 0, lwd=4)
##D #mtext("a",line=-1, at=90)
##D #with(dd[dd$Day==65,],
##D #     plot(distance,p,ylim=c(0,1), las=1, ylab="Detection probability",
##D #          xlab="Distance", type="l",lty=1,
##D #          lwd=4, bty="l", cex.axis=1.5, cex.lab=1.5))
##D #segments(0, 0, .0, tabmat[2,1], lwd=4)
##D #segments(0, tabmat[2,1], 50, tabmat[2,1], lwd=4)
##D #segments(50, tabmat[2,1], 50, 0, lwd=4)
##D #segments(50, tabmat[2,2], 50, tabmat[2,1], lwd=4)
##D #segments(50, tabmat[2,2], 100, tabmat[2,2], lwd=4)
##D #segments(100, tabmat[2,2], 100, 0, lwd=4)
##D #mtext("b",line=-1, at=90)
## End(Not run)




