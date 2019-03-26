library(HH)


### Name: CIplot
### Title: Illustration of the meaning of confidence levels.
### Aliases: CIplot confintervaldata confinterval.matrix confintervalplot
###   shiny.CIplot
### Keywords: hplot dynamic confidence shiny

### ** Examples


## A. from the console

## example 1
CIplot()

## example 2
## Not run: 
##D CIplot(n.intervals=100,
##D        n.per.row=40,
##D        pop.mean=0,
##D        pop.sd=1,
##D        conf.level=.95)
## End(Not run)

## example 3
## Not run: 
##D tmp.data <- confintervaldata()
##D tmp.ci <- confinterval.matrix(tmp.data)
##D confintervalplot(tmp.ci)
## End(Not run)

## example 4
## Not run: 
##D tmp.data <- confintervaldata(n.intervals=100,
##D                              n.per.row=40,
##D                              pop.mean=0,
##D                              pop.sd=1,
##D                              conf.level=.95)
##D tmp.ci <- confinterval.matrix(tmp.data)
##D confintervalplot(tmp.ci)
## End(Not run)


## B. shiny, initiated from the console

## example 5
## Not run: 
##D shiny.CIplot()
## End(Not run)

## example 6
## Not run: 
##D shiny.CIplot(height=800)  ## px
##D ## take control of the height of the graph in the web page
## End(Not run)



