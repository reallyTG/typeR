library(vcd)


### Name: labeling_border
### Title: Labeling Functions for Strucplots
### Aliases: labeling_border labeling_conditional labeling_left
###   labeling_left2 labeling_cboxed labeling_lboxed labeling_doubledecker
###   labeling_values labeling_residuals labelings
### Keywords: hplot

### ** Examples

data("Titanic")

mosaic(Titanic)

mosaic(Titanic, labeling = labeling_left)
labeling_left

mosaic(Titanic, labeling = labeling_cboxed)
labeling_cboxed

mosaic(Titanic, labeling = labeling_lboxed)
labeling_lboxed

data("PreSex")
mosaic(~ PremaritalSex + ExtramaritalSex | Gender + MaritalStatus,
  data = PreSex, labeling = labeling_conditional)

## specification of vectorized arguments 
mosaic(Titanic, labeling_args = list(abbreviate_labs = c(Survived = TRUE)))

mosaic(Titanic, labeling_args = list(clip = TRUE, boxes = TRUE,
  fill_boxes = c(Survived = "green", "red")))

mosaic(Titanic, labeling_args = list(clip = TRUE, boxes = TRUE,
  fill_boxes = list(Sex = "red", "green")))

mosaic(Titanic, labeling_args = list(clip = TRUE, boxes = TRUE,
  fill_boxes = list(Sex = c(Male = "red", "blue"), "green")))

## change variable names
mosaic(Titanic, labeling_args = list(set_varnames = c(Sex = "Gender")))

## change labels
mosaic(Titanic, labeling_args = list(set_varnames = c(Survived = "Status"),
  set_labels = list(Survived = c("Survived", "Not Survived")), rep = FALSE))

## show frequencies
mosaic(Titanic, labeling = labeling_values)



