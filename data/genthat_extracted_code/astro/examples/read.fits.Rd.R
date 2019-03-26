library(astro)


### Name: read.fits
### Title: Read FITS Files
### Aliases: read.fits .read.fits.hdr .parse.fits.hdr .read.fits.image
###   .read.fits.table
### Keywords: data

### ** Examples


require(astro)

# create fake data
dat1 = matrix(rnorm(100*50),100,50)
dat2 = matrix(rnorm(50*25),25,50)

# create multi-HDU FITS image
write.fits(list(dat1,dat2), file="astro.fits")
grep("astro.fits", dir(), value=TRUE)

# read FITS image
x = read.fits("astro.fits")
summary(x)

# show keywords in primary header
x$hdr[[1]][,"key"]

# add keywords into secondary header
write.fitskey(key=c("A","COMMENT"), value=c("B","N/A"), file="astro.fits", 
comment=c("C","astro.fits created by the 'astro' package"), hdu=2)

# print values of 'NAXIS1' and 'A' from secondary header
read.fitskey(c("NAXIS1","A"), "astro.fits", hdu=2)

# create a plot
x = read.fits("astro.fits")
layout(cbind(c(1,2),c(1,3)), widths=c(1,2))
par("mar"=c(3.1,3.1,1.1,1.1))
im1 = x$dat[[1]]
im2 = x$dat[[2]]
image(1:dim(im1)[1], 1:dim(im1)[2], im1, asp=1, xlab="", ylab="")
label("topleft", txt="HDU 1", cex=2, lwd=0)
box()
image(1:dim(im2)[1], 1:dim(im2)[2], im2, asp=1, xlab="", ylab="", 
col=rainbow(1000))
label("topleft", txt="HDU 2", cex=2, lwd=0)
box()
par("mar"=c(3.1,0,1.1,1.1))
aplot(sin, type="n", axes=FALSE, xlab="", ylab="")
hdr = x$hdr[[2]]
ktxt = paste("** astro.fits: HDU 2 Header **\n\nKey\n-----\n",
paste(hdr[,"key"],collapse="\n",sep=""),collapse="",sep="")
vtxt = paste("\n\nValue\n-----\n",paste(hdr[,"value"],collapse="\n",sep=""),
collapse="",sep="")
mtxt = paste("\n\nComment\n-----\n",paste(hdr[,"comment"],collapse="\n",sep=""),
collapse="",sep="")
label("topleft", txt=ktxt, align="left", bty="n")
label("topleft", txt=vtxt, align="left", bty="n", inset=c(1,0.08))
label("topleft", txt=mtxt, align="left", bty="n", inset=c(2,0.08))
label("bottom", txt="note: 'astro.fits' has been automatically deleted", 
bty="n", col="blue", cex=1.5)

unlink("astro.fits")




