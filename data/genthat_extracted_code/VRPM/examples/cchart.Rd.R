library(VRPM)


### Name: cchart
### Title: Contribution chart.
### Aliases: cchart cchart.coxph cchart.default cchart.glm cchart.ksvm
###   cchart.multinom

### ** Examples

#### logistic regression
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
mydata$rank <- factor(mydata$rank)
fit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
patient1=data.frame(gre=386,gpa=3.58,rank=3)
cchart(fit,obs=patient1,filename="cchart1")

#### cox proportional hazard regression
library(mfp)
data(GBSG)
fit<-coxph(Surv(rfst, cens) ~ age+tumsize+posnodal+prm+esm+menostat+tumgrad, data = GBSG, 
		model=TRUE)
patient1=data.frame(age=52,tumsize=45,posnodal=23,prm=1025,esm=562,menostat=2,tumgrad=3)
# Indicate the risk estimate at 500 days
cchart(fit,patient1,time=500,filename="cchart6")


#### multinomial logistic regression model
library(nnet)
library(VGAMdata)
data(xs.nz)
marital.nz <- xs.nz[,c("marital","sex","age","height","weight")]
mydata <- marital.nz[complete.cases(marital.nz),]
fit <- multinom(marital ~ sex + age + height + weight, data = mydata,model=TRUE)
# for multinimial logistic regression, a vector of risk labels needs to be made 
# and provided to the colplot function
outnames=colnames(fitted(fit))
labels=c(paste("Linear predictor for",outnames[-1]),paste
				("Predicted chance of being",outnames))
patient1=data.frame(sex="F",age=27,height=1.68,weight=58.6)
cchart(fit,obs=patient1,filename="multinom",risklabel=labels,zerolevel="zero")

#### Support Vector Machine classifier
## Not run: 
##D 	library(kernlab)
##D 	data(iris)
##D 	levels(iris$Species)[levels(iris$Species)=="setosa"] <- "other"
##D 	levels(iris$Species)[levels(iris$Species)=="virginica"] <- "other"
##D 	names(iris)=c("SL","SW","PL","PW","Species")
##D 	set.seed(100)
##D 	model <-ksvm(Species ~ ., data = iris,prob.model=TRUE,kpar=list(0.03),C=10)
##D 	obs1=data.frame(SL=5.2,SW=3.0,PL=1.5,PW=0.3)
##D # The plot should be based on all training data, so the following code should be used:
##D 	newmodel=preplotperf(model,iris,indy=5,zerolevel="median")
##D 	cchart(newmodel,obs=obs1,filename="iris2",zerolevel="median")
## End(Not run)



