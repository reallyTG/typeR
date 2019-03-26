library(Biocomb)


### Name: cost.curve
### Title: Plots the RCC curve for two-class problem
### Aliases: cost.curve
### Keywords: feature selection classification AUC values ROC curve

### ** Examples

# example for dataset without missing values
data(data_test)

# class label must be factor
data_test[,ncol(data_test)]<-as.factor(data_test[,ncol(data_test)])

xllim<--4
xulim<-4
yllim<-30
yulim<-110

attrs.no=c(1,9)
pos.Class<-levels(data_test[,ncol(data_test)])[1]
add.legend<-TRUE

aacs<-rep(0,length(attrs.no))
color<-c(1:length(attrs.no))

aacs[1] <- cost.curve(data_test, attrs.no[1], pos.Class,col=color[1],add=FALSE,
 xlim=c(xllim,xulim),ylim=c(yllim,yulim))

if(length(attrs.no)>1){
			for(i in 2:length(attrs.no)){
		      aacs[i]<- cost.curve(data_test, attrs.no[i], pos.Class,
		      col=color[i],add=TRUE,xlim=c(xllim,xulim))
		    }
	    }

if(add.legend){
	       legt <- colnames(data_test)[attrs.no]
		   for(i in 1:length(attrs.no)){
			   legt[i] <- paste(legt[i],", AAC=",round(1000*aacs[i])/1000,sep="")
}
legend("bottomright",legend=legt,col=color,lwd=2)
}



