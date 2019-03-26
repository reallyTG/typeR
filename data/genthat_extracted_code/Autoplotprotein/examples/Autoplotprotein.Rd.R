library(Autoplotprotein)


### Name: Autoplotprotein
### Title: Two - dimensional structure of protein
### Aliases: Autoplotprotein
### Keywords: Autoplotprotein

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function () 
{
    library("ade4")
    library("seqinr")
    library("plotrix")
    protein = read.table("Protein.txt", sep = "\t", stringsAsFactors = F)
    domain = read.table("Domain.txt", sep = "\t", stringsAsFactors = F)
    length = read.table("Length.txt", sep = "\t", stringsAsFactors = F)
    site = read.table("Site.txt", sep = "\t", stringsAsFactors = F)
    muta = read.table("Mutagenesis.txt", sep = "\t", stringsAsFactors = F)
    option = read.table("Option.txt", sep = "\t", stringsAsFactors = F)
    zoomin = read.table("ZoomIn.txt", sep = "\t", stringsAsFactors = F)
    size <- c(10.5, 7.27)
    high <- c(1, -1)
    sizen = size[1]
    highn = high[1]
    if (option[2, 2] == "no") {
        sizen = size[2]
        highn = high[2]
    }
    path = protein[1]
    pdf(as.character(path), height = sizen[1], width = 11)
    layout(matrix(c(1, 2), nrow = 1), widths = c(1, 3))
    par(oma = c(3, 0, 2, 0), mar = c(4, 0, 2, 0) + 0.4)
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
    plot((-30:-15), rep(-1, 16), col = "white", type = "l", ann = FALSE, 
        bty = "n", xaxt = "n", yaxt = "n", xlim = c(-160, -15), 
        ylim = c(highn[1], -5.5))
    if (additionalOptions == "yes") {
        if (conservation == "yes") {
            lines((-30:-15), rep(0, 16), col = "purple3")
            lines((-30:-15), rep(-0.5, 16), col = "purple3")
            lines((-30:-15), rep(-1, 16), col = "purple3")
            text(-100, -0.5, "Conservation", col = "purple3", 
                cex = 0.9, font = 2)
            text(-45, -1, "1", col = "purple3", cex = 0.9)
            text(-45, -0.5, "0.5", col = "purple3", cex = 0.9)
            text(-45, 0, "0", col = "purple3", cex = 0.9)
        }
    }
    if (additionalOptions == "yes") {
        if (showReferenceSequence == "yes") {
            text(-100, -4.9, "Reference", col = "black", cex = 0.9, 
                font = 2)
        }
    }
    if (additionalOptions == "yes") {
        if (showConservationScore == "yes") {
            text(-100, 0.5, "Score", col = "purple3", cex = 0.9, 
                font = 2)
        }
    }
    text(-100, -2.95, nameOfYourQuery, col = "blue", cex = 0.9, 
        font = 2)
    Protein = function(start = 1, end, height = -0.3, color = "green", 
        face = "stereoscopic") {
        x = 0
        kong1 = (round(log(start, 10)) + 1) * start/50
        kong2 = (round(log(end, 10)) + 1) * end/50
        if (round(log(end, 10)) + 1 <= 5) {
            kong2 = (round(log(end, 10)) + 1) * end/50
        }
        else {
            kong2 = 5 * end/50
        }
        h1 = -2.8
        h2 = -3.1
        boxplot((1:as.numeric(end)), rep(h1, as.numeric(end)), 
            xlab = "Amino Acid Position", ylab = "", xlim = c(0, 
                as.numeric(end)), ylim = c(highn[1], -5.5), axes = FALSE)
        if (face == "stereoscopic") {
            cylindrect(start, h1, end, h2, col = color, gradient = "y")
        }
        else {
            rect(start, h1, end, h2, col = color)
        }
        text(0, h1 - height/2, start, adj = 1)
        text(end - 17, h1 - height/2, end, adj = 0)
    }
    ZoomIn = function(start = 1, end, height = -0.3, color = "green", 
        face = "stereoscopic", zoomstart, zoomend) {
        x = 0
        kong1 = (round(log(start, 10)) + 1) * start/50
        kong2 = (round(log(end, 10)) + 1) * end/50
        if (round(log(end, 10)) + 1 <= 5) {
            kong2 = (round(log(end, 10)) + 1) * end/50
        }
        else {
            kong2 = 5 * end/50
        }
        h1 = -2.8
        h2 = -3.1
        boxplot((as.numeric(zoomstart):as.numeric(zoomend)), 
            rep(h1, as.numeric(zoomend)), xlab = "Amino Acid Position", 
            ylab = "", xlim = c(as.numeric(zoomstart), as.numeric(zoomend)), 
            ylim = c(highn[1], -5.5), axes = FALSE)
        if (face == "stereoscopic") {
            cylindrect(start, h1, end, h2, col = color, gradient = "y")
        }
        else {
            rect(start, h1, end, h2, col = color)
        }
        text(start, h1 + height/2, start, adj = 1)
        text(end, h1 + height/2, end, adj = 0)
    }
    if (zoomIn == "yes") {
        ZoomIn(start = as.numeric(length[1]), end = as.numeric(length[2]), 
            height = as.numeric(protein[4]), color = as.character(protein[5]), 
            face = protein[6], zoomstart = zoomin[2, 2], zoomend = zoomin[2, 
                3])
    }
    else {
        Protein(start = as.numeric(length[1]), end = as.numeric(length[2]), 
            height = as.numeric(protein[4]), color = as.character(protein[5]), 
            face = protein[6])
    }
    legend("topleft", legend = c("mutation", "Protein Domain"), 
        pch = c(19, 15), col = c("lightseagreen", "deeppink"), 
        box.col = "white", bg = "white", pt.cex = 1.5, text.width = 1)
    ticks = seq(0, as.numeric(length[2]), by = tickSize)
    axis(side = 1, at = ticks, las = 3)
    if (additionalOptions == "yes") {
        if (showGridlinesAtTicks == "yes") {
            len = array(rep(1:as.numeric(length[2])))
            for (i in 1:length(len)) {
                abline(v = ticks[i], lty = 3, lwd = 0.5, col = "lightgray")
            }
        }
    }
  }



