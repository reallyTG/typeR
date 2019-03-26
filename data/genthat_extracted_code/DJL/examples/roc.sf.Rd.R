library(DJL)


### Name: roc.sf
### Title: Rate of change (RoC) calculation using SF
### Aliases: roc.sf

### ** Examples

# Reproduce Mercedes-Benz CLA45 AMG's local RoC in Table 5 in Lim, D-J. (2015)
  # Load engine dataset
    df <- dataset.engine.2015
  
  # Subset for 4 cylinder engines
    fce <- subset(df, df[, 3] == 4)
    
  # Parameters
    x <- subset(fce, select = 4)
    y <- subset(fce, select = 5 : 7)
    d <- subset(fce, select = 2)
    g <- as.matrix(data.frame(0, y))
    w <- matrix(c(1, 0, 0), ncol = 3)

  # Calc local Roc
    roc.sf(x, y, d, 2014, "crs", g, w, "min")$roc_local[348, ]



