library(mefa4)


### Name: samp
### Title: Accessing and Replacing Parts of 'Mefa' Objects
### Aliases: xtab samp taxa xtab<- samp<- taxa<- [ xtab,Mefa-method
###   samp,Mefa-method taxa,Mefa-method xtab<-,Mefa,MefaMatrix-method
###   samp<-,Mefa,MefaDataFrame-method taxa<-,Mefa,MefaDataFrame-method
###   [,Mefa,ANY,ANY,ANY-method samp,mefa-method taxa,mefa-method
###   xtab,mefa-method
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
x1 <- Xtab(count ~ sample + species, x)
x3 <- Mefa(x1, samp, taxa)

## accessing the xtab slot
xtab(x3)
## replacing the slot value
x1[3,1] <- 999
xtab(x3) <- x1
xtab(x3)

## accessing and replacing the samp slot
samp(x3)
samp(x3) <- NULL
samp(x3)
samp(x3) <- samp[1:3,]
samp(x3)

## accessing and replacing the taxa slot
taxa(x3)
taxa(x3) <- NULL
taxa(x3)
taxa(x3) <- taxa[1:3,]
taxa(x3)

## subsetting
unclass(x3[3:2, 1:2])
unclass(x3[3:2,])
unclass(x3[,1:2])



