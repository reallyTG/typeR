library(agridat)


### Name: kalamkar.wheat.uniformity
### Title: Uniformity trial of wheat
### Aliases: kalamkar.wheat.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(kalamkar.wheat.uniformity)
##D   dat <- kalamkar.wheat.uniformity
##D   plot(yield ~ ears, dat, main="kalamkar.wheat.uniformity")
##D   
##D   # totals match Kalamkar
##D   sum(dat$yield)
##D   sum(dat$ears)
##D   
##D   require(desplot)
##D   desplot(ears ~ col*row, dat,
##D           flip=TRUE, aspect=(80*0.5)/(16*1.64042), # true aspect
##D           main="kalamkar.wheat.uniformity - ears")
##D   desplot(yield ~ col*row, dat,
##D           flip=TRUE, aspect=(80*0.5)/(16*1.64042), # true aspect
##D           main="kalamkar.wheat.uniformity - yield")
##D 
##D   # Show the negative correlation between rows
##D   ## require(asreml)
##D   ## require(lucid)
##D   ## dat <- dat ##D 
##D   ##   arrange(rowf,colf)
##D   ## m1=asreml(yield ~ 1, data=dat, rcov= ~ ar1(rowf):ar1(colf))
##D   ## vc(m1)
##D   ##  ##     effect component std.error z.ratio constr
##D   ##  ## R!variance  81.54      3.527      23        P
##D   ##  ## R!rowf.cor  -0.09465   0.0277     -3.4      U
##D   ##  ## R!colf.cor   0.2977    0.02628    11        U
##D   
## End(Not run)



