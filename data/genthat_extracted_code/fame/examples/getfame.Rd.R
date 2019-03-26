library(fame)


### Name: getfame
### Title: Fame Interface
### Aliases: getfame putfame fameWhats fameWildlist
### Keywords: ts database

### ** Examples

## Not run: 
##D mydb <- "pathToMyDatabase"
##D boink <- getfame("gdp.q", db = mydb)     ## returns a list
##D gpd.q <- boink[[1]]                      ## or boink$gdp.q
##D getfame("gdp.q", db = mydb, save = TRUE) ## saves gdp.q in the current frame
##D 
##D ## saves the series as "nominalIncome"
##D getfame(c(nominalIncome = "gdp.q"), db = mydb, save = TRUE)
##D seriesA <- tis(1:24, start = c(2002, 1), freq = 12)
##D seriesB <- tis(1:104, start = c(2002, 1), tif = "wmonday")
##D documentation(seriesB) <- paste("Line", 1:4, "of seriesB documentation")
##D ## store them as "mser" and "wser"
##D putfame(c(mser = "seriesA", wser = "seriesB"), db = "myfame.db")
##D 
##D matrixSeries <- cbind(a = seriesA, b = seriesA + 3)
##D putfame(matrixSeries, db = "myfame.db") ## stores as "a" and "b" in Fame
##D 
##D ## storing a scalar as "myscalar"
##D putfame(c(myscalar = 42), db = "myfame.db") 
##D 
##D fameWildlist("myfame.db")
##D fameWhats("myfame.db", fname = "wser", getDoc = TRUE)
## End(Not run)



