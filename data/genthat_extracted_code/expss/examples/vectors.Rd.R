library(expss)


### Name: vectors
### Title: Infix operations on vectors - append, diff, intersection, union,
###   replication
### Aliases: vectors %a% v_union %u% v_diff %d% v_intersect %i% v_xor %e%
###   %r% n_intersect %n_i% n_diff %n_d%

### ** Examples


1:4 %a% 5:6   # 1:6

1:4 %a% 4:5   # 1,2,3,4,4,5

1:4 %u% 4:5   # 1,2,3,4,5

1:6 %d% 5:6   # 1:4

# function as criterion
1:6 %d% gt(4) # 1:4

1:4 %i% 4:5   # 4

# function as criterion
letters %i% perl("[a-d]") # a,b,c,d

# function as criterion 
letters %i% (fixed("a") | fixed("z")) # a, z

1:4 %e% 4:5   # 1, 2, 3, 5

1:2 %r% 2     # 1, 2, 1, 2

# %n_i%, %n_d%

# remove column Species
iris %n_d% "Species" 

# leave only columns which names start with "Sepal"
iris %n_i% perl("^Sepal") 

# leave column "Species" and columns which names start with "Sepal" 
iris %n_i% (perl("^Sepal")|"Species") 




