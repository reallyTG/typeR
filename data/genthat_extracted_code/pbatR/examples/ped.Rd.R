library(pbatR)


### Name: ped
### Title: Pedigree Object
### Aliases: as.ped as.pedlist is.ped is.pedlist read.ped fread.ped
###   write.ped is.pped as.pped read.pped sort.ped plotPed ped.markerNames
### Keywords: interface

### ** Examples

# A highly artificial example with not enough subjects to be run;
#  however, it demonstrates how to put data in it.
x <- data.frame( pid       = c(1,1,1,1,1),
                 id        = c(1,2,3,4,5),
                 idfath    = c(4,4,4,0,0),
                 idmoth    = c(5,5,5,0,0),
                 sex       = c(1,2,1,1,2),
                 AffectionStatus = c(1,0,0,1,0),
                 m1.a      = c(1,1,1,1,1),
                 m1.b      = c(1,2,1,1,2),
                 m2.a      = c(4,4,4,4,4),
                 m2.b      = c(3,3,3,4,3) )
x
myPed <- as.ped( x )          # Mark it with the class 'ped'
myPedlist <- as.pedlist( x )  # Instead mark it with 'pedlist'
myPed
myPedlist

# an alternate example of creating
names( x )[1:6] <- c( "mypedid", "subid", "fathid",
                      "mothid", "gender", "affection" );
x
myPed <- as.ped( x, pid="mypedid", id="subid", idfath="fathid",
                 idmoth="mothid", sex="gender", affection="affection" )
myPed  # Note it's the same as before!

myPed <- as.ped( myPedlist )       # Easy conversion back
myPedlist <- as.pedlist( myPed )   #  and forth between formats.



