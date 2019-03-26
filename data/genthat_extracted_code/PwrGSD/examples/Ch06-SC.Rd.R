library(PwrGSD)


### Name: SC
### Title: The Stochastic Curtailment method of Boundary Construction
### Aliases: SC
### Keywords: htest design

### ** Examples

## example 1: what is the result of calling a Boundary Construction Method function
    ## A call to 'SC' just returns the call
    SC(be.end=2.10, prob=0.90)
    
    ## It does arguement checking...this results in an error
    ## Not run: 
##D       SC(be.end=2.10)
##D     
## End(Not run)
    
    ## but really its value is a list with the a component containing
    ## the boundary method type, "LanDemts", and components for each
    ## of the arguments.
    names(SC(be.end=2.10, prob=0.90))

    SC(be.end=2.10, prob=0.90, drift.end=2.34)$type
    SC(be.end=2.10, prob=0.90, drift.end=2.34)$be.end
    SC(be.end=2.10, prob=0.90, drift.end=2.34)$prob
    SC(be.end=2.10, prob=0.90, drift.end=2.34)$drift.end

## example 2: ...But the intended purpose of the spending functions is
## in constructing calls to 'GrpSeqBnds' and to 'PwrGSD':
     

    frac <- c(0.07614902,0.1135391,0.168252,0.2336901,0.3186155,
              0.4164776,0.5352199,0.670739,0.8246061,1)
    drift <- c(0.3836636,0.5117394,0.6918584,0.8657705,1.091984,
	      1.311094,1.538582,1.818346,2.081775,2.345386)

    test <- GrpSeqBnds(frac=frac, EfficacyBoundary=LanDemets(alpha=0.05, spending=ObrienFleming),
                       FutilityBoundary=SC(be.end=2.10, prob=0.90, drift.end=drift[10]),
                       drift=drift)



