library(HK80)


### Name: HK80UTM_TO_HK80GEO
### Title: Convert the HK80UTM coordinates to HK80GEO coordinates
### Aliases: HK80UTM_TO_HK80GEO
### Keywords: HK80GEO HK80UTM

### ** Examples

options(digits = 15)
HK80UTM_TO_HK80GEO(2483775, 208930, zone = 50)

#### $latitude
#### [1] 22.435188997523
#### 
#### $longitude
#### [1] 114.172349350774

##### Answer from the explanatory note:
### 22 + 26/60 + 06.89/3600 = 22.43524722
### 114 + 10/60 + 20.39/3600 = 114.1723306



