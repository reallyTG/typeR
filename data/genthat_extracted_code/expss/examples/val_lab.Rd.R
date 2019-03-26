library(expss)


### Name: val_lab
### Title: Set or get value labels
### Aliases: val_lab val_lab<- set_val_lab add_val_lab add_val_lab<- unvl
###   drop_val_labs make_labels drop_unused_labels num_lab lab_num autonum

### ** Examples

# toy example
set.seed(123)
# score - evaluation of tested product

score = sample(-1:1,20,replace = TRUE)
var_lab(score) = "Evaluation of tested brand"
val_lab(score) = c("Dislike it" = -1,
                   "So-so" = 0,
                   "Like it" = 1    
                   )

# frequency of product scores                                      
fre(score)

# brands - multiple response question
# Which brands do you use during last three months? 

brands = as.sheet(t(replicate(20,sample(c(1:5,NA),4,replace = FALSE))))

var_lab(brands) = "Used brands"
val_lab(brands) = make_labels("
                              1 Brand A
                              2 Brand B
                              3 Brand C
                              4 Brand D
                              5 Brand E
                              ")


# percentage of used brands
fre(brands)

# percentage of brands within each score
cro_cpct(brands, score)

## make labels from text copied from questionnaire

age = c(1, 2, 1, 2)

val_lab(age) = num_lab("
 1. 18 - 26
 2. 27 - 35
")

# note support of value lables in base R
table(age)

# or, if in original codes is on the right side

products = 1:8

val_lab(products) = lab_num("
 Chocolate bars    1
 Chocolate sweets (bulk)	2
 Slab chocolate(packed)	3
 Slab chocolate (bulk)	4
 Boxed chocolate sweets	5
 Marshmallow/pastilles in chocolate coating	6
 Marmalade in chocolate coating	7
 Other	8
")

table(products)



