library(pems.utils)


### Name: 2.2.1.generic.pems.handlers
### Title: Generic handling of pems objects
### Aliases: 2.2.1.generic.pems.handlers generic.pems.handlers
###   pems.generics as.data.frame.pems as.data.frame dim.pems dim $.pems $
###   $<-.pems $<- [.pems [ [<-.pems [<- [[.pems [[ [[<-.pems [[<-
###   with.pems with subset.pems subset head.pems head tail.pems tail
###   names.pems names names<-.pems names<- print.pems print plot.pems
###   summary.pems na.omit.pems na.omit units.pems units units<-.pems
###   units<-
### Keywords: methods

### ** Examples


##example 1
##basics pems handling

#extract a subset pems object from pems.1
a <- pems.1[1:4, 1:5]
a      

#indices work like data.frame
#a[x] and a[,x] recovers element/column number x
#a[x,] recovers row number x
#a["name"] and a[,"name"] recovers element/column named "name"
#a[4:5, "name"] recovers rows 4 to 5 of element/column named "name"
#a[x,y] <- z inserts z into a at row x, element y 
#etc

#insert 10 in at element 3, row 2
a[2,3] <- 10
a

#replace element conc.co2 with conc.co
a["conc.co2"] <- a$conc.co
a

#Note: by default pems objects subsetting and inserting is 
#more rigorous than data.frame subsetting/insertion
#for example, a[1:2, "conc.hc"] <- 8 would generate error
#because the target, a[1:2], and insert, 8, dimensions do not 
#match exactly: target 2 x 1; insert 1 x 1 

#By default no wrapping is applied.  

#the force argument allows the user to control how mismatching 
#targets and insertions are handled

#na pad target for larger insert
a[1:2, "conc.hc", force="na.pad.target"] <- 1:5
a

#Note here when the target is padded existing enteries are NOT 
#overwritten if they are not declared in a[], and the next 
#previously unassigned cells are used for any extra cases in
#the insert.

#wrap insert to fill hole made by a[i,j]  
a[1:2, "conc.hc", force="fill.insert"] <- 8
a

#pems$name <- value is equivalent to 
#pems[name, force=c("na.pad.target", "na.pad.insert")]
a$new <- 1:4
a




