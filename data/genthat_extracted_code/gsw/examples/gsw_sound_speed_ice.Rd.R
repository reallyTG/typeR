library(gsw)


### Name: gsw_sound_speed_ice
### Title: Sound speed in ice
### Aliases: gsw_sound_speed_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <- c(      10,       50,      125,      250,      600,    1000)
speed <- gsw_sound_speed_ice(t, p)
expect_equal(speed/1e3, c(3.111311360346254, 3.116492565497544, 3.115833462003452,
                         3.115637032488204, 3.115377253092692, 3.113321384499191))



