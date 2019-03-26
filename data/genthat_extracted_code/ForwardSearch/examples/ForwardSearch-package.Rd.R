library(ForwardSearch)


### Name: ForwardSearch-package
### Title: Functions for Forward Search for regression models.
### Aliases: ForwardSearch-package ForwardSearch
### Keywords: package

### ** Examples

#####################
#	EXAMPLE 1
#	using Fulton Fish data,
#	see Johansen and Nielsen (2014).

#	Call package
library(ForwardSearch)

#	Call data
data(Fulton)
mdata	<- as.matrix(Fulton)
n		<- nrow(mdata)

#	Identify variable to reproduce Johansen and Nielsen (2014)
q		<- mdata[2:n		,9]
q_1		<- mdata[1:(n-1) ,9]
s		<- mdata[2:n		,6]
x.q.s	<- cbind(q_1,s)
colnames(x.q.s	)	<- c("q_1","stormy")

#	Fit Forward Search
FS95	<- ForwardSearch.fit(x.q.s,q,psi.0=0.95)
FS80	<- ForwardSearch.fit(x.q.s,q,psi.0=0.80)

#	Forward plot of forward residuals scaled by variance estimate
#	Note the variance estimate is not bias corrected
#	This is taken into account in asymptotic theory
ForwardSearch.plot(FS95)
ForwardSearch.plot(FS80)

#	Based on the plot of e.g. FS95 it is decided to stop at m=107
ForwardSearch.stopped(FS95,107)

#	Alternatively use the file inst/extdata/Fulton.txt 
#	Data	<- read.table(data/Fulton.txt,header=TRUE)




