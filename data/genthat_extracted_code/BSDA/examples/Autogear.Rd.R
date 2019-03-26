library(BSDA)


### Name: Autogear
### Title: Number of defective auto gears produced by two manufacturers
### Aliases: Autogear
### Keywords: datasets

### ** Examples


t.test(defectives ~ manufacturer, data = Autogear)
wilcox.test(defectives ~ manufacturer, data = Autogear)
t.test(defectives ~ manufacturer, var.equal = TRUE, data = Autogear)




