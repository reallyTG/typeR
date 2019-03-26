library(rgl)


### Name: asRow
### Title: Convenience functions for rgl HTML layouts
### Aliases: asRow getWidgetId

### ** Examples

library(crosstalk)
sd <- SharedData$new(mtcars)
ids <- plot3d(sd$origData(), col = mtcars$cyl, type = "s")
# Copy the key and group from existing shared data
rglsd <- rglShared(ids["data"], key = sd$key(), group = sd$groupName())
w <- rglwidget(shared = rglsd) %>%
asRow("Mouse mode: ", rglMouse(getWidgetId(.)), 
      "Subset: ", filter_checkbox("cylinderselector", 
		                "Cylinders", sd, ~ cyl, inline = TRUE),
      last = 4, colsize = c(1,2,1,2), height = 60)
if (interactive())
  w



