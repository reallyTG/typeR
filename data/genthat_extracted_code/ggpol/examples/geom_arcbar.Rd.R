library(ggpol)


### Name: geom_arcbar
### Title: Create an Arc-Barchart
### Aliases: geom_arcbar stat_arcbar

### ** Examples

bt <- data.frame(
  parties = factor(c("CDU", "CSU", "AfD", "FDP", "SPD", 
                     "Linke", "Gruene", "Fraktionslos"),
                   levels = c("CDU", "CSU", "AfD", "FDP", "SPD", 
                              "Linke", "Gruene", "Fraktionslos")),
  seats   = c(200, 46, 92, 80, 153, 69, 67, 2),
  colors  = c("black", "blue", "lightblue", "yellow", "red",
              "purple", "green", "grey"),
  stringsAsFactors = FALSE)

ggplot(bt) + 
  geom_arcbar(aes(shares = seats, r0 = 5, r1 = 10, fill = parties)) + 
  scale_fill_manual(values = bt$colors) +
  coord_fixed() +
  theme_void()



