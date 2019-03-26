library(qdap)


### Name: phrase_net
### Title: Phrase Nets
### Aliases: phrase_net
### Keywords: phrase_net

### ** Examples

## Not run: 
##D x <- "Questions must be at least 2 days old to be eligible for a bounty.
##D     There can only be 1 active bounty per question at any given time.
##D     Users must have at least 75 reputation to offer a bounty, and may
##D     only have a maximum of 3 active bounties at any given time. The
##D     bounty period lasts 7 days. Bounties must have a minimum duration of
##D     at least 1 day. After the bounty ends, there is a grace period of 24
##D     hours to manually award the bounty. If you do not award your bounty
##D     within 7 days (plus the grace period), the highest voted answer
##D     created after the bounty started with at least 2 upvotes will be
##D     awarded half the bounty amount. If there's no answer meeting that
##D     criteria, the bounty is not awarded to anyone. If the bounty was
##D     started by the question owner, and the question owner accepts an
##D     answer during the bounty period, and the bounty expires without an
##D     explicit award - we assume the bounty owner liked the answer they
##D     accepted and award it the full bounty amount at the time of bounty
##D     expiration. In any case, you will always give up the amount of
##D     reputation specified in the bounty, so if you start a bounty, be sure
##D     to follow up and award your bounty to the best answer! As an
##D     additional bonus, bounty awards are immune to the daily reputation
##D     cap and community wiki mode."
##D 
##D phrase_net(sent_detect(x), r=.5)
##D library(igraph)
##D plot(phrase_net(sent_detect(x), r=.5), edge.curved = FALSE)
##D 
##D ## Declaration of Independence Example
##D y <- readLines("http://www.constitution.org/usdeclar.txt")
##D y <- paste(y[grep("When, in the", y):length(y)], collapse=" ")
##D phrase_net(sent_detect(y), r=.7)
##D 
##D 
##D ## Multiple grouping variables
##D z <- lapply(split(raj.act.1$dialogue, raj.act.1$person), paste, collapse = " ")
##D par(mfrow=c(2, 5), mai = c(.05, 0.15, 0.15, 0.15))
##D lapply(seq_along(z), function(i) {
##D     x <- try(phrase_net(sent_detect(z[i]), r=.6))
##D     if (!inherits(x, "try-error")) {
##D         print(x)
##D         box()
##D         mtext(names(z)[i])
##D     }
##D }) 
##D 
##D 
##D lapply(seq_along(z), function(i) {
##D     x <- try(phrase_net(sent_detect(z[i]), r=.6))
##D     if (!inherits(x, "try-error")) {
##D         dev.new()
##D         print(x)
##D         mtext(names(z)[i], padj=-1, cex=1.7, col="red")
##D     }
##D }) 
## End(Not run)



