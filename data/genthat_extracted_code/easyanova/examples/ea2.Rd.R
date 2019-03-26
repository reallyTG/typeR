library(easyanova)


### Name: ea2
### Title: Analysis of variance in factorial and split plot
### Aliases: ea2

### ** Examples


# double factorial

# completely randomized design
data(data5)
r1=ea2(data5, design=1) 
r1  

# randomized block design
# data(data6)
# r2=ea2(data6, design=2) 
# r2      
 
# names(r1)

# names(r2)

# triple factorial

# completely randomized design
# data(data9)
# r3=ea2(data9[,-4], design=7) 
# r3[1]  


# split plot

# completely randomized design
# data(data7)
# r4=ea2(data7, design=4)
# r4

# randomized block design
# data(data8)
# r5=ea2(data8, design=5)
# r5

# hierarchical blocks
# Ramalho et al. (2005)
# data(data18)
# data18
# r6=ea2(data18, design=11)
# r6

# hierarchical latin squares 
# Sampaio (2010)
# data(data19)
# data19
# r7=ea2(data19, design=12)
# r8=ea2(data19, design=13)

# hierarchical rows
# r7

# hierarchical rows and columns
# r8
        



