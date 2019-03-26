library(mosaic)


### Name: mplot
### Title: Generic plotting
### Aliases: mplot mplot.default mplot.lm mplot.data.frame mplot.summary.lm
###   mplot.TukeyHSD

### ** Examples

lm( width ~ length * sex, data = KidsFeet) %>%
  mplot(which = 1:3, id.n = 5)
lm( width ~ length * sex, data = KidsFeet) %>%
  mplot(smooth.color = "blue", smooth.size = 1.2, smooth.alpha = 0.3, id.size = 3)
lm(width ~ length * sex, data = KidsFeet) %>%
  mplot(rows = 2:3, which = 7)
## Not run: 
##D mplot( HELPrct )
##D mplot( HELPrct, "histogram" )
## End(Not run)
lm(width ~ length * sex, data = KidsFeet) %>%
  summary() %>%
  mplot()
  
lm(width ~ length * sex, data = KidsFeet) %>%
  summary() %>%
  mplot(rows = c("sex", "length"))
  
lm(width ~ length * sex, data = KidsFeet) %>%
  summary() %>%
  mplot(rows = TRUE)
lm(age ~ substance, data = HELPrct) %>%
  TukeyHSD() %>%
  mplot()
lm(age ~ substance, data = HELPrct) %>%
  TukeyHSD() %>%
  mplot(system = "lattice")



