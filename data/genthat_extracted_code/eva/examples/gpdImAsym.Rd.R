library(eva)


### Name: gpdImAsym
### Title: GPD Asymptotic Adjusted Information Matrix (IM) Test
### Aliases: gpdImAsym

### ** Examples

## Generate some data from GPD
x <- rgpd(200, loc = 0, scale = 1, shape = 0.2)
gpdImAsym(x, bootnum = 50)



