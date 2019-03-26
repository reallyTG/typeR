library(ggperiodic)


### Name: wrap
### Title: Wrap periodic data to an arbitrary range
### Aliases: wrap wrap.periodic_df

### ** Examples


x <- seq(0, 360 - 20, by = 20)
df <- data.frame(x = x, y = cos(x*pi/180))
df_p <- periodic(df, x = c(0, 360))

# wrap in default rante
df_wrapped <- wrap(df_p)
range(df_wrapped$x)
range(df$x)

# specify range
df_wrapped <- wrap(df_p, x = c(-145, 365))
range(df_wrapped$x)

# with non regular intervals
x <- runif(30, 0, 360)
df <- periodic(data.frame(x = x, y = cos(x*pi/180)),
               x = c(0, 360))
df_wrapped <- wrap(df, x = c(-180, 540))
range(df_wrapped$x)
range(df$x)
## Not run: 
##D # This example illustrates the use of the .group parameter
##D library(ggplot2)
##D map <- periodic(map_data("world"), long = long)
##D 
##D # If wrapped without .group, the repated parts of the map
##D # have the same group and so polygons are not correctly defined.
##D map_wrapped <- wrap(map, long = c(-180, 360))
##D ggplot(map_wrapped, aes(long, lat, group = group)) +
##D     geom_path()
##D 
##D # Using groups, you get the correct grouping.
##D map_wrapped <- wrap(map, long = c(-180, 360), .group = group)
##D ggplot(map_wrapped, aes(long, lat, group = group)) +
##D     geom_path()
## End(Not run)



