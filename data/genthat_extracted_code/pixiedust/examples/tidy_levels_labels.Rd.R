library(pixiedust)


### Name: tidy_levels_labels
### Title: Term and Level Descriptions for 'pixiedust' Tables
### Aliases: tidy_levels_labels

### ** Examples

#* Descriptors for lm output with no interactions
mtcars2 <- mtcars
mtcars2$mpg <- labelVector::set_label(mtcars2$mpg, "Gas Mileage")
mtcars2$qsec <-  labelVector::set_label(mtcars2$qsec, "Quarter Mile Time")
mtcars2$am <-  labelVector::set_label(mtcars2$am, "Transmission")
mtcars2$wt <-  labelVector::set_label(mtcars2$wt, "Weight")
mtcars2$gear <-  labelVector::set_label(mtcars2$gear, "Gears")

#* Basic Output for a model with no interactions
#* Note: numeric_level has no impact as there are no
#*       interactions involving numeric variables.

fit <- lm(mpg ~ qsec + factor(am) + wt + factor(gear), data = mtcars2)

pixiedust:::tidy_levels_labels(fit, 
  descriptors = c("term", "term_plain", "label", "level", "level_detail"),
  numeric_level = "term") 
  
#* Assign factors ahead of the model. This allows 
#* the user to determine the levels that display.
#* Compare the output for 'am' with the output for 'gear'

mtcars2$am <- factor(mtcars2$am, 0:1, c("Automatic", "Manual"))
mtcars2$am <-  labelVector::set_label(mtcars2$am, "Transmission") 
    # Label was lost in variable conversion
fit <- lm(mpg ~ qsec + am + wt + factor(gear), data = mtcars2)
pixiedust:::tidy_levels_labels(fit, 
  descriptors = c("term", "term_plain", "label", "level", "level_detail"),
  numeric_level = "term") 
  
  
#* Include an interaction between a factor and numeric.

fit <- lm(mpg ~ qsec + am * wt + factor(gear), data = mtcars2)
pixiedust:::tidy_levels_labels(fit, 
  descriptors = c("term", "term_plain", "label", "level", "level_detail"),
  numeric_level = "term") 
  
#* Now observe how 'level' and 'level_detail' change 
#* in the interaction terms as we choose different 
#* values for 'numeric_level'

pixiedust:::tidy_levels_labels(fit, 
  descriptors = c("term", "term_plain", "label", "level", "level_detail"),
  numeric_level = "term_plain")
  
pixiedust:::tidy_levels_labels(fit, 
  descriptors = c("term", "term_plain", "label", "level", "level_detail"),
  numeric_level = "label")  



