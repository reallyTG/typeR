library(DALY)


### Name: scatterplot
### Title: Scatterplot method for class 'DALY' and 'DALY_list'
### Aliases: scatterplot scatterplot.DALY scatterplot.DALY_list
### Keywords: output

### ** Examples

## Not run: 
##D 
##D ##= load toxoplasmosis example ============================
##D setDALYexample(2)
##D 
##D ##= perform DALY calculation for different scenarios ======
##D toxo_00 <- getDALY(aw = FALSE, dr = 0)
##D toxo_03 <- getDALY(aw = FALSE, dr = 0.03)
##D toxo_13 <- getDALY(aw = TRUE,  dr = 0.03)
##D 
##D ##= combine scenarios in 'DALY_list' ======================
##D toxo <- DALY_list(toxo_00, toxo_03, toxo_13)
##D 
##D ##= plot YLL and YLL for toxo_00 ==========================
##D par(mar = c(4, 4, 1, 1) + .5)
##D par(mfrow = c(1, 2))
##D scatterplot(toxo_00, plot = "YLL",
##D             outcomes = FALSE, legend = FALSE)
##D scatterplot(toxo_00, plot = "YLD",
##D             outcomes = FALSE, legend = FALSE)
##D 
##D ##= plot all three scenarios ==============================
##D par(mfrow = c(1, 1))
##D scatterplot(toxo,
##D             legend = c("DALY[0,0]",
##D                        "DALY[0,0.03]",
##D                        "DALY[1,0.03]"),
##D             legend_pos = "topleft",
##D             log = "xy",
##D             main = "Scenario analysis")
## End(Not run)


