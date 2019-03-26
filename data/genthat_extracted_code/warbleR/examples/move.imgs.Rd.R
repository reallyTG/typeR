library(warbleR)


### Name: move.imgs
### Title: Move/copy image files between directories
### Aliases: move.imgs

### ** Examples

{
#Set temporary working directory
# setwd(tempdir())

#load data
data("Cryp.soui")
writeWave(Cryp.soui, "Cryp.soui.wav") #save sound files 

#autodetec location of signals
ad <- autodetec(threshold = 6, bp = c(1, 3), mindur = 1.2,
maxdur = 3, img = FALSE, ssmooth = 600, wl = 300, flist = "Cryp.soui.wav")

#track dominant frequency graphs with freq reange detection
trackfreqs(X = ad[!is.na(ad$start),], flim = c(0, 5), ovlp = 90, it = "tiff",
bp = c(1, 3), contour = "df", wl = 300, frange = TRUE)

#copy files
move.imgs(cut = FALSE)

#cut files
move.imgs(cut = TRUE, to = "image_files")

# Check this folder
getwd()
}




