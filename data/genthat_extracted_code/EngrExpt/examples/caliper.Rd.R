library(EngrExpt)


### Name: caliper
### Title: Diameters of rods measured by two calipers
### Aliases: caliper
### Keywords: datasets

### ** Examples

str(caliper)
show(pl1 <-
     xyplot(caliperb ~ calipera, caliper,
            type = c("g","p"), aspect = "iso",
            xlab = "Measurement with caliper A",
            ylab = "Measurement with caliper B"))
tmd(pl1)



