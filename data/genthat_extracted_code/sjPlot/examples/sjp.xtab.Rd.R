library(sjPlot)


### Name: sjp.xtab
### Title: Plot contingency tables
### Aliases: sjp.xtab

### ** Examples

# create 4-category-items
grp <- sample(1:4, 100, replace = TRUE)
# create 3-category-items
x <- sample(1:3, 100, replace = TRUE)

# plot "cross tablulation" of x and grp
sjp.xtab(x, grp)

# plot "cross tablulation" of x and y, including labels
sjp.xtab(x, grp, axis.labels = c("low", "mid", "high"),
         legend.labels = c("Grp 1", "Grp 2", "Grp 3", "Grp 4"))

# plot "cross tablulation" of x and grp
# as stacked proportional bars
sjp.xtab(x, grp, margin = "row", bar.pos = "stack",
         show.summary = TRUE, coord.flip = TRUE)

# example with vertical labels
library(sjmisc)
library(sjlabelled)
data(efc)
set_theme(geom.label.angle = 90)
sjp.xtab(efc$e42dep, efc$e16sex, vjust = "center", hjust = "bottom")

# grouped bars with EUROFAMCARE sample dataset
# dataset was importet from an SPSS-file,
# see ?sjmisc::read_spss
data(efc)
efc.val <- get_labels(efc)
efc.var <- get_label(efc)

sjp.xtab(efc$e42dep, efc$e16sex, title = efc.var['e42dep'],
         axis.labels = efc.val[['e42dep']], legend.title = efc.var['e16sex'],
         legend.labels = efc.val[['e16sex']])

sjp.xtab(efc$e16sex, efc$e42dep, title = efc.var['e16sex'],
         axis.labels = efc.val[['e16sex']], legend.title = efc.var['e42dep'],
         legend.labels = efc.val[['e42dep']])

# -------------------------------
# auto-detection of labels works here
# so no need to specify labels. For
# title-auto-detection, use NULL
# -------------------------------
sjp.xtab(efc$e16sex, efc$e42dep, title = NULL)

sjp.xtab(efc$e16sex, efc$e42dep, margin = "row",
         bar.pos = "stack", coord.flip = TRUE)




