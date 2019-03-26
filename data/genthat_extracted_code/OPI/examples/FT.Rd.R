library(OPI)


### Name: FT
### Title: Full Threshold
### Aliases: FT FT.start FT.step FT.stop FT.final FT.final.details
### Keywords: misc

### ** Examples

    # Stimulus is Size III white-on-white as in the HFA
makeStim <- function(db, n) { 
    s <- list(x=9, y=9, level=dbTocd(db), size=0.43, color="white",
             duration=200, responseWindow=1500)
    class(s) <- "opiStaticStimulus"

    return(s)
}
chooseOpi("SimHenson")
if (!is.null(opiInitialize(type="C", cap=6)))
    stop("opiInitialize failed")

result <- FT(makeStim=makeStim, tt=30, fpr=0.15, fnr=0.01)

if (!is.null(opiClose()))
    warning("opiClose() failed")

    ##############################################
    # This section is for multiple FTs
    ##############################################
makeStimHelper <- function(db,n, x, y) {  # returns a function of (db,n)
    ff <- function(db, n) db+n

    body(ff) <- substitute(
        {s <- list(x=x, y=y, level=dbTocd(db), size=0.43, color="white",
                  duration=200, responseWindow=1500)
         class(s) <- "opiStaticStimulus"
         return(s)
        }
        , list(x=x,y=y))
    return(ff)
}

    # List of (x, y, true threshold) triples
locations <- list(c(9,9,30), c(-9,-9,32), c(9,-9,31), c(-9,9,33))

    # Setup starting states for each location
states <- lapply(locations, function(loc) {
    FT.start( makeStim=makeStimHelper(db,n,loc[1],loc[2]),
              tt=loc[3], fpr=0.03, fnr=0.01)
})

    # Loop through until all states are "stop"
while(!all(st <- unlist(lapply(states, FT.stop)))) {
    i <- which(!st)                         # choose a random, 
    i <- i[runif(1, min=1, max=length(i))]  # unstopped state
    r <- FT.step(states[[i]])               # step it
    states[[i]] <- r$state                  # update the states
}

finals <- lapply(states, FT.final)    # get final estimates of threshold
for(i in 1:length(locations)) {
    cat(sprintf("Location (%+2d,%+2d) ",locations[[i]][1], locations[[i]][2]))
    cat(sprintf("has threshold %4.2f\n", finals[[i]]))
}

if (!is.null(opiClose()))
    warning("opiClose() failed")





