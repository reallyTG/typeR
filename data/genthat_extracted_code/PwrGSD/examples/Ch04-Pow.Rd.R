library(PwrGSD)


### Name: Pow
### Title: The Wang-Tsiatis Power Alpha Spending Function
### Aliases: Pow
### Keywords: htest design

### ** Examples

## example 1: what is the result of calling a spending function
    ## A call to 'Pow' just returns the call
    Pow(rho=2)

    ## It does argument checking...the following results in an error:
    ## Not run: 
##D       Pow()
##D     
## End(Not run)
    
    ## it doesn't matter whether the argument is named or not,
    ## either produces the same result
    Pow(2)

    ## but really its value is a list with a component named
    ## 'type' equal to "Pow", a component named 'rho' equal
    ## to the numeric value passed to the single argument 'rho'
    ## and a component  named 'call' equal to the call.
    names(Pow(rho=2))
    
    names(Pow(2))
    
    Pow(rho=2)$type
    Pow(rho=2)$rho
    Pow(rho=2)$call    

## example 2: ...But the intended purpose of the spending functions is
## in constructing calls to 'GrpSeqBnds' and to 'PwrGSD':
     

    frac <- c(0.07614902,0.1135391,0.168252,0.2336901,0.3186155,
              0.4164776,0.5352199,0.670739,0.8246061,1)
    drift <- c(0.3836636,0.5117394,0.6918584,0.8657705,1.091984,
               1.311094,1.538582,1.818346,2.081775,2.345386)

    test <- GrpSeqBnds(frac=frac, EfficacyBoundary=LanDemets(alpha=0.05, spending=Pow(2)),
                       FutilityBoundary=LanDemets(alpha=0.10, spending=ObrienFleming),
                       drift=drift)



