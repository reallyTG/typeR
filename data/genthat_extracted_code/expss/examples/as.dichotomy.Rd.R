library(expss)


### Name: as.dichotomy
### Title: Convert variable (possibly multiple choice question) to
###   data.frame/matrix of dummy variables.
### Aliases: as.dichotomy dummy dummy1 is.dichotomy

### ** Examples

# toy example
# brands - multiple response question
# Which brands do you use during last three months? 
set.seed(123)
brands = as.sheet(t(replicate(20,sample(c(1:5,NA),4,replace = FALSE))))
# score - evaluation of tested product
score = sample(-1:1,20,replace = TRUE)
var_lab(brands) = "Used brands"
val_lab(brands) = autonum("
                              Brand A
                              Brand B
                              Brand C
                              Brand D
                              Brand E
                              ")

var_lab(score) = "Evaluation of tested brand"
val_lab(score) = make_labels("
                             -1 Dislike it
                              0 So-so
                              1 Like it    
                             ")

cro_cpct(as.dichotomy(brands), score)
# the same as
cro_cpct(mrset(brands), score)

# customer segmentation by used brands
kmeans(dummy(brands), 3)

# model of influence of used brands on evaluation of tested product 
summary(lm(score ~ dummy(brands)))

# prefixed data.frame 
as.dichotomy(brands, prefix = "brand_")




