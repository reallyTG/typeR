library(canprot)


### Name: CLES
### Title: Common Language Effect Size
### Aliases: CLES

### ** Examples

# generate synthetic data for heights in inches of 18-24
# year-old males and females (NCHS, 1987, Tables 13 and 14)
height_male <- rnorm(988, 69.7, 2.8)
height_female <- rnorm(1066, 64.3, 2.6)
# the CLES is approximately 0.92 (McGraw and Wong, 1992)
CLES(height_female, height_male)



