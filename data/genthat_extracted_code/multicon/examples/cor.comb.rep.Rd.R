library(multicon)


### Name: cor.comb.rep
### Title: Replicabilities and Correlations
### Aliases: cor.comb.rep
### Keywords: vector replicability meta-analysis

### ** Examples

data(RSPdata)
names(RSPdata)
	#Computing the relationship between self reported extraversion and 
	#Behavior measured by RBQ1 "Interviews others"over 4 situations 
data(rbqv3.items)
rbqv3.items # the RBQ content
	 # The correlations between extraversion and RBQ001 in Situation 1 
cor(RSPdata$sEXT,RSPdata$v2rbq001)
cor(RSPdata$sEXT,RSPdata$v3rbq001) # ... Situation 2 
cor(RSPdata$sEXT,RSPdata$v4rbq001) # ... Situation 3
cor(RSPdata$sEXT,RSPdata$v5rbq001) # ... Situation 4 
	#now to use cor.comb to combine meta-analytically
cor.comb(y1=RSPdata$sEXT,y2=RSPdata$sEXT,y3=RSPdata$sEXT,y4=RSPdata$sEXT,
         x1=RSPdata$v2rbq001,x2=RSPdata$v3rbq001,x3=RSPdata$v4rbq001,x4=RSPdata$v5rbq001)
#now to test the replicability of these results
data(v2rbq)
data(v3rbq)
data(v4rbq)
data(v5rbq)

# Note in practice sims = 100 or more might be preferred
cor.comb.rep(x1=RSPdata$sEXT,x2=RSPdata$sEXT,x3=RSPdata$sEXT,
	x4=RSPdata$sEXT,set1=v2rbq,set2=v3rbq,set3=v4rbq,set4=v5rbq, sims=5) 
 


