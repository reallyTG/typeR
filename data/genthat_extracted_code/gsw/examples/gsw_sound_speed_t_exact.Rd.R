library(gsw)


### Name: gsw_sound_speed_t_exact
### Title: Sound Speed in Seawater
### Aliases: gsw_sound_speed_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
sound_speed <- gsw_sound_speed_t_exact(SA,CT,p)
expect_equal(sound_speed/1e3, c(1.542615803587414, 1.542703534065789, 1.530844979136360,
                              1.494409996920661, 1.487377102518027, 1.483934609078705))



