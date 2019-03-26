library(HK80)


### Name: WGS84UTM_TO_WGS84GEO
### Title: Covert WGS84UTM coordinates to WGS84GEO coordinates
### Aliases: WGS84UTM_TO_WGS84GEO
### Keywords: WGS84UTM WGS84GEO

### ** Examples


options(digits = 15)
WGS84UTM_TO_WGS84GEO(2483568, 209192, zone = 50)

### $latitude
### [1] 22.4336553287886
### 
### $longitude
### [1] 114.174807232072
### 

### The answer from the explanatory notes is 
### 22 + 26/60 + 1.16/3600 = 22.433655555555557015
### 114 + 10/60 + 29.24/3600 = 114.17478888888889799




