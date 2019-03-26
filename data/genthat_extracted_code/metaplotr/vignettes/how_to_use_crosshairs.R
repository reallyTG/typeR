## ------------------------------------------------------------------------
library(metaplotr)

## ---- eval = FALSE-------------------------------------------------------
#  help('metaplotr')

## ---- eval = FALSE-------------------------------------------------------
#  help('crosshairs')

## ------------------------------------------------------------------------
rm(list = ls())

## ------------------------------------------------------------------------
attach(FergusonBrannick2012)

## ------------------------------------------------------------------------
crosshairs(pub_z, dis_z, pub_z_se, dis_z_se)

## ------------------------------------------------------------------------
# confint option can control whiskers length. 
crosshairs(pub_z, dis_z, pub_z_se, dis_z_se, confint = .7)

# You can see results of different whisker lengths. 
crosshairs(pub_z, dis_z, pub_z_se, dis_z_se, confint = .95)
crosshairs(pub_z, dis_z, pub_z_se, dis_z_se, confint = .3)

## ------------------------------------------------------------------------
# use whis_on argument.
crosshairs(pub_z, dis_z, pub_z_se, dis_z_se, whis_on = FALSE)

## ------------------------------------------------------------------------
# Main and axes labels can be changed.
crosshairs(pub_z, dis_z, pub_z_se, dis_z_se, 
           main_lab = 'Published vs. Dissertation Effect Sizes', 
           x_lab = 'Published Studies', 
           y_lab = 'Dissertations')

## ------------------------------------------------------------------------
# We will use another data set by attaching it.
attach(Sweeney2015)

# You can find information regarding this data set as usual.
# help('Sweeney2015')

# Add descriptive statistics to graph.
crosshairs(inten_d, beh_d, inten_se, beh_se, 
           main_lab = 'Sweeney (2015) Data', 
           x_lab = 'Intentions', 
           y_lab = 'Behaviors', 
           annotate = TRUE)  # use annotate argument

## ------------------------------------------------------------------------
# Boxplots will be hidden.
crosshairs(inten_d, beh_d, inten_se, beh_se, 
           main_lab = 'Sweeney (2015) Data', 
           x_lab = 'Intentions', 
           y_lab = 'Behaviors', 
           annotate = TRUE, 
           bxplts = FALSE)   

## ------------------------------------------------------------------------
# Add moderator and label.
attach(GenderDiff02)  # attach dataframe to working environment

# help('GenderDiff02')
crosshairs(men_z, women_z, men_se, women_se, 
           main_lab = 'Ali et al. Psychopathology and Parental Acceptance', 
           x_lab = 'Men', 
           y_lab = 'Women', 
           mdrtr = region, 
           mdrtr_lab = 'Region', 
           mdrtr_lab_pos = c(.1, .5))   

## ------------------------------------------------------------------------
# McLeod2007 data frame is used in this graph.
# help('McLeod2007')
attach(McLeod2007)  # attach dataframe to working environment

# metafor package is needed for this graph. If you do not have this package use 
# install.packages('metafor') 
# and load metafor.
library(metafor)

# using rma() function of metafor package. 
res1 <- rma(yi = z, vi = var, method = 'DL', data = McLeod2007)

# Estimates best linear unbiased predictors. 
res2 <- blup(res1)

# You can see the resuling data frame.
head(res2, 15)

# Assign data to x, standard error of x, y, standard error of y, 
# variable name of a moderator (if any) here. Note how the names 
# and values of the x variables come from the McLeod2007 dataset. 
# The names and values of the shrunken estimates came from 
# the output of the metafor program.
x1 <- McLeod2007$z
se.x1 <- sqrt(McLeod2007$var)
y1 <- res2$pred
se.y1 <- res2$se

# Create the plot.
crosshairs(x1, y1, se.x1, se.y1, 
           main_lab = 'Effects of Empirical Bayes Estimation', 
           x_lab = 'Parenting and Depression Correlations', 
           y_lab = 'Shrunken Estimates', 
           annotate = TRUE,
           whis_on = FALSE)

