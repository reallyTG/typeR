library(expss)


### Name: fre
### Title: Simple frequencies with support of labels, weights and multiple
###   response variables.
### Aliases: fre

### ** Examples

data(mtcars)
mtcars = modify(mtcars,{
    var_lab(vs) = "Engine"
    val_lab(vs) = c("V-engine" = 0, 
                    "Straight engine" = 1) 
    var_lab(am) = "Transmission"
    val_lab(am) = c(automatic = 0, 
                    manual=1)
})

fre(mtcars$vs)

# stacked frequencies
fre(list(mtcars$vs, mtcars$am))

# multiple-choice variable
# brands - multiple response question
# Which brands do you use during last three months? 
set.seed(123)
brands = data.frame(t(replicate(20,sample(c(1:5,NA),4,replace = FALSE))))
# score - evaluation of tested product
score = sample(-1:1,20,replace = TRUE)
var_lab(brands) = "Used brands"
val_lab(brands) = make_labels("
                              1 Brand A
                              2 Brand B
                              3 Brand C
                              4 Brand D
                              5 Brand E
                              ")

var_lab(score) = "Evaluation of tested brand"
val_lab(score) = make_labels("
                             -1 Dislike it
                             0 So-so
                             1 Like it    
                             ")

fre(brands)

# stacked frequencies
fre(list(score, brands))




