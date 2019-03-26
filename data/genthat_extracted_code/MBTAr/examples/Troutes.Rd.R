library(MBTAr)


### Name: Troutes
### Title: Query all T routes
### Aliases: Troutes

### ** Examples

  ## Authenticate:
  ## Don't show: 
  test_key <- "hUOvci6zZkihtonl1_yDkg"
  
## End(Don't show)
  mykey <- NULL
  mykey <- assign("mykey", value = test_key, envir = .GlobalEnv)
  ## use your own key from http://realtime.mbta.com/Portal/ instead of the test key

	Troutes(api_key = mykey)

	## returns:
	    # route_type     mode_name         route_id                   route_name
# 1            0        Subway          Green-B                 Green Line B
# 2            0        Subway          Green-C                 Green Line C
# 3            0        Subway          Green-D                 Green Line D
# 4            0        Subway          Green-E                 Green Line E
# 5            0        Subway         Mattapan             Mattapan Trolley
# 6            1        Subway             Blue                    Blue Line
# 7            1        Subway           Orange                  Orange Line
# 8            1        Subway              Red                     Red Line
# 9            2 Commuter Rail     CR-Fairmount               Fairmount Line
# 10           2 Commuter Rail     CR-Fitchburg               Fitchburg Line
# ...
# 207          3           Bus             9702                         9702
# 208          3           Bus             9703                         9703
# 209          4          Boat          Boat-F4            Charlestown Ferry
# 210          4          Boat          Boat-F1                Hingham Ferry
# 211          4          Boat          Boat-F3                   Hull Ferry



