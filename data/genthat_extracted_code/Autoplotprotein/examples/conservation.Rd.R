library(Autoplotprotein)


### Name: conservation
### Title: conservation
### Aliases: conservation
### Keywords: conservation file

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function () 
{
    protein = read.table("Protein.txt", sep = "\t", stringsAsFactors = F)
    domain = read.table("Domain.txt", sep = "\t", stringsAsFactors = F)
    length = read.table("Length.txt", sep = "\t", stringsAsFactors = F)
    site = read.table("Site.txt", sep = "\t", stringsAsFactors = F)
    muta = read.table("Mutagenesis.txt", sep = "\t", stringsAsFactors = F)
    option = read.table("Option.txt", sep = "\t", stringsAsFactors = F)
    zoomin = read.table("ZoomIn.txt", sep = "\t", stringsAsFactors = F)
    nameOfYourQuery = option[2, 1]
    additionalOptions = option[2, 2]
    showReferenceSequence = option[2, 3]
    showConservationScore = option[2, 4]
    showGridlinesAtTicks = option[2, 5]
    conservation = option[2, 6]
    zoomIn = zoomin[2, 1]
    zoomStart = zoomin[2, 2]
    zoomEnd = zoomin[2, 3]
    tickSize = as.numeric(zoomin[2, 4])
    referenceSequencePositionInFile = option[2, 7]
    option = read.table("Option.txt", sep = "\t", stringsAsFactors = F)
    a <- read.fasta(file = "alignmentFile.fasta")
    seq <- list()
    for (i in 1:length(a)) {
        seq[[i]] <- a[[i]][1:length(a[[i]])]
    }
    numberOfSeq <- length(seq)
    mat <- matrix(0, nrow = length(a), ncol = length(a[[1]]))
    for (i in 1:length(seq)) {
        mat[i, ] <- seq[[i]]
    }
    df <- as.data.frame(mat)
    tdf <- t(df)
    referenceSequencePositionInFile = option[2, 7]
    referenceSeq <- tdf[which(tdf[, as.numeric(referenceSequencePositionInFile)] != 
        "-"), ]
    referenceSeq <- as.data.frame(referenceSeq)
    write.table(referenceSeq, file = "alignment_table", sep = "\t", 
        quote = F, row.names = F, col.names = F)
    counter <- rep(0, nrow(referenceSeq))
    a <- read.table("alignment_table", sep = "\t")
    a <- data.frame(lapply(a, as.character), stringsAsFactors = FALSE)
    for (i in 1:nrow(a)) {
        a[i, "consensus"] <- paste(as.character(a[i, ]), collapse = "")
    }
    countBases <- function(string) {
        table(strsplit(string, "")[[1]])
    }
    c <- as.character(a[, "consensus"])
    tab <- list()
    for (i in 1:length(c)) {
        tab[[i]] <- countBases(c[i])
    }
    score <- rep(0, nrow(a))
    for (i in 1:length(tab)) {
        for (j in 1:length(tab[[i]])) {
            if ((names(tab[[i]][j])) == a[i, ][as.numeric(referenceSequencePositionInFile)]) 
                score[i] <- tab[[i]][j]
        }
    }
    scorePlot <- -(((score/numberOfSeq)))
    a <- read.fasta(file = "alignmentFile.fasta")
    seqForPlot <- a[[as.numeric(referenceSequencePositionInFile)]][
which(a[[as.numeric(referenceSequencePositionInFile)]] != 
        "-")]
    if (additionalOptions == "yes") {
        if (conservation == "yes") {
            lines(scorePlot, col = "purple3")
        }
    }
    if (additionalOptions == "yes") {
        if (showReferenceSequence == "yes") {
            rect(0, -4.75, length(scorePlot), -5.05, col = "white", 
                border = NA)
            for (i in 1:length(seqForPlot)) {
                text(i, -4.9, toupper(seqForPlot[i]), font = 2, 
                  cex = 1)
            }
        }
    }
    if (additionalOptions == "yes") {
        if (showConservationScore == "yes") {
            rect(0, 0.3, length(scorePlot), 0.7, col = "white", 
                border = NA)
            for (i in 1:length(seqForPlot)) {
                text(i, 0.5, toupper(abs(round(scorePlot[i], 
                  1))), font = 2, cex = 0.8, srt = 90, col = "purple3")
            }
        }
    }
  }



