library(GameTheory)


### Name: ShapleyShubik
### Title: Shapley Shubik Power Index
### Aliases: ShapleyShubik

### ** Examples


## SHAPLEY - SHUBIK POWER INDEX APPLIED TO THE CATALAN PARLIAMENT

# 2012 Elections
SEATS<-c(50,20,21,19,13,9,3)
PARTIES<-c("CiU","PSC","ERC","PP","ICV","C's","CUP")
E2012<-ShapleyShubik(68,SEATS,PARTIES)
summary(E2012)

# Results for 2012 elections 

#                    CiU    PSC    ERC     PP     ICV    C's    CUP
# Votes           50.000 20.000 21.000 19.000 13.0000 9.0000 3.0000
# Votes (R)        0.370  0.148  0.156  0.141  0.0963 0.0667 0.0222
# Shapley-Shubik   0.533  0.133  0.133  0.133  0.0333 0.0333 0.0000





