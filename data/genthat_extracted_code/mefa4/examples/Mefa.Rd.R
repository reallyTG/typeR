library(mefa4)


### Name: Mefa
### Title: 'Mefa' Class
### Aliases: Mefa Mefa-class MefaDataFrame MefaMatrix mefa stcs
###   MefaDataFrame-class MefaMatrix-class mefa-class stcs-class
###   dim,Mefa-method dimnames,Mefa-method dimnames<-,Mefa,list-method
###   t,Mefa-method show,Mefa-method stack,Mefa-method
### Keywords: manip

### ** Examples

x <- data.frame(
    sample = paste("Sample", c(1,1,2,2,3,4), sep="."),
    species = c(paste("Species", c(1,1,1,2,3), sep="."),  "zero.pseudo"),
    count = c(1,2,10,3,4,0))
samp <- data.frame(samples=levels(x$sample), var1=1:2)
taxa <- data.frame(specnames=levels(x$species), var2=c("b","a"))
rownames(samp) <- samp$samples
rownames(taxa) <- taxa$specnames

## Xtab class, counts by repetitions in RHS
(x0 <- Xtab(~ sample + species, x))

## counts by LHS and repetitions in RHS
(x1 <- Xtab(count ~ sample + species, x))

## drop all empty rows
(x2 <- Xtab(count ~ sample + species, x, cdrop=FALSE,rdrop=TRUE))

## drop all empty columns
Xtab(count ~ sample + species, x, cdrop=TRUE,rdrop=FALSE)

## drop specific columns by placeholder
Xtab(count ~ sample + species, x, cdrop="zero.pseudo")

## Mefa class, standard
(x3 <- Mefa(x1, samp, taxa))
unclass(x3)
x3@xtab
x3@samp
x3@taxa
x3@join

## effects of left join, NULL taxa slot, xtab is (not sparse) matrix
(x4 <- Mefa(as.matrix(x1), samp[1:2,]))
unclass(x4)

## effects of inner join (intersect)
(x5 <- Mefa(x2, samp, taxa, join="inner"))
unclass(x5)
unclass(Mefa(x1, samp[1:2,], join="inner"))

## xtab only Mefa
(x6 <- Mefa(x1))

## creating new Mefa object without Mefa()
new("Mefa", xtab=x1, samp=samp, taxa=taxa,join="left")

## dim and dimnames
dim(x5)
dimnames(x5)
dn <- list(paste("S", 1:3, sep=""), paste("SPP", 1:4, sep=""))
dimnames(x5) <- dn
unclass(x5)
dimnames(x5)[[1]] <- paste("S", 1:3, sep="_")
unclass(x5)
dimnames(x5)[[2]] <- paste("SPP", 1:4, sep="_")
unclass(x5)

## transpose
x5
t(x5)
unclass(x5)
unclass(t(x5))

## 0 and 1 row/col Mefa object
x3[c(FALSE,FALSE,FALSE,FALSE),c(FALSE,FALSE,FALSE,FALSE)]
x3[c(TRUE,FALSE,FALSE,FALSE),c(FALSE,FALSE,FALSE,FALSE)]
x3[c(FALSE,FALSE,FALSE,FALSE),c(TRUE,FALSE,FALSE,FALSE)]
x3[c(TRUE,FALSE,FALSE,FALSE),c(TRUE,FALSE,FALSE,FALSE)]

## stack
stack(x3)



