library(Autoplotprotein)


### Name: plotmutagensis
### Title: ploting mutagensis
### Aliases: plotmutagensis
### Keywords: mutagensis file

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
    Mutagenesis = function(position, position2, color, height2, 
        height, up_down, start, end, pc, cex1) {
        h1 = -0.1
        h2 = -1.4
        h = -1.6
        hh1 = -2.8
        if (up_down == "up") {
            if (position == position2) {
                segments(position, hh1 + height, position, hh1 + 
                  height + h)
            }
            else {
                segments(position, hh1 + height, position, hh1 + 
                  height + h1)
                segments(position2, hh1 + height + h - h2, position2, 
                  hh1 + height + h)
                segments(position, hh1 + height + h1, position2, 
                  hh1 + height + h - h2)
            }
        }
        x = 0
        kong1 = (round(log(start, 10)) + 1) * start/50
        kong2 = (round(log(end, 10)) + 1) * end/50
        if (round(log(end, 10)) + 1 <= 5) {
            kong2 = (round(log(end, 10)) + 1) * end/50
        }
        else {
            kong2 = 5 * end/50
        }
        boxplot(x, xlim = c(start - kong1, end + kong2), ylim = c(1, 
            -5.5), axes = FALSE, add = TRUE, border = FALSE)
        points(position2, height2, pch = pc, col = color, cex = cex1)
    }
    Change_h = function(muta_pos, muta_name, protein_h) {
        d = 0.1
        d1 = 0.26
        hh1 = -2.8
        height2 = 1:length(muta_pos)
        height2[1] = hh1 + protein_h - d1
        position_h = muta_pos
        position_h[1] = muta_pos[1]
        if (length(muta_pos) > 1) {
            for (i in 2:length(muta_pos)) {
                if (muta_pos[i] == position_h[i - 1]) {
                  height2[i] = height2[i - 1] - d
                }
                else {
                  height2[i] = hh1 + protein_h - d1
                }
            }
        }
        height2
    }
    Change_m = function(muta, protein_width) {
        dec = 1.4 * protein_width/100
        position3 = 1:length(muta)
        position3[1] = muta[1]
        if (length(muta) > 1) {
            for (i in 2:length(muta)) {
                if (muta[i] - muta[i - 1] <= dec) {
                  if (muta[i] != muta[i - 1]) {
                    position3[i] = position3[i - 1] + dec
                  }
                  else {
                    position3[i] = position3[i - 1]
                  }
                }
                else {
                  position3[i] = muta[i]
                }
            }
        }
        position3
    }
    if (!is.na(muta[1, 1])) {
        position3 = Change_m(muta[, 1], as.numeric(length[2]))
        height2 = Change_h(muta[, 1], muta[, 2], as.numeric(protein[4]))
        for (i in 1:nrow(muta)) {
            Mutagenesis(position = as.numeric(muta[i, 1]), position2 = position3[i], 
                color = as.character(muta[i, 2]), height2 = height2[i], 
                height = as.numeric(protein[4]), up_down = "up", 
                start = as.numeric(length[1]), end = as.numeric(length[2]), 
                pc = as.numeric(protein[7]), cex1 = as.numeric(protein[8]))
        }
    }
  }



