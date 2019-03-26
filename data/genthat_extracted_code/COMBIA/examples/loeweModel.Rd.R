library(COMBIA)


### Name: loeweModel
### Title: This function applies Loewe Model
### Aliases: loeweModel

### ** Examples

xConcentration <- c(0.00,0.20, 0.39,  0.78,  1.56, 3.12, 6.25, 12.50, 25.00, 50.0) 
yConcentration <- c(128,  64,  32,  16,   8,   4,   2,   0)
drugXObs_Mean <- c(0.9747255, 0.9197924, 0.9520692, 0.9517162, 0.9032701, 0.7892114,
                     0.6768190, 0.6524227, 0.4561164)
drugYObs_Mean <- rev( c( 0.93, 0.89, 0.73, 0.42, 0.24, 0.21, 0.11) )
rslt <- loeweModel( xConcentration, yConcentration, drugYObs_Mean, drugXObs_Mean)



