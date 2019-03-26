library(gsw)


### Name: gsw_sound_speed
### Title: Sound speed
### Aliases: gsw_sound_speed

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
speed <- gsw_sound_speed(SA,CT,p)
expect_equal(speed/1e3, c(1.542426412426373, 1.542558891663385, 1.530801535436184,
                        1.494551099295314, 1.487622786765276, 1.484271672296205))



