library(REAT)


### Name: shiftd
### Title: Dynamic shift-share analysis
### Aliases: shiftd

### ** Examples

# Example from Farhauer/Kroell (2013), extended:
region_A_t <- c(90,20,10,60)
region_A_t1 <- c(100,40,10,55)
region_A_t2 <- c(105,45,15,60)
# data for region A (time t and t+1)
nation_X_t <- c(400,150,150,400)
nation_X_t1 <- c(440,210,135,480)
nation_X_t2 <- c(460,230,155,500)
# data for the national economy (time t and t+1)
shiftd(region_A_t, data.frame(region_A_t1, region_A_t2), nation_X_t, 
data.frame(nation_X_t1, nation_X_t2), time1 = 2000, time2 = 2002,
plot.results = TRUE, plot.portfolio = TRUE, psize = region_A_t1)

data(Goettingen)
shiftd(Goettingen$Goettingen2008[2:16], Goettingen[2:16,3:11], 
Goettingen$BRD2008[2:16], Goettingen[2:16,13:21],
time1 = 2008, time2 = 2017, industry.names = Goettingen$WA_WZ2008[2:16], 
shift.method = "Dunn")



