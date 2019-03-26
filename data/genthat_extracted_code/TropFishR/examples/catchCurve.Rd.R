library(TropFishR)


### Name: catchCurve
### Title: Catch curve
### Aliases: catchCurve
### Keywords: Z catchCurve function mortality

### ** Examples

## No test: 
#_______________________________________________
# Variable paramter system (with catch vector)
# based on length frequency data
data(goatfish)
output <- catchCurve(goatfish)
summary(output$linear_mod)

# based on age composition data
data(whiting)
catchCurve(whiting, catch_columns = 1)

#_______________________________________________
# Constant parameter system based on age composition data (with catch matrix)
catchCurve(whiting)

#_______________________________________________
# Cumulative Catch Curve
# based on length frequency data
data(goatfish)
catchCurve(goatfish, cumulative = TRUE)

# based on age composition data
data(synCAA2)
catchCurve(synCAA2, cumulative = TRUE)

#_______________________________________________
# Catch Curve with estimation of selection ogive
data(synLFQ3)
output <- catchCurve(synLFQ3, calc_ogive = TRUE)
summary(output$linear_mod_sel)
 
## End(No test)

# the same with predefined selection for regression line:
output <- catchCurve(synLFQ3, calc_ogive = TRUE, reg_int = c(9,21))
plot(output, plot_selec = TRUE)




