library(ggguitar)


### Name: notes_for_frets
### Title: This function is similar to 'chord_for_frets' but also handles
###   scales. Unlike chords_for_frets, this function removes NAs. This
###   means there are no muted strings identified if a chord is passed in
###   the frets argument.
### Aliases: notes_for_frets

### ** Examples

G_M_scale <- c(3, 0, 0, 0, NA, NA,
                        NA, 2, 2, NA, NA, NA,
                        NA, 3, 4, NA, NA, NA)
notes_for_frets(G_M_scale)




