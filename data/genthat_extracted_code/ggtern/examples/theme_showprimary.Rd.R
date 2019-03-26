library(ggtern)


### Name: theme_showprimary
### Title: Show or Hide the Primary/Secondary Ticks
### Aliases: theme_showprimary theme_noprimary theme_hideprimary
###   theme_nosecondary theme_hidesecondary theme_showsecondary
###   theme_showticks theme_hideticks theme_noticks

### ** Examples

data(Feldspar)
plot <- ggtern(data=Feldspar,aes(Ab,An,Or)) + geom_point() + 
  theme_showsecondary()



