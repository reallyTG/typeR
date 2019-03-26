library(metafor)


### Name: to.table
### Title: Convert Data from Vector to Table Format
### Aliases: to.table
### Keywords: manip

### ** Examples

### create tables
dat <- to.table(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
                data=dat.bcg, slab=paste(author, year, sep=", "),
                rows=c("Vaccinated", "Not Vaccinated"), cols=c("TB+", "TB-"))
dat

### create tables
dat <- to.table(measure="IRR", x1i=x1i, x2i=x2i, t1i=t1i, t2i=t2i,
                data=dat.hart1999, slab=paste(study, year, sep=", "),
                rows=c("Warfarin Group", "Placebo/Control Group"))
dat

### create tables
dat <- to.table(measure="MD", m1i=m1i, sd1i=sd1i, n1i=n1i,
                m2i=m2i, sd2i=sd2i, n2i=n2i, data=dat.normand1999,
                slab=source, rows=c("Specialized Care", "Routine Care"))
dat



