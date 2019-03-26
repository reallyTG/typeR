library(ggvis)


### Name: input_select
### Title: Create interactive control to select one (or more options) from
###   a list.
### Aliases: input_select input_radiobuttons input_checkboxgroup

### ** Examples

# Dropdown
input_select(c("a", "b", "c"))
input_select(c("a", "b", "c"), multiple = TRUE)
input_select(c("a", "b", "c"), selected = "c")

# If you want to select variable names, you need to convert
# the output of the input to a name with map so that they get
# computed correctly
input_select(names(mtcars), map = as.name)

# Radio buttons
input_radiobuttons(choices = c("Linear" = "lm", "LOESS" = "loess"),
                   label = "Model type")
input_radiobuttons(choices = c("Linear" = "lm", "LOESS" = "loess"),
                   selected = "loess",
                   label = "Model type")

# Used in layer_model_predictions
mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_model_predictions(model = input_radiobuttons(
    choices = c("Linear" = "lm", "LOESS" = "loess"),
    selected = "loess",
    label = "Model type"))

# Checkbox group
mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points(
    fill := input_checkboxgroup(
      choices = c("Red" = "r", "Green" = "g", "Blue" = "b"),
      label = "Point color components",
      map = function(val) {
        rgb(0.8 * "r" %in% val, 0.8 * "g" %in% val, 0.8 * "b" %in% val)
      }
    )
  )



