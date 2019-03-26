library(tsbox)


### Name: ts_ggplot
### Title: Plot Time Series, Using ggplot2
### Aliases: ts_ggplot ts_ggplot theme_tsbox ts_ggplot colors_tsbox
###   ts_ggplot scale_color_tsbox ts_ggplot scale_fill_tsbox

### ** Examples

## No test: 
# using the ggplot2 graphic system
p <- ts_ggplot(total = ldeaths, female = fdeaths, male = mdeaths)
p

# with themes for the look and feel of ts_plot()
p + theme_tsbox() + scale_color_tsbox()

# also use themes with standard ggplot
suppressMessages(library(ggplot2))
df <- ts_df(ts_c(total = ldeaths, female = fdeaths, male = mdeaths))
ggplot(df, aes(x = time, y = value)) +
  facet_wrap("id") + 
  geom_line() +
  theme_tsbox() +
  scale_color_tsbox()
## End(No test)

## Not run: 
##D library(dataseries)
##D dta <- ds(c("GDP.PBRTT.A.R", "CCI.CCIIR"), "xts")
##D ts_ggplot(ts_scale(ts_span(
##D     ts_c(
##D       `GDP Growth` = ts_pc(dta[, 'GDP.PBRTT.A.R']),
##D       `Consumer Sentiment Index` = dta[, 'CCI.CCIIR']
##D     ),
##D     start = "1995-01-01"
##D   ))) +
##D   ggplot2::ggtitle("GDP and Consumer Sentiment", subtitle = "normalized values") +
##D   theme_tsbox() +
##D   scale_color_tsbox()
## End(Not run)



