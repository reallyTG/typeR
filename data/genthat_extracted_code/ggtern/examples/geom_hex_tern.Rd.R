library(ggtern)


### Name: geom_hex_tern
### Title: Hexbin (ggtern version).
### Aliases: geom_hex_tern GeomHexTern stat_hex_tern StatHexTern
###   GeomTriTern
### Keywords: datasets

### ** Examples

set.seed(1)
n  = 1000
df = data.frame(x  = runif(n),
                y  = runif(n),
                z  = runif(n),
                wt = runif(n))
                
#Equivalent of Hexbin
ggtern(df,aes(x,y,z)) + 
    geom_hex_tern(binwidth=0.1)
    
#Calculate Mean of variable wt
ggtern(df,aes(x,y,z)) + 
     geom_hex_tern(binwidth=0.05,
                   aes(value=wt),
                   fun=mean)

#Custom functions, for ex. discrete output...
myfun = function(x) sample(LETTERS,1)
ggtern(df,aes(x,y,z)) + 
     geom_hex_tern(binwidth=0.05,
                   fun=myfun)




