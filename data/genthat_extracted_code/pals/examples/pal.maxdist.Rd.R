library(pals)


### Name: pal.maxdist
### Title: Measure the maximum distance between two palettes
### Aliases: pal.maxdist

### ** Examples

pa0 <- c("#ff0000","#00ff00","#0000ff")
pa1 <- c("#fa0000","#00fa00","#0000fa") # 2.4
pa2 <- c("#f40000","#00f400","#0000f4") # 5.2
pal.maxdist(pa0,pa1) # 2.36
pal.maxdist(pa0,pa2) # 5.20
pal.bands(pa1,pa0,pa2, labels=c("2.36","0","5.20"))
title("Maximum Lab distance from middle palette")

# distance between colormap functions
pal.maxdist(coolwarm,warmcool)




