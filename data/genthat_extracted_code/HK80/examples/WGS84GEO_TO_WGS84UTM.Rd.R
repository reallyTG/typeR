library(HK80)


### Name: WGS84GEO_TO_WGS84UTM
### Title: Convert WGS84GEO coordinates to WGS84UTM coordinates
### Aliases: WGS84GEO_TO_WGS84UTM
### Keywords: WGS84GEO WGS84UTM

### ** Examples


options(digits = 15)
WGS84GEO_TO_WGS84UTM(22 + 26/60 + 1.26/3600, 114 + 10/60 + 29.31/3600)

#### 22.433683333333334531
#### 114.17480833333333123

#### $N
#### [1] 2483566.19687669
#### 
#### $E
#### [1] 209189.467417282
#### 
#### $zone
#### [1] 50

### Answer from the explanatory notes
### 2483566m N
### 209194m 
 
### Answer from 
### http://www.geodetic.gov.hk/smo/tform/tform.aspx
### 2483568m N
### 209192m E




