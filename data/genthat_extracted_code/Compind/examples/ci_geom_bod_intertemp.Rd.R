library(Compind)


### Name: ci_geom_bod_intertemp
### Title: Intertemporal analysis for geometric mean quantity index numbers
### Aliases: ci_geom_bod_intertemp

### ** Examples


i1_t1 <- seq(0.3, 0.5, len = 100)
i2_t1 <- seq(0.3, 1, len = 100)  
Indic_t1 = data.frame(i1_t1, i2_t1)

i1_t0 <- i1_t1 - rnorm (100, 0.2, 0.03)
i2_t0 <- i2_t1   - rnorm (100, 0.2, 0.03)
Indic_t0 = data.frame(i1_t0, i2_t0)

intertemp = ci_geom_bod_intertemp(Indic_t0,Indic_t1,c(1:2),up_w=0.95,low_w=0.05,1)
intertemp 




