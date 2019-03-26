library(ggformula)


### Name: gf_point
### Title: Formula interface to geom_point()
### Aliases: gf_point

### ** Examples

gf_point()
gf_point( (10 * ((1:25) %/% 10)) ~ ((1:25) %% 10), shape = 1:25,
  fill = "skyblue", color = "navy", size = 4, stroke = 1, data = NA)
gf_point(mpg ~ hp, color = ~ cyl, size = ~ wt, data = mtcars)
# faceting -- two ways
gf_point(mpg ~ hp, data = mtcars) %>%
  gf_facet_wrap( ~ am)
gf_point(mpg ~ hp | am, group = ~ cyl, data = mtcars)
gf_point(mpg ~ hp | ~ am, group = ~ cyl, data = mtcars)
gf_point(mpg ~ hp | am ~ ., group = ~ cyl,  data = mtcars)
# Chaining in the data
mtcars %>% gf_point(mpg ~ wt)

# short cuts for main labels in the plot
if (require(mosaicData)) {
  gf_point(births ~ date, color = ~ wday, data = Births78,
    xlab = "Date", ylab = "Number of Live Births",
    title = "Interesting Patterns in the Number of Births",
    subtitle = "(United States, 1978)",
    caption = "Source: mosaicData::Births78")
}




