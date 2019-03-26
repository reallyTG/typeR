library(expss)


### Name: criteria
### Title: Criteria functions
### Aliases: criteria eq ne neq lt gt le lte ge gte perl regex fixed thru
###   %thru% from to items not_na other as.criterion

### ** Examples

# operations on vector
1:6 %d% gt(4) # 1:4

1:6 %d% (1 | gt(4)) # 2:4

letters %i% (fixed("a") | fixed("z")) # a, z

letters %i% from("w")  # w, x, y, z

letters %i% to("c")  # a, b, c

letters %i% (from("b") & to("e"))  # b, d, e

c(1, 2, NA, 3) %i% other # c(1, 2, 3)

# examples with count_if
df1 = data.frame(
    a=c("apples", "oranges", "peaches", "apples"),
    b = c(32, 54, 75, 86)
)

count_if(gt(55), df1$b) # greater than 55 = 2

count_if(ne(75), df1$b) # not equal 75 = 3

count_if(ge(32), df1$b) # greater than or equal 32 = 4

count_if(gt(32) & lt(86), df1$b) # greater than 32 and less than 86 = 2

# via different kinds of 'thru'
count_if(thru(35, 80), df1$b) # greater than or equals to 35 and less than or equals to 80 = 2
# infix version
count_if(35 %thru% 80, df1$b) # greater than or equals to 35 and less than or equals to 80 = 2

# values that started on 'a'
count_if(regex("^a"), df1) # 2

# count_row_if
count_row_if(regex("^a"), df1) # c(1,0,0,1)

# examples with 'keep' and 'except'

data(iris)
iris %>% keep(to("Petal.Width")) # column 'Species' will be removed 
 
# 'Sepal.Length', 'Sepal.Width' will be left 
iris %>% except(from("Petal.Length"))

# except first column
iris %n_d% items(1)

# if_val examples
# From SPSS: RECODE QVAR(1 THRU 5=1)(6 THRU 10=2)(11 THRU HI=3)(ELSE=0).
set.seed(123)
qvar = sample((-5):20, 50, replace = TRUE)
recode(qvar, 1 %thru% 5 ~ 1, 6 %thru% 10 ~ 2, 11 %thru% hi ~ 3, other ~ 0)
# the same result
recode(qvar, 1 %thru% 5 ~ 1, 6 %thru% 10 ~ 2, ge(11) ~ 3, other ~ 0)





