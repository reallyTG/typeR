library(QCA)


### Name: recode
### Title: Recode a variable
### Aliases: recode
### Keywords: functions

### ** Examples

x <- rep(1:3, 3)
x
#  [1] 1 2 3 1 2 3 1 2 3

recode(x, "1:2 = A; else = B")
#  [1] "A" "A" "B" "A" "A" "B" "A" "A" "B"

recode(x, "1:2 = 0; else = copy")
#  [1] 0 0 3 0 0 3 0 0 3

set.seed(1234)
x <- factor(sample(letters[1:10], 20, replace = TRUE),
          levels = letters[1:10])
x
#  [1] b g g g i g a c g f g f c j c i c c b c
# Levels: a b c d e f g h i j

recode(x, "b:d = 1; g:hi = 2; else = NA") # note the "hi" special value
#  [1]  1  2  2  2  2  2 NA  1  2 NA  2 NA  1  2  1  2  1  1  1  1

recode(x, "a, c:f = A; g:hi = B; else = C", as.factor.result = TRUE)
#  [1] C B B B B B A A B A B A A B A B A A C A
# Levels: A B C

recode(x, "a, c:f = 1; g:hi = 2; else = 3", as.factor.result = TRUE,
       labels = c("one", "two", "three"), ordered = TRUE)
#  [1] three two   two   two   two   two   one   one   two   one  
# [11] two   one   one   two   one   two   one   one   three one  
# Levels: one < two < three  

set.seed(1234)
categories <- c("An", "example", "that has", "spaces")
x <- factor(sample(categories, 20, replace = TRUE),
            levels = categories, ordered = TRUE)
sort(x)
#  [1] An       An       An       An       An       example 
#  [7] example  example  example  that has that has that has
# [13] that has that has that has that has that has spaces  
# [19] spaces   spaces  
# Levels: An < example < that has < spaces

recode(sort(x), "An : 'that has' = 1; spaces = 2")
#  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2

# same thing with
recode(sort(x), "An : that has = 1; spaces = 2")
#  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2

# same using cut values
recode(sort(x), cuts = "that has")
#  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2

# modifying the output values
recode(sort(x), cuts = "that has", values = 0:1)
#  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1

# more treatment of "else" values
x <- 10:20

# recoding rules don't overlap all existing values, the rest are empty
recode(x, "8:15=1")

# all other values are copied
recode(x, "8:15=1; else=copy")



