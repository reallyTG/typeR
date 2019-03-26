library(qqtest)


### Name: qqtest
### Title: 'qqtest' A self-calibrated quantile-quantile plot for assessing
###   distributional shape.
### Aliases: qqtest

### ** Examples

#
# default qqtest plot
qqtest(precip, main = "Precipitation (inches/year) in 70 US cities")
#
# qqtest to compare to qqnorm
op <- par(mfrow=c(1,2))
qqnorm(precip, main="qqnorm")
qqtest(precip, main="qqtest",
       xAxisAsProbs=FALSE, yAxisAsProbs=FALSE)
par(op)
#
#  Use lines instead of envelope
qqtest(precip, envelope=FALSE, drawPercentiles=TRUE,
       main = "Precipitation (inches/year) in 70 US cities")
#
#  Use quartiles instead of envelope
qqtest(precip, envelope=FALSE, drawQuartiles=TRUE,
       main = "Precipitation (inches/year) in 70 US cities")
#
#  Use coloured exemplars (qqplot of data simulated from the test distribution)
#  and suppress the envelope.  Where the envelope, percentiles, and quartiles are
#  simulated pointwise bands, exemplars give some sense of what the (joint) shape of the
#  quantile-quantile plot should look like (for data from the test distribution).
#  Each simulated sample is a different colour.
qqtest(precip, nexemplars=10, typex="o", envelope=FALSE, type="p",
       main = "Precipitation (inches/year) in 70 US cities")
#
#  Alternatively, the trail of each exemplar could be plain (the identical grey).
#  Making each trail wide and assigning it some transparency (alpha near 0)
#  allows the trails to give a sense of the density through the darkness of the grey.
#
qqtest(precip, nexemplars=20, envelope=FALSE,
       lwdTrails=3, plainTrails=TRUE, alphaTrail=0.4, typex="o", type="o",
       main = "Precipitation (inches/year) in 70 US cities")
#
#  Wide coloured exemplars with some transparency provide an indication of
#  density and allow some trails to be followed by colour.
#
qqtest(precip, nexemplars=20, envelope=FALSE,
       lwdTrails=3,  alphaTrail=0.4, typex="o", type="o", col="black",
       main = "Precipitation (inches/year) in 70 US cities")


#  Envelope and exemplars with coloured trails to be followed.
#
qqtest(precip, nexemplars=5,
       lwdTrails=2, alphaTrail=0.6, alpha=0.8,
       main = "Precipitation (inches/year) in 70 US cities")
#
#
#  gaussian - qqplot, but now showing in the line up
result <- qqtest(precip, lineup=TRUE, main="Suspect", legend=FALSE,
                 cex=0.75, col="grey20", ylab="", pch=21)
# the location of the real data in the line up can be found by evaluating
# the contents of the string
 result$TrueLoc
#
# Cut and paste the string contents into the R console, or evaluate
 eval(parse(text=result$TrueLoc))
#
#
# log-normal ... using the bacteria data from Whipple(1916)
data(bacteria, package="qqtest")
# Note that these are selected percentiles from a sample of 365 days in a year
with(bacteria,
    qqtest(count, dist = "log-normal", p=percentTime/100, np=365, type="o",
 		  yAxisAsProbs=FALSE, ylab="bacteria per cc",
           xAxisProbs = c(0.01, 0.50,0.75, 0.90, 0.95, 0.99, 0.995),
           xlab="Percentage of days in 1913",
           main = "Number of bacteria from the Delaware river in 1913")
    )
ptics <- c(0.01, 0.10, 0.25, 0.50, 0.75, 0.90, 0.99 )
axis(1,at=qnorm(ptics), labels=floor(ptics*100))
yvals <- c(100, 1000, 10000, 100000)
axis(2, at=log(yvals,10),
     labels=c("100", "1,000", "10,000", "100,000"))
