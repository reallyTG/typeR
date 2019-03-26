library(vcd)


### Name: assoc
### Title: Extended Association Plots
### Aliases: assoc assoc.default assoc.formula
### Keywords: hplot

### ** Examples

data("HairEyeColor")
## Aggregate over sex:
(x <- margin.table(HairEyeColor, c(1, 2)))

## Ordinary assocplot:
assoc(x)
## and with residual-based shading (of independence)
assoc(x, main = "Relation between hair and eye color", shade = TRUE)

## Aggregate over Eye color:
(x <- margin.table(HairEyeColor, c(1, 3)))
chisq.test(x)
assoc(x, main = "Relation between hair color and sex", shade = TRUE)

# Visualize multi-way table
assoc(aperm(HairEyeColor), expected = ~ (Hair + Eye) * Sex,
      labeling_args = list(just_labels = c(Eye = "left"),
                           offset_labels = c(right = -0.5),
                           offset_varnames = c(right = 1.2),
                           rot_labels = c(right = 0),
                           tl_varnames = c(Eye = TRUE))
)

assoc(aperm(UCBAdmissions), expected = ~ (Admit + Gender) * Dept, compress = FALSE,
      labeling_args = list(abbreviate = c(Gender = TRUE), rot_labels = 0)
)



