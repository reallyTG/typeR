library(Hmisc)


### Name: contents
### Title: Metadata for a Data Frame
### Aliases: contents contents.data.frame print.contents.data.frame
###   html.contents.data.frame contents.list print.contents.list
### Keywords: data interface

### ** Examples

set.seed(1)
dfr <- data.frame(x=rnorm(400),y=sample(c('male','female'),400,TRUE))
contents(dfr)
dfr <- upData(dfr, labels=c(x='Label for x', y='Label for y'))
attr(dfr$x, 'longlabel') <-
 'A very long label for x that can continue onto multiple long lines of text'

k <- contents(dfr)
print(k, sort='names', prlevels=FALSE)
## Not run: 
##D html(k)
##D html(contents(dfr))            # same result
##D latex(k$contents)              # latex.default just the main information
## End(Not run)



