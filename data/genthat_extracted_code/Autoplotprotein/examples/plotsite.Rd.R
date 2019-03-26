library(Autoplotprotein)


### Name: plotsite
### Title: ploting site
### Aliases: plotsite
### Keywords: site file

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
    Site = function(position, position2, name, height = -0.3, 
        x_y, up_down) {
        h1 = -0.1
        h2 = -0.2
        h = -0.4
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
            text(position2, hh1 + height + h - 0.02, name, srt = 90, 
                adj = c(0, 0.5), cex = 0.8)
        }
        else {
            if (position == position2) {
                segments(position, hh1, position, hh1 - h)
            }
            else {
                segments(position, hh1, position, hh1 - h1)
                segments(position2, hh1 - h + h2, position2, 
                  hh1 - h)
                segments(position, hh1 - h1, position2, hh1 - 
                  h + h2)
            }
            text(position2, hh1 - h + 0.02, name, srt = 270, 
                adj = c(0, 0.5), cex = 0.8)
        }
    }
    Change_x = function(site_pos, site_name, protein_width) {
        dec = 1.4 * protein_width/100
        position2 = 1:length(site_pos)
        position2[1] = site_pos[1]
        if (length(site_pos) > 1) {
            for (i in 2:length(site_pos)) {
                if (site_pos[i] - site_pos[i - 1] <= dec) {
                  if (site_pos[i] != site_pos[i - 1]) {
                    position2[i] = position2[i - 1] + dec
                  }
                  else {
                    position2[i] = position2[i - 1]
                  }
                }
                else {
                  position2[i] = site_pos[i]
                }
            }
        }
        return(position2)
    }
    if (!is.na(site[1, 1])) {
        position2 = Change_x(site[, 1], site[, 2], as.numeric(length[2]))
        for (i in 1:nrow(site)) {
            Site(position = as.numeric(site[i, 1]), position2 = position2[i], 
                name = as.character(site[i, 2]), height = as.numeric(protein[4]), 
                x_y = flag, up_down = "up")
        }
    }
  }



