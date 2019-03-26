library(clifro)


### Name: clifro
### Title: From CliFlo to 'clifro': Enhancing The National Climate Database
###   With R
### Aliases: clifro clifro-package
### Keywords: package

### ** Examples

## Not run: 
##D # Create a public user ----------------------------------------------------
##D 
##D public.user = cf_user() # Defaults to "public"
##D public.user
##D 
##D # Select datatypes --------------------------------------------------------
##D 
##D # 9am Surface wind (m/s)
##D wind.dt = cf_datatype(2, 1, 4, 1)
##D 
##D # Daily Rain
##D rain.dt = cf_datatype(3, 1, 1)
##D 
##D # Daily temperature extremes
##D temp.dt = cf_datatype(4, 2, 2)
##D 
##D # Combine them together
##D all.dts = wind.dt + rain.dt + temp.dt
##D all.dts
##D 
##D # Select the Reefton Ews station ------------------------------------------
##D 
##D reefton.st = cf_station()
##D reefton.st
##D 
##D # Submit the query --------------------------------------------------------
##D 
##D # Retrieve all data from ~ six months ago at 9am
##D reefton.data = cf_query(public.user, all.dts, reefton.st,
##D                         paste(as.Date(Sys.time()) - 182, "9"))
##D reefton.data
##D 
##D 
##D # Plot the data -----------------------------------------------------------
##D 
##D # Plot the 9am surface wind data (first dataframe in the list) ---
##D reefton.data[1]
##D 
##D # all identical - although passed to different methods
##D plot(reefton.data)    #plot,cfDataList,missing-method
##D plot(reefton.data, 1) #plot,cfDataList,numeric-method
##D plot(reefton.data[1]) #plot,cfData,missing-method --> plot,cfWind,missing-method
##D 
##D speed_plot(reefton.data)
##D direction_plot(reefton.data)
##D 
##D # Plot the daily rain data (second dataframe in the list) ---
##D reefton.data[2]
##D 
##D # With runoff and soil deficit
##D plot(reefton.data, 2)
##D 
##D # Just plot amount of rain (mm)
##D plot(reefton.data, 2, include_runoff = FALSE)
##D 
##D # Plot the hourly temperature data (third dataframe in the list) ---
##D plot(reefton.data, 3)
##D 
##D # Pass an argument to ggplot2::theme
##D library(ggplot2) # for element_text()
##D plot(reefton.data, 3, text = element_text(size = 18))
## End(Not run)



