library(emstreeR)


### Name: stat_MST
### Title: Euclidean Minimum Spanning Tree Stat Function
### Aliases: stat_MST

### ** Examples


## 2D artificial data:
set.seed(1984)
n <- 15
c1 <- data.frame(x = rnorm(n,-0.2, sd=0.2), y = rnorm(n,-2,sd=0.2))
c2 <- data.frame(x = rnorm(n,-1.1, sd=0.15), y = rnorm(n,-2,sd=0.3)) 
d <- rbind(c1, c2)
d <- as.data.frame(d)

## MST:
out <- ComputeMST(d)

#1) simple plot
library(ggplot2)
ggplot(data = out, 
    aes(x = x, y = y, 
    from=from, to=to))+ 
    geom_point()+
    stat_MST(colour="red", linetype = 2)
    
#2) curved edges
library(ggplot2)
ggplot(data = out, 
    aes(x = x, y = y, 
    from=from, to=to))+ 
    geom_point()+
    stat_MST(geom="curve", colour="red", linetype = 2)

## Not run: 
##D ## plotting MST on maps:
##D library(ggmap)
##D 
##D #3) honeymoon cruise example
##D # define ports
##D df.port_locations <- data.frame(location = c("Civitavecchia, Italy",
##D                                              "Genova, Italy",
##D                                              "Marseille, France",
##D                                              "Barcelona, Spain",
##D                                              "Tunis, Tunisia",
##D                                              "Palermo, Italy"), 
##D                                 stringsAsFactors = FALSE)
##D 
##D # get latitude and longitude
##D geo.port_locations <- geocode(df.port_locations$location, source = "dsk")
##D 
##D # combine data
##D df.port_locations <- cbind(df.port_locations, geo.port_locations)
##D 
##D # MST
##D out <- ComputeMST(df.port_locations[,2:3])
##D plot(out) #just to check
##D 
##D # Plot
##D #' map <- c(left = -8, bottom = 32, right = 20, top = 47)
##D 
##D get_stamenmap(map, zoom = 5) %>% ggmap()+
##D   stat_MST(data = out, 
##D            aes(x = lon, y = lat, from=from, to=to), 
##D            colour="red", linetype = 2)+
##D   geom_point(data = out, aes(x = lon, y = lat), size=3)
##D 
##D 
##D #4) World Map travels:
##D library(ggplot2)
##D library(ggmaps)
##D 
##D country_coords_txt <- "
##D    1     3.00000  28.00000       Algeria
##D    2    54.00000  24.00000           UAE
##D    3   139.75309  35.68536         Japan
##D    4    45.00000  25.00000 'Saudi Arabia'
##D    5     9.00000  34.00000       Tunisia
##D    6     5.75000  52.50000   Netherlands
##D    7   103.80000   1.36667     Singapore
##D    8   124.10000  -8.36667         Korea
##D    9    -2.69531  54.75844            UK
##D    10    34.91155  39.05901        Turkey
##D    11  -113.64258  60.10867        Canada
##D    12    77.00000  20.00000         India
##D    13    25.00000  46.00000       Romania
##D    14   135.00000 -25.00000     Australia
##D    15    10.00000  62.00000        Norway"
##D    
##D    
##D  d <- read.delim(text = country_coords_txt, header = FALSE, 
##D  quote = "'", sep = "", col.names = c('id', 'lon', 'lat', 'name'))
##D    
##D  out <- ComputeMST(d[,2:3])
##D  
##D  country_shapes <- geom_polygon(aes(x = long, y = lat, group = group),
##D    data = map_data('world'), fill = "#CECECE", color = "#515151", 
##D    size = 0.15)
##D    
##D  ggplot()+ country_shapes+
##D    stat_MST(geomdata = out, aes(x = lon, y = lat, from=from, to=to), colour="red", linetype = 2)+
##D    geom_point(data = out, aes(x = lon, y = lat), size=2)
## End(Not run)




