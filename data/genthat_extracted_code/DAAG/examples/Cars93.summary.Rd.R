library(DAAG)


### Name: Cars93.summary
### Title: A Summary of the Cars93 Data set
### Aliases: Cars93.summary
### Keywords: datasets

### ** Examples

type <- Cars93.summary$abbrev
type <- Cars93.summary[,4]
type <- Cars93.summary[,"abbrev"]
type <- Cars93.summary[[4]] # Take the object that is stored
                            # in the fourth list element.
type
pause()

attach(Cars93.summary)
  # R can now access the columns of Cars93.summary directly
abbrev
detach("Cars93.summary")
pause()

#  To change the name of the \verb!abbrev! variable (the fourth column)
names(Cars93.summary)[4] <- "code"
pause()

#  To change all of the names, try
names(Cars93.summary) <- c("minpass","maxpass","number","code")




