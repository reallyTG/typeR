library(agridat)


### Name: gomez.stripsplitplot
### Title: Rice strip-split-plot experiment
### Aliases: gomez.stripsplitplot

### ** Examples


data(gomez.stripsplitplot)
dat <- gomez.stripsplitplot

# Layout
if(require(desplot)){
  desplot(gen ~ col*row, dat,
          out1=rep, col=nitro, text=planting, cex=1,
          main="gomez.stripsplitplot")
}


# Gomez table 4.19, ANOVA of strip-split-plot design
dat <- transform(dat, nf=factor(nitro))
m1 <- aov(yield ~ nf * gen * planting +
          Error(rep + rep:nf + rep:gen + rep:nf:gen), data=dat)
summary(m1)

## Not run: 
##D # There is a noticeable linear trend along the y coordinate which may be
##D # an artifact that blocking will remove, or may need to be modeled.
##D # Note the outside values in the high-nitro boxplot.
##D require("HH")
##D   interaction2wt(yield ~ nitro + gen + planting + row, dat,
##D                  x.between=0, y.between=0,
##D                  x.relation="free")
## End(Not run)



