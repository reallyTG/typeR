library(HH)


### Name: pyramidLikert
### Title: Print a Likert plot as a Population Triangle
### Aliases: pyramidLikert print.pyramidLikert as.pyramidLikert
### Keywords: hplot shiny

### ** Examples


data(USAge.table)  ## from latticeExtra
USA79 <- USAge.table[75:1, 2:1, "1979"]/1000000
PL <- plot(as.likert(USA79),
                     main="Population of United States 1979 (ages 0-74)",
                     xlab="Count in Millions",
                     ylab="Age",
                     scales=list(
                       y=list(
                         limits=c(0,77),
                         at=seq(1,76,5),
                         labels=seq(0,75,5),
                         tck=.5))
                        )
PL
as.pyramidLikert(PL)

likert(USAge.table[75:1, 2:1, c("1939","1959","1979")]/1000000,
       main="Population of United States 1939,1959,1979 (ages 0-74)",
       sub="Look for the Baby Boom",
       xlab="Count in Millions",
       ylab="Age",
       scales=list(
         y=list(
           limits=c(0,77),
           at=seq(1,76,5),
           labels=seq(0,75,5),
           tck=.5)),
       strip.left=FALSE, strip=TRUE,
       layout=c(3,1), between=list(x=.5))

## Not run: 
##D   ## run the shiny app
##D   shiny::runApp(system.file("shiny/PopulationPyramid", package="HH"))
## End(Not run)

## For additional examples, see demo(PoorChildren, package="HH")




