library(memisc)


### Name: mtable_format_html
### Title: HTML Formatting for 'mtable' Results
### Aliases: mtable_format_html format_html.memisc_mtable
###   mtable_format_html mtable_format_stdstyle

### ** Examples

lm0 <- lm(sr ~ pop15 + pop75,              data = LifeCycleSavings)
lm1 <- lm(sr ~                 dpi + ddpi, data = LifeCycleSavings)
lm2 <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)

mtable123 <- mtable("Model 1"=lm0,"Model 2"=lm1,"Model 3"=lm2,
                    summary.stats=c("sigma","R-squared","F","p","N"))

(mtable123 <- relabel(mtable123,
                      "(Intercept)" = "Constant",
                      pop15 = "Percentage of population under 15",
                      pop75 = "Percentage of population over 75",
                      dpi = "Real per-capita disposable income",
                      ddpi = "Growth rate of real per-capita disp. income"
))

show_html(mtable123)



