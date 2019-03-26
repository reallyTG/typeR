library(multicon)


### Name: cor.comb
### Title: Combine Correlations
### Aliases: cor.comb
### Keywords: correlations meta-analysis

### ** Examples

	data(RSPdata)
names(RSPdata)
	#Computing the relationship between self reported extraversion 
	#and Behavior measured by RBQ1 "Interviews others"over 4 situations 
data(rbqv3.items)
rbqv3.items # the RBQ content
	# The correlations between extraversion and RBQ001 in Situation 1
cor(RSPdata$sEXT,RSPdata$v2rbq001)  
cor(RSPdata$sEXT,RSPdata$v3rbq001) # ... Situation 2 
cor(RSPdata$sEXT,RSPdata$v4rbq001) # ... Situation 3
cor(RSPdata$sEXT,RSPdata$v5rbq001) # ... Situation 4 
	#now to use cor.comb to combine meta-analytically
cor.comb(y1=RSPdata$sEXT,y2=RSPdata$sEXT,y3=RSPdata$sEXT,
	y4=RSPdata$sEXT,x1=RSPdata$v2rbq001,x2=RSPdata$v3rbq001,
	x3=RSPdata$v4rbq001,x4=RSPdata$v5rbq001,hist=TRUE)



