library(DJL)


### Name: map.soa.sf
### Title: SOA mapping using SF
### Aliases: map.soa.sf

### ** Examples

# Reproduce Table 2 in Lim, D-J. (2015)
  # Load engine dataset
    df <- dataset.engine.2015
  
  # Subset for 4 cylinder engines
    fce <- subset(df, df[, 3] == 4)

  # Parameters
    x <- subset(fce, select = 4)
    y <- subset(fce, select = 5 : 7)
    d <- subset(fce, select = 2)
    g <- data.frame(0, y)
    w <- matrix(c(1, 0, 0), ncol = 3)

  # Generate an SOA map
    map.soa.sf(x, y, d, "crs", g, w, mk = "eff")



