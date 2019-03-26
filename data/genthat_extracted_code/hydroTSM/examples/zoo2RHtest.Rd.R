library(hydroTSM)


### Name: zoo2RHtest
### Title: Zoo -> RHTest
### Aliases: zoo2RHtest
### Keywords: manip

### ** Examples

## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- SanMartinoPPts

#Getting the monthly ts
pcp.m <- daily2monthly(x, FUN=sum, na.rm=FALSE)

# From zoo to the input format required by 'FindU.dlyPrcp' function
zoo2RHtest(x=pcp.m, fname="pcp-monthly.txt", tstep.out="monthly", na="-999.0")

## Not run: 
##D # Homogeneity analysis
##D FindU.dlyPrcp(InSeries="pcp-monthly.txt", output="pcp-monthly", MissingValueCode="-999.0", 
##D GUI=FALSE, pthr=0, Mq=10, p.lev=0.95, Iadj=10000)
## End(Not run)



