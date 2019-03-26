library(poker)


### Name: cgiPlayers
### Title: cgiPlayers
### Aliases: cgiPlayers

### ** Examples

alias <- c("Player1","Player2","Player3","Player4","Player5")
alias <- c(alias,"Player6","Player7","Player8","Player9")
cols1thru5 <- c(2,8,12,14,10,6,14,8,4,2,3,2,4,1,4,3,1,1,13,4,4,5,3,9,8,12,7)
cols1thru5 <- c(cols1thru5,3,4,3,2,2,4,2,1,1,3,3,3,3,3,3,3,3,3)
cols6thru10 <- c(1,1,1,1,1,1,1,1,1,10,10,10,10,10,10,10,10,10,4,4,4,4,4,4,4,4,4)
cols6thru10 <- c(cols6thru10,12,12,12,12,12,12,12,12,12,4,4,4,4,4,4,4,4,4)
cols11thru14 <- c(11,11,11,11,11,11,11,11,11,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2)
cols11thru14 <- c(cols11thru14,3,3,3,3,3,3,3,3,3)
cards <- matrix(c(cols1thru5,cols6thru10,cols11thru14),nrow=9,ncol=14); cards
cgiPlayers(1,alias,9,cards)
cgiPlayers(2,alias,9,cards)
cgiPlayers(3,alias,9,cards)
cgiPlayers(4,alias,9,cards)



