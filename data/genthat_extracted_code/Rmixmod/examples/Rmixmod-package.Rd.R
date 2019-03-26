library(Rmixmod)


### Name: Rmixmod-package
### Title: Rmixmod a MIXture MODelling package
### Aliases: Rmixmod Rmixmod-package
### Keywords: package

### ** Examples

  ## Not run: 
##D   ## Clustering Analysis
##D   # load quantitative data set
##D   data(geyser)
##D   # Clustering in gaussian case
##D   xem1<-mixmodCluster(geyser,3)
##D   summary(xem1)
##D   plot(xem1)
##D   hist(xem1)
##D 
##D   # load qualitative data set
##D   data(birds)
##D   # Clustering in multinomial case
##D   xem2<-mixmodCluster(birds, 2)
##D   summary(xem2)
##D   barplot(xem2)
##D 
##D   # load heterogeneous data set
##D   data(finance)
##D   # Clustering in composite case
##D   xem3<-mixmodCluster(finance,2:6)
##D   summary(xem3)
##D 
##D   ## Discriminant Analysis
##D   # start by extract 10 observations from iris data set
##D   remaining.obs<-sample(1:nrow(iris),10)
##D   # then run a mixmodLearn() analysis without those 10 observations
##D   learn<-mixmodLearn(iris[-remaining.obs,1:4], iris$Species[-remaining.obs])
##D   # create a MixmodPredict to predict those 10 observations
##D   prediction <- mixmodPredict(data=iris[remaining.obs,1:4], classificationRule=learn["bestResult"])
##D   # show results
##D   prediction
##D   # compare prediction with real results
##D   paste("accuracy= ",mean(as.integer(iris$Species[remaining.obs]) == prediction["partition"])*100
##D      	,"%",sep="")
##D   
## End(Not run)




