library(REAT)


### Name: shiftp
### Title: Shift-share prognosis
### Aliases: shiftp

### ** Examples

# Example data from Spiekermann/Wegener 2008:
# two regions, two industries
region1_2000 <- c(1400, 3600)
region1_2006 <- c(1000, 4400)
region2_2000 <- c(1200, 1800)
region2_2006 <- c(1100, 3700)
region3_2000 <- c(1100, 900)
region3_2006 <- c(800, 1000)
# regional values
nation_2000 <- c(3700, 6300)
nation_2006 <- c(2900, 9100)
# national values
nation_2010 <- c(2500, 12500)
# national prognosis values

# Analysis for region 1:
shiftp(region1_2000, region1_2006, nation_2000,
nation_2006, e_i3 = nation_2010, 
time1 = 2000, time2 = 2006, time3 = 2010)
# Analysis for region 2:
shiftp(region2_2000, region2_2006, nation_2000, 
nation_2006, e_i3 = nation_2010, 
time1 = 2000, time2 = 2006, time3 = 2010)
# Analysis for region 3:
shiftp(region3_2000, region3_2006, nation_2000, 
nation_2006, e_i3 = nation_2010, 
time1 = 2000, time2 = 2006, time3 = 2010)



