library(lucid)


### Name: antibiotic
### Title: Effectiveness of 3 antibiotics against 16 bacterial species.
### Aliases: antibiotic
### Keywords: datasets

### ** Examples


data(antibiotic)
lucid(antibiotic)

## Not run: 
##D # Plot the data similar to Fig 2.14 of Wainer's book, "Medical Illuminations"
##D 
##D require(lattice)
##D require(reshape2)
##D 
##D # Use log10 transform
##D dat <- transform(antibiotic,
##D                  penicillin=log10(penicillin),
##D                  streptomycin=log10(streptomycin),
##D                  neomycin=log10(neomycin))
##D dat <- transform(dat, sgn = ifelse(dat$gramstain=="neg", "-", "+"))
##D dat <- transform(dat,
##D                  bacteria = paste(bacteria, sgn))
##D dat <- transform(dat, bacteria=reorder(bacteria, -penicillin))
##D 
##D dat <- melt(dat)
##D 
##D op <- tpg <- trellis.par.get()
##D tpg$superpose.symbol$pch <- toupper(substring(levels(dat$variable),1,1))
##D tpg$superpose.symbol$col <- c("darkgreen","purple","orange")
##D trellis.par.set(tpg)
##D dotplot(bacteria ~ value, data=dat, group=variable,
##D         cex=2,
##D         scales=list(x=list(at= -3:3,
##D                       labels=c('.001', '.01', '.1', '1', '10', '100', '1000'))),
##D         main="Bacterial response to Neomycin, Streptomycin, and Penicillin",
##D         xlab="Minimum Inhibitory Concentration (mg/L)")
##D 
##D trellis.par.set(op)
##D 
## End(Not run)





