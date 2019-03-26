library(Epi)


### Name: Relevel
### Title: Reorder and combine levels of a factor
### Aliases: Relevel Relevel.factor
### Keywords: manip

### ** Examples

# Grouping using a list (hard coding)
#
ff <- factor( sample( letters[1:5], 100, replace=TRUE ) )
table( ff, Relevel( ff, list( AB=1:2, "Dee"=4, c(3,5) ) ) )
table( ff, Relevel( ff, list( 5:4, Z=c("c","a") ), coll="-und-",first=FALSE ) )

## Grouping using a two-column matrix as input:
## A factor with levels to be grouped together
ff <- factor( c("Bear","Bear","Crocodile","Snake","Crocodile","Bear") )
ff
## A grouping table
( gg <- data.frame( Animal=c("Bear","Whale","Crocodile","Snake","Eagle"),
                     Class=c("Mammal","Mammal","Reptile","Reptile","Bird") ) )
Relevel( ff, gg, xlevels=FALSE )
Relevel( ff, gg )
Relevel( ff, gg[c(1:5,5:1),] )

## This crashes with an error
try( Relevel( ff, rbind( gg, c("Bear","Reptile") ) ) )

ff <- factor(c(as.character(ff),"Jellyfish","Spider"))
Relevel( ff, gg )
Relevel( ff, gg, xlevels=FALSE )
# If you do not want unknown animals classified, this returns NAs:
Relevel( ff, gg, nogroup=FALSE )
# Will give error because re-classification is ambiguous
( GG <- rbind(gg,c("Eagle","Mammal"),c("Snake","Mammal")) )
try( Relevel( ff, GG ) )



