library(AICcmodavg)


### Name: newt
### Title: Newt Capture-mark-recapture Data
### Aliases: newt
### Keywords: datasets

### ** Examples

data(newt)
str(newt)

##convert raw capture data to capture histories
captures <- newt[, c("T1975", "T1976", "T1977", "T1978", "T1979",
                      "T1980", "T1981", "T1982", "T1983")]
newt.ch <- apply(captures, MARGIN = 1, FUN = function(i)
                  paste(i, collapse = ""))

##organize as a data frame readable by RMark package (Laake 2013)
##RMark requires at least one column called "ch" 
##and another "freq" if summarized captures are provided
newt.full <- data.frame(ch = rep(newt.ch, 2),
                        freq = c(newt$Males, newt$Females),
                        Sex = c(rep("male", length(newt.ch)),
                        rep("female", length(newt.ch))))
str(newt.full)
newt.full$ch <- as.character(newt.full$ch)

##delete rows with 0 freqs
newt.full.orig <- newt.full[which(newt.full$freq != 0), ]



