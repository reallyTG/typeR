library(spdplyr)


### Name: dplyr-Spatial
### Title: Dplyr verbs for Spatial
### Aliases: dplyr-Spatial dplyr-Spatial mutate.Spatial dplyr-Spatial
###   mutate_.Spatial dplyr-Spatial summarise_.Spatial dplyr-Spatial
###   summarise.Spatial dplyr-Spatial group_by_.Spatial dplyr-Spatial
###   group_by.Spatial dplyr-Spatial filter_.Spatial dplyr-Spatial
###   filter.Spatial dplyr-Spatial arrange_.Spatial dplyr-Spatial
###   arrange.Spatial dplyr-Spatial slice_.Spatial dplyr-Spatial
###   slice.Spatial dplyr-Spatial select_.Spatial dplyr-Spatial
###   select.Spatial dplyr-Spatial rename_.Spatial dplyr-Spatial
###   rename.Spatial dplyr-Spatial distinct_.Spatial dplyr-Spatial
###   distinct.Spatial dplyr-Spatial left_join.Spatial dplyr-Spatial
###   inner_join.Spatial

### ** Examples

library(sp)
library(maptools)
data(wrld_simpl)
library(spdplyr) 
library(raster)  
wrld_simpl %>% mutate(NAME = "allthesame", REGION = row_number())
wrld_simpl %>% transmute(alpha = paste0(FIPS, NAME))
wrld_simpl %>% filter(NAME %in% c("New Zealand", "Australia", "Fiji"))
## Not run: 
##D wrld_simpl %>% arrange(LON)
##D wrld_simpl %>% slice(c(9, 100))
##D wrld_simpl %>% dplyr::select(UN, FIPS)
##D wrld_simpl %>% rename(`TM_WORLD_BORDERS_SIMPL0.2NAME` = NAME)
##D wrld_simpl %>% distinct(REGION, .keep_all = TRUE) %>% 
##D    arrange(REGION)  ## first alphabetically in REGION
##D wrld_simpl %>% arrange(REGION, desc(NAME)) %>% distinct(REGION, .keep_all = TRUE) ## last
## End(Not run)
## we don't need to use piping
slice(filter(mutate(wrld_simpl, likepiping = FALSE), abs(LON - 5) < 35 & LAT > 50), 4)


## works with Lines
#as(wrld_simpl, "SpatialLinesDataFrame") %>% 
 # mutate(perim = rgeos::gLength(wrld_simpl, byid = TRUE))

## Not run: 
##D ## summarise/ze can be used after group_by, or without
##D wrld_simpl %>% filter(REGION == 150) %>% summarize(max(AREA)) 
##D wrld_simpl %>% group_by(REGION) %>% summarize(max(AREA)) %>% 
##D plot(col = rainbow(nlevels(factor(wrld_simpl$REGION)), alpha = 0.3))
## End(Not run)
## group_by and summarize

## Not run: 
##D g <- wrld_simpl  %>% group_by(REGION)  %>% 
##D  summarize(alon = mean(LON), mxlat = max(LAT), mxarea = max(AREA))
##D g %>% mutate(ar = factor(REGION)) %>% spplot("ar")
##D w <- wrld_simpl
##D w$ar <- factor(w$REGION)
##D spplot(w, "ar")
## End(Not run)
## Not run: 
##D # compare what rgeos gives
##D ##spplot(rgeos::gUnionCascaded(w, id = w$ar))  ## good grief, is this compelling . . .
##D ## this is hardly a clean dissolve
##D ##plot(rgeos::gUnionCascaded(w, id = w$ar), col = rainbow(nlevels(factor(w$ar)), alpha = 0.5))
## End(Not run)



