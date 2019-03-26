library(gazepath)


### Name: gazepath
### Title: Transform Raw Eye-Tracking Data into Fixations and Saccades
### Aliases: gazepath summary.gazepath plot.gazepath print.gazepath
###   head.gazepath tail.gazepath
### Keywords: fixations saccades

### ** Examples

#### Example
data(screen)
data(eye_dat)
example <- gazepath(eye_dat, x1 = 1, y1 = 2, d1 = 4, trial = 3, 
height_px = screen[,1], height_mm = screen[,2], 
width_px = screen[,3], width_mm = screen[,4], 
method = 'gazepath', samplerate = 500)

## Use different i's to check the estimated fixations per trial
i <- 1
plot(example, trial_index = i)

## The estimated fixations, orderded per trial
s <- summary(example, complete_only = FALSE)



