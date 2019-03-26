library(warbleR)


### Name: inflections
### Title: Count number of inflections in a frequency contour
### Aliases: inflections

### ** Examples

{
# Set temporary working directory

# get warbleR sound file examples
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav") 

# measure frequency contours
dom.freq.ts <- dfts(X = selec.table)

# get number of inflections
inflections(X = dom.freq.ts)
}




