library(Momocs)


### Name: coo_interpolate
### Title: Interpolates coordinates
### Aliases: coo_interpolate

### ** Examples

b <- bot[1]
stack(bot)
stack(coo_scale(bot))
coo_plot(b)
coo_plot(coo_scale(b))
stack(bot)
stack(coo_interpolate(coo_sample(bot, 12), 120))
coo_plot(bot[1])
coo_plot(coo_interpolate(coo_sample(bot[1], 12), 120))



