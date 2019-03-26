library(ggvis)


### Name: band
### Title: A band
### Aliases: band is.prop_band

### ** Examples

df <- data.frame(label = c("a", "b", "c"), n = c(10, 9, 4))

base <- df %>% ggvis(~label, y2 = 0, y = ~n)
base %>% layer_rects(width = band())
base %>% layer_rects(width = band(offset = -1))
base %>% layer_rects(width = band(mult = 0.9))

# A nominal scale with padding is more symmetrical than band with a mult
base %>% layer_rects(width = band(mult = 0.75))
base %>% layer_rects(width = band()) %>%
  scale_nominal("x", padding = 0.25, points = FALSE)



