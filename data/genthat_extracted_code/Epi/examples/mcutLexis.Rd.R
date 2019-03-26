library(Epi)


### Name: mcutLexis
### Title: Cut follow-up at multiple event dates and keep track of order of
###   events
### Aliases: mcutLexis
### Keywords: survival

### ** Examples

# A dataframe of times
set.seed(563248)
dd <- data.frame( id = 1:10,
                 doN = round(runif(10,-30, 0),1),
                 doE = round(runif(10,  0,20),1),
                 doX = round(runif(10, 50,60),1),
                 doD = round(runif(10, 50,60),1),
                 # these are the event times
                 doA = c(NA,20,NA,27,35,NA,52, 5,43,80),
                 doB = c(25,NA,37,40,NA,NA,15,23,36,61) )

# set up a Lexis object with time from entry to death/exit
Lx <- Lexis( entry = list(time=doE,
                           age=doE-doN),
              exit = list(time=pmin(doX,doD)),
       exit.status = factor(doD<doX,labels=c("OK","D")),
              data = dd )
summary( Lx )

# cut the follow-up at dates doA and doB
L2 <- mcutLexis( Lx, "time", wh=c("doA","doB"),
                 new.states = c("A","B"),
           precursor.states = "OK",
                 seq.states = TRUE,
                 new.scales = c("tfA","tfB") )
summary( L2 )
L2

# show the states
boxes( L2, boxpos=list(x=c(10,50,50,90,50,90),
                       y=c(50,90,50,90,10,10)),
           show.R=FALSE, show.BE=TRUE )


L3 <- mcutLexis( Lx, "time", wh=c("doA","doB"),
                 new.states = c("A","B"),
           precursor.states = "OK",
                 seq.states = FALSE,
                 new.scales = c("tfA","tfB") )
summary( L3 )
boxes( L3, boxpos=list(x=c(10,50,50,90,50),
                       y=c(50,90,50,50,10)),
           show.R=FALSE, show.BE=TRUE )



