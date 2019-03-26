library(VRPM)


### Name: HTMLsummary
### Title: Summarize the risk prediction plots.
### Aliases: HTMLsummary

### ** Examples

# only applicable for multinom objects
library(nnet)
library(R2HTML)
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
colplot(fit,coloroptions=3,risklabel=labels,filename="multinom")
# this generates a file mysummary.html containing all plots provided by the above 
# colplot statement. 
HTMLsummary(fit=fit, summaryfile="mysummary", filename="multinom",
		title="Global summary of a multinomial logistic regression model estimating 
				the risk on different marital statuses.")
# this generates a file mysummary1.html containing all plots provided by the below 
# colplot statement.  Since an observation is provided, a patient summary will also 
# be given.
colplot(fit,obs=patient1,coloroptions=3,risklabel=labels,filename="multinom")
HTMLsummary(fit=fit, summaryfile="mysummary1", filename="multinom",
		title="Global summary of a multinomial logistic regression model estimating 
				the risk on	different marital statuses.")



