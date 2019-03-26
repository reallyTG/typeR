library(ggguitar)


### Name: tablature
### Title: Create guitar chord tablature chart.
### Aliases: tablature

### ** Examples

tablature('G Major', c(3, 2, 0, 0, 0, 3))

B_M <- c(NA, 2, 4, 4, 4, 2)
tablature('B Major (bar)', B_M,
           x_labels=c(0,1,3,3,3,1),
           x_axis_label = 'Finger')

tablature('B Major (bar)', B_M,
           dot_labels = c('','B','F#','B','D#','F#'))



