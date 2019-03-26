library(goeveg)


### Name: specresponse
### Title: Species response curves
### Aliases: specresponse

### ** Examples

## Draw species response curve for one species on environmental variable
## with points of occurrences
specresponse(schedenveg$ArrElat, schedenenv$soil_depth, points = TRUE)

## Draw species response curve on environmental variable with custom labels
specresponse(schedenveg$ArrElat, schedenenv$soil_depth, points = TRUE,
       main = "Arrhenatherum elatius", xlab = "Soil depth")

## Draw species response curve on ordination axes
## First calculate DCA
library(vegan)
scheden.dca <- decorana(schedenveg)

# Using a linear model on first axis
specresponse(schedenveg$ArrElat, scheden.dca, method = "ord", model = "linear")
# Using an unimodal model on second axis
specresponse(schedenveg$ArrElat, scheden.dca, method = "ord", axis = 2, model = "unimodal")

## Community data: species (columns) need to be selected; call names() to get column numbers
names(schedenveg)
## Draw multiple species response curves on variable in black/white
specresponse(schedenveg[ ,c(9,18,14,19)], schedenenv$height_herb, bw = TRUE)

## Draw the same curves based on GAM
specresponse(schedenveg[ ,c(9,18,14,19)], schedenenv$height_herb, bw = TRUE, model = "gam")

## Draw multiple species response curves on variable with
## custom x-axis label and points of occurrences
specresponse(schedenveg[ ,c(9,18,14,19)], schedenenv$height_herb,
    xlab = "Height of herb layer (cm)", points = TRUE)

## Draw multiple species response curves on ordination axes
specresponse(schedenveg[ ,c(9,18,14,19)], scheden.dca, method = "ord")
specresponse(schedenveg[ ,c(9,18,14,19)], scheden.dca, method = "ord", axis = 2)




