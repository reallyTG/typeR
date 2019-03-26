library(goeveg)


### Name: racurve
### Title: Rank-abundance curves
### Aliases: racurve

### ** Examples

## Draw rank-abundance curve
racurve(schedenveg)

## Draw rank-abundance curve and label first 5 species
racurve(schedenveg, nlab = 5)

## Draw rank-abundance curve with log-scaled axis
racurve(schedenveg, ylog = TRUE)

## Draw rank-abundance curve with frequencies and no main title
racurve(schedenveg, frequency = TRUE, nlab = 1, main = "")



