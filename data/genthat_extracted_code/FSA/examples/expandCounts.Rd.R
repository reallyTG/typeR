library(FSA)


### Name: expandCounts
### Title: Repeat individual fish data (including lengths) from tallied
###   counts.
### Aliases: expandCounts
### Keywords: manip

### ** Examples

# all need expansion
( d1 <- data.frame(name=c("Johnson","Johnson","Jones","Frank","Frank","Max"),
                   lwr.bin=c(15,15.5,16,16,17,17),
                   upr.bin=c(15.5,16,16.5,16.5,17.5,17.5),
                   freq=c(6,4,2,3,1,1)) )
expandCounts(d1,~freq)
expandCounts(d1,~freq,~lwr.bin+upr.bin)

# some need expansion
( d2 <- data.frame(name=c("Johnson","Johnson","Jones","Frank","Frank","Max"),
                   lwr.bin=c(15,15.5,16,16,17.1,17.3),
                   upr.bin=c(15.5,16,16.5,16.5,17.1,17.3),
                   freq=c(6,4,2,3,1,1)) )
expandCounts(d2,~freq)
expandCounts(d2,~freq,~lwr.bin+upr.bin)

# none need expansion
( d3 <- data.frame(name=c("Johnson","Johnson","Jones","Frank","Frank","Max"),
                   lwr.bin=c(15,15.5,16,16,17.1,17.3),
                   upr.bin=c(15,15.5,16,16,17.1,17.3),
                   freq=c(6,4,2,3,1,1)) )
expandCounts(d3,~freq)
expandCounts(d3,~freq,~lwr.bin+upr.bin)

# some need expansion, but different bin widths
( d4 <- data.frame(name=c("Johnson","Johnson","Jones","Frank","Frank","Max"),
                   lwr.bin=c(15,  15,  16,  16,  17.1,17.3),
                   upr.bin=c(15.5,15.9,16.5,16.9,17.1,17.3),
                   freq=c(6,4,2,3,1,1)) )
expandCounts(d4,~freq)
expandCounts(d4,~freq,~lwr.bin+upr.bin)

# some need expansion but include zeros and NAs for counts
( d2a <- data.frame(name=c("Johnson","Johnson","Jones","Frank","Frank","Max","Max","Max","Max"),
                    lwr.bin=c(15,  15.5,16  ,16  ,17.1,17.3,NA,NA,NA),
                    upr.bin=c(15.5,16  ,16.5,16.5,17.1,17.3,NA,NA,NA),
                    freq=c(6,4,2,3,1,1,NA,0,NA)) )
expandCounts(d2a,~freq,~lwr.bin+upr.bin)
 
# some need expansion but include NAs for upper values
( d2b <- data.frame(name=c("Johnson","Johnson","Jones","Frank","Frank","Max"),
                    lwr.bin=c(15,  15.5,16  ,16  ,17.1,17.3),
                    upr.bin=c(NA  ,NA  ,16.5,16.5,17.1,17.3),
                    freq=c(6,4,2,3,1,1)) )
expandCounts(d2b,~freq,~lwr.bin+upr.bin)
 
# some need expansion but include NAs for upper values
( d2c <- data.frame(name=c("Johnson","Johnson","Jones","Frank","Frank","Max"),
                    lwr.bin=c(NA,NA,  16  ,16  ,17.1,17.3),
                    upr.bin=c(15,15.5,16.5,16.5,17.1,17.3),
                    freq=c(6,4,2,3,1,1)) )
expandCounts(d2c,~freq,~lwr.bin+upr.bin)

## Not run: 
##D ##!!##!!## Change path to where example file is and then run to demo
##D 
##D ## Read in datafile (note periods in names)
##D df <- read.csv("c:/aaawork/consulting/R_WiDNR/Statewide/Surveysummaries2010.csv")
##D str(df) 
##D ## narrow variables for simplicity
##D df1 <- df[,c("County","Waterbody.Name","Survey.Year","Gear","Species",
##D              "Number.of.Fish","Length.or.Lower.Length.IN","Length.Upper.IN",
##D              "Weight.Pounds","Gender")]
##D ## Sum the count to see how many fish there should be after expansion
##D sum(df1$Number.of.Fish)
##D 
##D ## Simple expansion
##D df2 <- expandCounts(df1,~Number.of.Fish)
##D 
##D ## Same expansion but include random component to lengths (thus new variable)
##D ##   also note default lprec=0.1
##D df3 <- expandCounts(df1,~Number.of.Fish,~Length.or.Lower.Length.IN+Length.Upper.IN)
##D 
## End(Not run)




