library(VRPM)


### Name: colplot
### Title: Visualize a risk prediction model by means of colored bars.
### Aliases: colplot colplot.coxph colplot.default colplot.glm colplot.ksvm
###   colplot.multinom

### ** Examples

# default options
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
mydata$rank <- factor(mydata$rank)
fit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
colplot(fit)

#### cox proportional hazard regression
library(mfp)
data(GBSG)
fit<-coxph(Surv(rfst, cens) ~ age+tumsize+posnodal+prm+esm+menostat+tumgrad, data = GBSG, 
		model=TRUE)
colplot(fit)

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
# visualize the model: more than one plot is generated in the current directory
colplot(fit,coloroptions=3,risklabel=labels,filename="div")


#### Support Vector Machine classifier
## Not run: 
##D 	library(kernlab)
##D 	data(iris)
##D 	levels(iris$Species)[levels(iris$Species)=="setosa"] <- "other"
##D 	levels(iris$Species)[levels(iris$Species)=="virginica"] <- "other"
##D 	names(iris)=c("SL","SW","PL","PW","Species")
##D # RBF kernel
##D 	model <-ksvm(Species ~ ., data = iris,prob.model=TRUE,kpar=list(0.03),C=10)
##D # The plot should be based on all training data, so the following code should be used:
##D 	newmodel=preplotperf(model,iris,indy=5,zerolevel="min")
##D 	colplot(newmodel,filename="IRIS2",zerolevel="min",coloroptions=5)
## End(Not run)




