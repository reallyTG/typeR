library(REAT)


### Name: shift.growth
### Title: Growth rates for shift-share analysis
### Aliases: shift.growth

### ** Examples

# Example from Farhauer/Kroell (2013):
region_A_t <- c(90,20,10,60)
region_A_t1 <- c(100,40,10,55)
# data for region A (time t and t+1)
nation_X_t <- c(400,150,150,400)
nation_X_t1 <- c(440,210,135,480)
# data for the national economy (time t and t+1)
shift.growth(region_A_t, region_A_t1, nation_X_t, nation_X_t1)



