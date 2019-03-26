library(Rothermel)


### Name: bestFM
### Title: Function to select best standard fuel model for observed fire
###   rate of spread
### Aliases: bestFM
### Keywords: models

### ** Examples

data ("firexp")
a <- bestFM (obs = firexp$ros,
            m = firexp[,18:22],
            u = firexp[,"u"],
            slope = firexp[,"slope"])  
a      

# plot results
barplot (a$error,
        cex.names = 0.7,
        las = 2,
        ylab = "rmse",
        col = sign (a$bias) + 3,
        names.arg = rownames (a))
          
legend (1, max (a [, 1]), 
        c ("Overprediction", "Underprediction"),
        col = c ("blue", "red"),
        pch = 15)



