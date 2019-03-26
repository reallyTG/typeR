library(psych)


### Name: biplot.psych
### Title: Draw biplots of factor or component scores by factor or
###   component loadings
### Aliases: biplot.psych
### Keywords: multivariate hplot

### ** Examples

#the standard example
data(USArrests)
fa2 <- fa(USArrests,2,scores=TRUE)
biplot(fa2,labels=rownames(USArrests))

# plot the 3 factor solution
data(bfi)
fa3 <- fa(bfi[1:200,1:15],3,scores=TRUE)
biplot(fa3)
#just plot factors 1 and 3 from that solution
biplot(fa3,choose=c(1,3))

#
fa2 <- fa(bfi[16:25],2)  #factor analysis
fa2$scores <- fa2$scores[1:100,]  #just take the first 100
#now plot with different colors and shapes for males and females
biplot(fa2,pch=c(24,21)[bfi[1:100,"gender"]],group =bfi[1:100,"gender"],
   main="Biplot of Conscientiousness and Neuroticism by gender")


r <- cor(bfi[1:200,1:10], use="pairwise") #find the correlations
f2 <- fa(r,2) 
x <- list() 
x$scores <- factor.scores(bfi[1:200,1:10],f2)
x$loadings <- f2$loadings
class(x) <- c('psych','fa')
biplot(x,main="biplot from correlation matrix and factor scores")




