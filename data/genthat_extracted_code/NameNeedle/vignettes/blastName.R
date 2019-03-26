### R code from vignette source 'blastName.Rnw'

###################################################
### code chunk number 1: lib
###################################################
library(NameNeedle)


###################################################
### code chunk number 2: one
###################################################
needles("hcc-123", "hcc1243")


###################################################
### code chunk number 3: default
###################################################
defaultNeedleParams


###################################################
### code chunk number 4: myParam
###################################################
myParams <- defaultNeedleParams
myParams$MISMATCH <- -2
myParams$MATCH <- 2


###################################################
### code chunk number 5: two
###################################################
needles("hcc-123", "hcc1243", myParams)


###################################################
### code chunk number 6: data
###################################################
data(cellLineNames)
ls()


###################################################
### code chunk number 7: sf2
###################################################
class(sf2Names)
length(sf2Names)
sf2Names[1:10]


###################################################
### code chunk number 8: rppa
###################################################
class(rppaNames)
length(rppaNames)
rppaNames[1:10]


###################################################
### code chunk number 9: illu
###################################################
class(illuNames)
length(illuNames)
summary(illuType)
illuNames[1:10]


###################################################
### code chunk number 10: tester
###################################################
probeName <- sf2Names[6]
probeName


###################################################
### code chunk number 11: scores
###################################################
scores <- needleScores(probeName, illuNames, myParams)
summary(scores)


###################################################
### code chunk number 12: w
###################################################
w <- which(scores==max(scores))
illuNames[w]


###################################################
### code chunk number 13: matchRPPA
###################################################
go <- proc.time()
matchscore <- matchcode <- rep(NA, length(sf2Names))
for (j in 1:length(sf2Names)) {
  scores <- needleScores(sf2Names[j], rppaNames, myParams)
  matchcode[j] <- paste(which(scores==max(scores)), collapse=',')
  matchscore[j] <- max(scores)
}
used <- proc.time() - go


###################################################
### code chunk number 14: rppaMatch
###################################################
rppaMatch <- sapply(matchcode, function(x) {
  y <- as.numeric(strsplit(x, ',')[[1]])
  paste(rppaNames[y], collapse="; ")
})


###################################################
### code chunk number 15: mismatch
###################################################
i <- 116
sf2Names[i]
rppaMatch[i]


###################################################
### code chunk number 16: needles
###################################################
x <- needles("HCC-2998", "HCC2279", myParams)
x$align1
x$align2


###################################################
### code chunk number 17: illuMatch
###################################################
go <- proc.time()
imatchscore <- imatchcode <- rep(NA, length(sf2Names))
for (j in 1:length(sf2Names)) {
  scores <- needleScores(sf2Names[j], illuNames, myParams)
  imatchcode[j] <- paste(which(scores==max(scores)), collapse=',')
  imatchscore[j] <- max(scores)
}
illuMatch <- sapply(imatchcode, function(x) {
  y <- as.numeric(strsplit(x, ',')[[1]])
  paste(illuNames[y], collapse="; ")
})
iused <- proc.time() - go
used
iused
used + iused


###################################################
### code chunk number 18: results
###################################################
matcher <- data.frame(rppaMatch=rppaMatch, rppaScore=matchscore,
                      illuMatch=illuMatch, illuScore=imatchscore)#,combined)
rownames(matcher) <- sf2Names
matcher[1:10,]


###################################################
### code chunk number 19: blastName.Rnw:221-226 (eval = FALSE)
###################################################
## combined <- read.table("combined.tsv", sep="\t", header=TRUE, row.names=1)
## matcher <- data.frame(rppaMatch=rppaMatch, rppaScore=matchscore,
##                       illuMatch=illuMatch, illuScore=imatchscore,
##                       combined)
## write.table(matcher, file="namesMatched.tsv", sep="\t", quote=FALSE, col.names=NA)


