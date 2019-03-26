library(WRS2)


### Name: ancova
### Title: Robust ANCOVA
### Aliases: ancova ancboot print.ancova
### Keywords: models

### ** Examples

head(invisibility)
ancova(mischief2 ~ cloak + mischief1, data = invisibility)

## specifying covariate evaluation points
ancova(mischief2 ~ cloak + mischief1, data = invisibility, pts = c(3, 4, 8, 1))

## bootstrap version
ancboot(mischief2 ~ cloak + mischief1, data = invisibility)



