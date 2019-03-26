library(gplots)


### Name: sinkplot
### Title: Send textual R output to a graphics device
### Aliases: sinkplot
### Keywords: hplot

### ** Examples

   set.seed(12456)
   x <- factor(sample( LETTERS[1:5], 50, replace=TRUE))
   y <- rnorm(50, mean=as.numeric(x), sd=1)

   ## construct a figure showing a box plot of the data, followed by an
   ## analysis of variance table for the data
   layout(cbind(1:2), heights=c(2,1))

   boxplot(y~x, col="darkgreen")

   sinkplot()
   anova(lm(y~x))
   sinkplot("plot",col="darkgreen")



