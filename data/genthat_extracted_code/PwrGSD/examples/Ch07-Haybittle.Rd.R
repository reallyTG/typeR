library(PwrGSD)


### Name: Haybittle
### Title: The Haybittle method of Boundary Construction
### Aliases: Haybittle
### Keywords: htest design

### ** Examples

## example 1: what is the result of calling a Boundary Construction Method function
    ## A call to 'Haybittle' just returns the call
    Haybittle(alpha=0.05, b.Haybittle=3)
    
    ## It does arguement checking...this results in an error
    ## Not run: 
##D       Haybittle(alpha=0.05)
##D     
## End(Not run)
    
    ## but really its value is a list with the a component containing
    ## the boundary method type, "LanDemts", and components for each
    ## of the arguments.
    names(Haybittle(alpha=0.05, b.Haybittle=3))

    Haybittle(alpha=0.05, b.Haybittle=3)$type
    Haybittle(alpha=0.05, b.Haybittle=3)$alpha
    Haybittle(alpha=0.05, b.Haybittle=3)$b.Haybittle
    Haybittle(alpha=0.05, b.Haybittle=3)$call

## example 2: ...But the intended purpose of the spending functions 
## is in constructing calls to 'GrpSeqBnds' and to 'PwrGSD':
     

    frac <- c(0.07614902,0.1135391,0.168252,0.2336901,0.3186155,
              0.4164776,0.5352199,0.670739,0.8246061,1)

    test <- GrpSeqBnds(frac=frac, EfficacyBoundary=Haybittle(alpha=0.025, b.Haybittle=3))