#
# compare this to the log-scaled normal qqplot
#
#
with(bacteria,
    qqtest(log(count, 10), dist = "normal",
           p=percentTime/100, np=365,
 		  type="o", axes=FALSE,
           ylab="bacteria per cc",
           xlab="Proportion of days in 1913",
           main = "Number of bacteria from the Delaware river in 1913")
    )
#
#
# Half normal ... using the penicillin data from Daniel(1959)
data(penicillin)

qqtest(penicillin, dist = "half-normal")

# Or the same again but with significant contrast labelled


with (penicillin,
	{qqtest(value, yAxisProbs=c(0.1, 0.75, 0.90, 0.95),
         dist="half-normal",
			ylab="Sample cumulative probability",
         xlab="Half-normal cumulative probability")
	 ppAdj <- (1+ppoints(31))/2  # to get half-normals from normal
	 x <- qnorm(ppAdj)
	 valOrder <- order(value)    # need data and rownames in increasing order
	 y <- value[valOrder]
	 tags <- rownames(penicillin)[valOrder]
	 selPoints <- 28:31          # going to label only the largest effects
  xoffset <- c(0.01, 0.02, 0.03, 0.075)  # text function is a bit off
	 text(x[selPoints]-xoffset, y[selPoints],
       tags[selPoints],
       pos=2, cex=0.75)
	}
)
#
# K on 9 df  ... see help(dkay)
# Use data on primer paint thickness (standard deviations on n=10)
data(primer, package="qqtest")
with (primer,
	     qqtest(s,  dist="kay", df=9,
		        yAxisAsProbs=FALSE,
			    ylab="Standard deviation of primer thickness (in mils)")
		)
#
# chi-squared on 3 df
# Use robust covariance matrix in calculation Mahalanobis distances
# for the classical Brownlee stackloss data.
data(stacklossDistances, package="qqtest")
with(stacklossDistances,
     qqtest(robust, dist="chi", df=3, ylab="Robust Mahalanobis distances"))
#
#
# user supplied qfunction and rfunction -- compare to beta distribution
qqtest(precip,
       qfunction=function(p){qbeta(p, 2, 2)},
       rfunction=function(n){rbeta(n, 2, 2)},
       main = "Precipitation (inches/year) in 70 US cities")
#
#
# user supplied qfunction only -- compare to beta distribution
qqtest(precip,
       qfunction=function(p){qbeta(p, 2, 2)},
       main = "Precipitation (inches/year) in 70 US cities")
#
# comparing data samples
#
# Does the sample of beaver2's temperatures look like they
# could have come from a distribution shaped like beaver1's?
#
 	qqtest(beaver2[,"temp"],
		       dataTest=beaver1[,"temp"],
		       ylab="Beaver 2", xlab="Beaver 1",
		       main="Beaver body temperatures")
#
#
# For the famous iris data, does the sample of iris versicolor
# appear to have the same (marginal) distributional shape
# as does that of iris virginica (to which it is more closely related)?
#
op <- par(mfrow=c(2,2))
with(iris, {
	qqtest(Sepal.Length[Species=="versicolor"],
		   dataTest= Sepal.Length[Species=="virginica"],
		   ylab="versicolor", xlab="virginica",
		   main="Sepal length")
	qqtest(Sepal.Width[Species=="versicolor"],
		   dataTest= Sepal.Width[Species=="virginica"],
		   ylab="versicolor", xlab="virginica",
		   main="Sepal width", legend=FALSE)
	qqtest(Petal.Length[Species=="versicolor"],
		   dataTest=Petal.Length[Species=="virginica"],
		   ylab="versicolor", xlab="virginica",
		   main="Petal length", legend=FALSE)
	qqtest(Petal.Width[Species=="versicolor"],
		   dataTest= Petal.Width[Species=="virginica"],
		   ylab="versicolor", xlab="virginica",
		   main="Petal width", legend=FALSE)
	}
	)
par(op)



