library(AICcmodavg)


### Name: salamander
### Title: Salamander Capture-mark-recapture Data
### Aliases: salamander
### Keywords: datasets

### ** Examples

data(salamander)
str(salamander)

##convert raw capture data to capture histories
captures <- salamander[, c("T1959", "T1960", "T1961", "T1962", "T1963")]
salam.ch <- apply(captures, MARGIN = 1, FUN = function(i)
                  paste(i, collapse = ""))

##organize as a data frame readable by RMark package (Laake 2013)
##RMark requires at least one column called "ch" 
##and another "freq" if summarized captures are provided
salam.full <- data.frame(ch = rep(salam.ch, 2),
                         freq = c(salamander$Males, salamander$Females),
                         Sex = c(rep("male", length(salam.ch)),
                           rep("female", length(salam.ch))))
str(salam.full)
salam.full$ch <- as.character(salam.full$ch)

##delete rows with 0 freqs
salam.full.orig <- salam.full[which(salam.full$freq != 0), ]



