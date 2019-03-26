library(OceanView)


### Name: Reshaping to a crosstable
### Title: Converts a dataset from database-format to a cross table
### Aliases: db2cross
### Keywords: utility

### ** Examples

## =======================================================================
## test the function on a small data set
## =======================================================================

 df3 <- data.frame(school = rep(c("a","b","c"), each = 4), 
                   class = rep(9:10, 6),
                   time = rep(c(1,1,2,2), 3),  
                   score = rnorm(12))
 head(df3)
 db2cross(df3, val = 4)

## =======================================================================
## Defining the output rows
## =======================================================================
Samples <- data.frame(time = c(1, 1.1, 1.2, 2, 2.1, 2.2, 4, 4.1, 4.2),
                      var = rep(c("O2", "NO3", "NH3"), 3), 
                      val = 1:9)
Samples

db2cross(Samples)
db2cross(Samples, df.row = 0.5)
db2cross(Samples, out.row = c(1, 2, 4))
db2cross(Samples, out.row = 1:4)

## =======================================================================
## A larger dataset; requires OceanView.Data
## =======================================================================
## Not run: 
##D  data (pp.aug2009.db)
##D  crosstab <- db2cross(pp.aug2009.db)
##D  crosstab$z[crosstab$z>1000] <- 1000
##D  crosstab$z[crosstab$z<0]    <- NA
##D 
##D  image2D(z = crosstab$z, x = crosstab$x, y = crosstab$y,
##D        main = "primary production august 2009 mgC/m2/d", 
##D        NAcol = "black")
##D  
## End(Not run)



