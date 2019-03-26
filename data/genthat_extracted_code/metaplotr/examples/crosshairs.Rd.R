library(metaplotr)


### Name: crosshairs
### Title: Creates a Cross-hairs Plot.
### Aliases: cross-hairs crosshairs

### ** Examples

## Not run: 
##D # Load and attach metaplotr package to the Global Environment
##D library(metaplotr)
##D 
##D # Remove all variables in the .GlobalEnv, effectively clearing .GlobalEvn
##D rm(list = ls())
##D 
##D # Find out more about the data set from Ferguson and Brannick (2012)
##D # help("FergusonBrannick2012")
##D 
##D # You can check out help file of the \code{crosshairs} function.
##D # help(crosshairs)
## End(Not run)

# Basic usage of the \code{crosshairs} function.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se)

## Not run: 
##D # whis_on option opens and closes whiskers.
##D crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
##D FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
##D whis_on = FALSE)
## End(Not run)

# confint option can control whiskers length.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .7)

crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .2)
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .95)

# Main and axes labels can be changed.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
main_lab = 'Different Main Label', x_lab = 'Different X Label',
y_lab = 'Different Y Label')

# Annotated correlation and meand values can be added to the graph.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, annotate = TRUE,
main_lab = 'Annotated Graph')

# Boxplots can be hidden.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
main_lab = 'No Boxplots', bxplts = FALSE)

## Not run: 
##D # Moderator legend and annotations can be used simulaneously.
##D crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
##D FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
##D mdrtr = FergusonBrannick2012$mod, annotate = TRUE,
##D main_lab = 'Moderator Legend and Annotation')
##D 
##D # Moderator legend position can be adjusted.
##D crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
##D FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
##D mdrtr = FergusonBrannick2012$mod, mdrtr_lab_pos = c(0.8, 0.8),
##D main_lab = 'Moderator Legend Position Change')
##D 
##D # Dot size can be changed.
##D crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
##D FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
##D mdrtr = FergusonBrannick2012$mod, pnt_size = 6,
##D main_lab = 'Bigger Dots')
##D 
##D # Size of labels can be changed.
##D crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
##D FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
##D mdrtr = FergusonBrannick2012$mod, lab_size = 20,
##D main_lab = 'Label Size Change')
## End(Not run)




