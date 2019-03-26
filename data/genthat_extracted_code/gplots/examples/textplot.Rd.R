library(gplots)


### Name: textplot
### Title: Display text information in a graphics plot.
### Aliases: textplot textplot.default textplot.character textplot.matrix
###   textplot.data.frame
### Keywords: hplot

### ** Examples

## Not run: 
##D ### simple examples
##D # show R version information
##D textplot(version)
##D 
##D # show the alphabet as a single string
##D textplot( paste(letters[1:26], collapse=" ") )
##D 
##D # show the alphabet as a matrix
##D textplot( matrix(letters[1:26], ncol=2))
##D 
##D ### Make a nice 4 way display with two plots and two text summaries
##D 
##D data(iris)
##D par(mfrow=c(2,2))
##D plot( Sepal.Length ~ Species, data=iris, border="blue", col="cyan",
##D       main="Boxplot of Sepal Length by Species" )
##D plotmeans( Sepal.Length ~ Species, data=iris, barwidth=2, connect=FALSE,
##D            main="Means and 95% Confidence Intervals\nof Sepal Length by Species")
##D 
##D info <- sapply( split(iris$Sepal.Length, iris$Species),
##D                 function(x) round(c(Mean=mean(x), SD=sd(x), N=gdata::nobs(x)),2) )
##D 
##D textplot( info, valign="top"  )
##D title("Sepal Length by Species")
##D 
##D reg <- lm( Sepal.Length ~ Species, data=iris )
##D textplot( capture.output(summary(reg)), valign="top")
##D title("Regression of Sepal Length by Species")
##D 
##D par(mfrow=c(1,1))
##D 
##D ### Show how to control text color
##D cols <- c("red", "green", "magenta", "forestgreen")
##D mat <- cbind(name=cols, t(col2rgb(cols)), hex=col2hex(cols))
##D 
##D textplot(mat,
##D          col.data=matrix(cols, nrow=length(cols), byrow=FALSE, ncol=5),
##D          )
##D 
##D ### Show how to manually tune the character size
##D data(iris)
##D reg <- lm( Sepal.Length ~ Species, data=iris )
##D text <- capture.output(summary(reg))
##D 
##D # do the plot and capture the character size used
##D textplot(text, valign="top")
##D 
##D # see what size was used
##D cex
##D 
##D # now redo the plot at 80% size
##D textplot( text, valign="top", cex=cex*0.80)
##D 
##D 
##D 
## End(Not run)



