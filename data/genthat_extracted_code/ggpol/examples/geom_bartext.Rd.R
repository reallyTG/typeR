library(ggpol)


### Name: geom_bartext
### Title: Repelling text for GeomBar.
### Aliases: geom_bartext

### ** Examples

df <- data.frame(L = rep(LETTERS[1:2], each = 4),
                 l = rep(letters[1:4], 2),
                 val = c(96.5, 1, 2, 0.5, 48, 0.7, 0.3, 51))
 
ggplot(df, aes(x = L, y = val, fill = l)) +
  geom_bar(stat = "identity") +
  geom_bartext(aes(label = paste0(val, "%")), position = position_stack(vjust = 0.5)) +
  ggtitle("GeomBartext") 
  



