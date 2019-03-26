library(expss)


### Name: vars
### Title: Get variables/range of variables by name/by pattern.
### Aliases: vars vars_list indirect indirect_list %to% %to_list% .. ..f
###   ..p
### Keywords: datasets

### ** Examples

# In data.frame
dfs = data.frame(
    a = rep(1, 5),
    b_1 = rep(11, 5),
    b_2 = rep(12, 5),
    b_3 = rep(13, 5),
    b_4 = rep(14, 5),
    b_5 = rep(15, 5) 
)

# calculate sum of b_* variables
compute(dfs, {
    b_total = sum_row(b_1 %to% b_5)
})

# identical result
compute(dfs, {
    b_total = sum_row(..f(b_))
})

# In global environement
a = rep(10, 5)
a1 = rep(1, 5)
a2 = rep(2, 5)
a3 = rep(3, 5)
a4 = rep(4, 5)
a5 = rep(5, 5)

# identical results
a1 %to% a5
vars(perl("^a[0-9]$"))
..[perl("^a[0-9]$")]
..p("^a[0-9]$")

# sum each row
sum_row(a1 %to% a5)

# variable substitution
name1 = "a"
name2 = "new_var"

# in global environment
..$name1 # give as variable 'a'

..$name2 = ..$name1 * 2 # create variable 'new_var' which is equal to 'a' times 2
new_var

# inside data.frame
compute(dfs, {
     ..$name2 = ..$name1*2    
})

compute(dfs, {
     for(name1 in paste0("b_", 1:5)){
         name2 = paste0("new_", name1) 
         ..$name2 = ..$name1*2 
     }
     rm(name1, name2) # we don't need this variables as columns in 'dfs'
})

# square brackets notation - multi-assignment
name1 = paste0("b_", 1:5)
compute(dfs, {
          # round brackets about 'name1' is needed to avoid using it 'as is'
         ..[paste0("new_", name1)] = ..[(name1)]*2  
})

# the same result
# note the automatic creation of sequence of variables
compute(dfs, {
         ..[new_b_1 %to% new_b_5] = ..[b_1 %to% b_5]*2  
})

# assignment form of 'recode' on multiple variables
compute(dfs, {
         recode(..[b_1 %to% b_5]) = 13 %thru% hi ~ 20   
})

# empty brackets - unboxing of dichotomy.
compute(dfs, {
         ..[] =  as.dichotomy(b_1 %to% b_5, prefix = "v_")   
})



