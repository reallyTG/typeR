library(ips)


### Name: raxml
### Title: Maximum Likelihood Tree Estimation with RAxML
### Aliases: raxml

### ** Examples

## bark beetle sequences
data(ips.cox1)
data(ips.16S)
data(ips.28S)

ips <- cbind(ips.cox1, ips.16S, ips.28S,
  fill.with.gaps = TRUE)

exec <- NULL # replace by your RAxML path

if ( !is.null(exec) ){

## normal tree search with GTRCAT and GTRGAMMA
tr <- raxml(woodmouse, f = "d", N = 2, p = 1234, 
            exec = exec) # -1743.528461
tr <- raxml(woodmouse, m = "GTRGAMMA", f = "d", N = 2, p = 1234, 
            exec = exec)

## rapid bootstrap
tr <- raxml(woodmouse, m = "GTRGAMMA",
            f = "a", N = 10, p = 1234, x = 1234, 
            exec = exec)

## rapid bootstrap with automatic halt
tr <- raxml(woodmouse, m = "GTRGAMMA", 
            f = "a", N = "autoMRE", p = 1234, x = 1234, 
            exec = exec)
}




