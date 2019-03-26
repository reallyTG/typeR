###
### NEEDLES.R - Package test code
###

options(warn=1)
library(NameNeedle)
source("checkFuncs")

extdata.dir <- system.file("extdata", package="NameNeedle")
data(cellLineNames)


## Change the default settings...
needleParams <- defaultNeedleParams
needleParams$MISMATCH <- -2
needleParams$MATCH <- 2

## Match RPPA names to SF2 names
matchscore <- matchcode <- rep(NA, length(sf2Names))
for (j in seq_along(sf2Names)) {
    scores <- sapply(rppaNames,
                     function(x, y) {
                         needles(x, y, needleParams)$score
                     },
                     y=sf2Names[j])
    matchcode[j] <- paste(which(scores == max(scores)), collapse=',')
    matchscore[j] <- max(scores)
}

rppaMatch <- sapply(matchcode,
                    function(x) {
                        y <- as.numeric(strsplit(x, ',')[[1]])
                        paste(rppaNames[y], collapse="; ")
                    })

## Match Illumina names to SF2 names
imatchscore <- imatchcode <- rep(NA, length(sf2Names))
for (j in seq_along(sf2Names)) {
    scores <- sapply(illuNames,
                     function(x, y) {
                         needles(x, y, needleParams)$score
                     },
                     y=sf2Names[j])
    imatchcode[j] <- paste(which(scores == max(scores)), collapse=',')
    imatchscore[j] <- max(scores)
}

illuMatch <- sapply(imatchcode,
                    function(x) {
                        y <- as.numeric(strsplit(x, ',')[[1]])
                        paste(illuNames[y], collapse="; ")
                    })

## Collect aggregated output
matcher <- data.frame(rppaMatch=rppaMatch,
                      rppaScore=matchscore,
                      illuMatch=illuMatch,
                      illuScore=imatchscore)

## Save results to disk (uncomment iff code changed)
prevResults.filename <- "namesMatched.tsv"
# uncomment iff code changed - replace existing results manually
#write.table(matcher, file=prevResults.filename, sep='\t', quote=FALSE, col.names=NA)

## Retrieve previous results
prevResults <- local({
    prevResults.pathname <- file.path(extdata.dir, prevResults.filename)
    colClasses <- c("integer", rep(c("factor", "numeric"), 2))
    df <- read.delim(prevResults.pathname, colClasses=colClasses, header=TRUE)
    df[, -1]    ## Toss unwanted first column (row numbers)
})

## Verify against previous results
checkIdentical(matcher, prevResults)

