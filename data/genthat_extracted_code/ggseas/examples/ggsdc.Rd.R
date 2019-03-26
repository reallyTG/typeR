library(ggseas)


### Name: ggsdc
### Title: Visualise seasonal decomposition
### Aliases: ggsdc

### ** Examples

# sample time series data in data frame
ap_df <- tsdf(AirPassengers)

ggsdc(ap_df, aes(x = x, y = y), method = "decompose") +
   geom_line()
   
ggsdc(ap_df, aes(x = x, y = y), method = "decompose", 
      type = "multiplicative") +
   geom_line(colour = "blue", size = 2) +
   theme_light(8)

ggsdc(ap_df, aes(x = x, y = y), method = "stl", s.window = 7) +
   labs(x = "", y = "Air passenger numbers") +
   geom_point()
   
## Not run: 
##D       
##D ggsdc(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex), method = "seas") +
##D       geom_line()
##D       
##D serv <- subset(nzbop, Account == "Current account" & 
##D             Category %in% c("Services; Exports total", "Services; Imports total"))
##D ggsdc(serv, aes(x = TimePeriod, y = Value, colour = Category),
##D       method = "seas", start = c(1971, 2), frequency = 4) +
##D    geom_line()
## End(Not run)

ggsdc(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex), s.window = 7, 
   index.ref = 1:12, index.basis = 1000) +
   geom_line() +
   ylab("Lung deaths index (average month in 1974 = 1000)")
      
bop <- subset(nzbop, Account == "Current account" & !Balance)
ggsdc(bop, aes(x = TimePeriod, y = Value, colour = Category), frequency = 4, 
   method = "decomp", type = "multiplicative") +
      geom_line() 
      
ggsdc(bop, aes(x = TimePeriod, y = Value, colour = Category), frequency = 4, s.window = 7) +
      geom_line() 



