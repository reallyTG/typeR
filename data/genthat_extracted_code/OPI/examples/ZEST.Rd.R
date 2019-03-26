library(OPI)


### Name: ZEST
### Title: ZEST
### Aliases: ZEST ZEST.start ZEST.step ZEST.stop ZEST.final QUEST
### Keywords: misc

### ** Examples

chooseOpi("SimHenson")
if (!is.null(opiInitialize(type="C", cap=6)))
    stop("opiInitialize failed")

    ##############################################
    # This section is for single location ZESTs
    ##############################################

    # Stimulus is Size III white-on-white as in the HFA
makeStim <- function(db, n) { 
    s <- list(x=9, y=9, level=dbTocd(db), size=0.43, color="white",
             duration=200, responseWindow=1500)
    class(s) <- "opiStaticStimulus"

    return(s)
}

repp <- function(...) sapply(1:50, function(i) ZEST(makeStim=makeStim, ...))
a <- repp(stopType="H", stopValue=  3, verbose=0, tt=30, fpr=0.03)
b <- repp(stopType="S", stopValue=1.5, verbose=0, tt=30, fpr=0.03)
c <- repp(stopType="S", stopValue=2.0, verbose=0, tt=30, fpr=0.03)
d <- repp(stopType="N", stopValue= 50, verbose=0, tt=30, fpr=0.03)
e <- repp(prior=dnorm(0:40,m=0,s=5), tt=30, fpr=0.03)
f <- repp(prior=dnorm(0:40,m=10,s=5), tt=30, fpr=0.03)
g <- repp(prior=dnorm(0:40,m=20,s=5), tt=30, fpr=0.03)
h <- repp(prior=dnorm(0:40,m=30,s=5), tt=30, fpr=0.03)

layout(matrix(1:2,1,2))
boxplot(lapply(list(a,b,c,d,e,f,g,h), function(x) unlist(x["final",])))
boxplot(lapply(list(a,b,c,d,e,f,g,h), function(x) unlist(x["npres",])))

    ##############################################
    # This section is for multiple ZESTs
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
    ZEST.start(
        domain=-5:45,
        minStimulus=0,
        maxStimulus=40,
        makeStim=makeStimHelper(db,n,loc[1],loc[2]),
        stopType="S", stopValue= 1.5, tt=loc[3], fpr=0.03, fnr=0.01)
})

    # Loop through until all states are "stop"
while(!all(st <- unlist(lapply(states, ZEST.stop)))) {
    i <- which(!st)                         # choose a random, 
    i <- i[runif(1, min=1, max=length(i))]  # unstopped state
    r <- ZEST.step(states[[i]])             # step it
    states[[i]] <- r$state                  # update the states
}

finals <- lapply(states, ZEST.final)    # get final estimates of threshold
for(i in 1:length(locations)) {
    #cat(sprintf("Location (%+2d,%+2d) ",locations[[i]][1], locations[[i]][2]))
    #cat(sprintf("has threshold %4.2f\n", finals[[i]]))
}

if (!is.null(opiClose()))
    warning("opiClose() failed")



