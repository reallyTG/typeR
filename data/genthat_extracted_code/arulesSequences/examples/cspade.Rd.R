library(arulesSequences)


### Name: cspade
### Title: Mining Associations with cSPADE
### Aliases: cspade
### Keywords: models

### ** Examples

## use example data from paper
data(zaki)
## get support bearings
s0 <- cspade(zaki, parameter = list(support = 0,
                                    maxsize = 1, maxlen = 1),
                   control   = list(verbose = TRUE))
as(s0, "data.frame")
## mine frequent sequences
s1 <- cspade(zaki, parameter = list(support = 0.4), 
		   control   = list(verbose = TRUE, tidLists = TRUE))
summary(s1)
as(s1, "data.frame")

##
summary(tidLists(s1))
transactionInfo(tidLists(s1))

## use timing constraint
s2 <- cspade(zaki, parameter = list(support = 0.4, maxgap = 5))
as(s2, "data.frame")

## use classification
t <- zaki
transactionInfo(t)$classID <-
    as.integer(transactionInfo(t)$sequenceID) %% 2 + 1L
s3 <- cspade(t, parameter = list(support = 0.4, maxgap = 5))
as(s3, "data.frame")

## replace timestamps
t <- zaki
transactionInfo(t)$eventID <-
    unlist(tapply(seq(t), transactionInfo(t)$sequenceID,
	function(x) x - min(x) + 1), use.names = FALSE)
as(t, "data.frame")
s4 <- cspade(t, parameter = list(support = 0.4))
s4
identical(as(s1, "data.frame"), as(s4, "data.frame"))

## work around
s5 <- cspade(zaki, parameter = list(support = .25, maxgap = 5))
length(s5)
k <- support(s5, zaki, control   = list(verbose = TRUE,
                       parameter = list(maxwin = 5)))
table(size(s5[k == 0]))

## Not run: 
##D ## use generated data
##D t <- read_baskets(con  = system.file("misc", "test.txt", package =
##D 				      "arulesSequences"),
##D 		  info = c("sequenceID", "eventID", "SIZE"))
##D summary(t)
##D ## use low support
##D s6 <- cspade(t, parameter = list(support = 0.0133), 
##D 		control   = list(verbose = TRUE))
##D summary(s6)
##D 
##D ## check
##D k <- support(s6, t, control = list(verbose = TRUE))
##D table(size(s6), sign(quality(s6)$support -k))
##D 
##D ## use low confidence
##D r6 <- ruleInduction(s6, confidence = .5,
##D 			control    = list(verbose = TRUE))
##D summary(r6)
## End(Not run)



