library(squash)


### Name: ColorPalettes
### Title: Bonus color palettes
### Aliases: greyscale grayscale rainbow2 blueorange bluered jet heat
###   coolheat darkbluered
### Keywords: color

### ** Examples


## Present the squash palettes along with the built-in R palettes
squash.palettes <- c('rainbow2', 'jet', 'grayscale', 'heat', 
                     'coolheat', 'blueorange', 'bluered', 'darkbluered')
R.palettes <- c('rainbow', 'heat.colors', 'terrain.colors', 'topo.colors', 'cm.colors')

plot(0:8, type = 'n', ann = FALSE, axes = FALSE)
for (i in 1:5) {
  p <- R.palettes[i]
  hkey(makecmap(c(0, 9), colFn = get(p)), 
    title = p, x = 2, y = i - 1)
}
for (i in 1:8) {
  p <- squash.palettes[i]
  hkey(makecmap(c(0, 9), colFn = get(p)), 
    title = p, x = 6, y = i - 1)
}
text(3, 8, 'R palettes', font = 2)
text(7, 8, 'squash palettes', font = 2)




